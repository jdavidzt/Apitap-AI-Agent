"""
Database manager for MySQL platform databases (DBITEMS + DBCARDS + ecommerce demo)
Supports cross-database queries for e-commerce and payment customer service.
"""

import os
import logging
from typing import Optional, Dict, Any, List
import mysql.connector
from mysql.connector import Error
from contextlib import contextmanager

logger = logging.getLogger(__name__)

# Curated schema description for LLM context.
# Only includes tables/columns relevant for customer service queries.
PLATFORM_SCHEMA = """
=== DBITEMS (E-Commerce Platform) ===

Products: dbitems.tbl_product
  - tbl_product_id (PK), tbl_product_name, tbl_product_description
  - tbl_product_regularPrice, tbl_product_salePrice, tbl_product_saleDiscount
  - tbl_product_quantity (stock), tbl_product_brand, tbl_product_sku
  - tbl_product_condition_f (new/used), tbl_product_available_id
  - tbl_productstatus_id, tbl_producttype_id

Categories: dbitems.tbl_category
  - tbl_category_id (PK), tbl_category_parentId, tbl_category_level
  - tbl_category_order, tbl_category_active

Orders: dbitems.tbl_order
  - tbl_order_id (PK), tbl_user_id, tbl_order_number, tbl_order_date
  - tbl_orderstatus_id (FK -> tbl_orderstatus), tbl_order_total, tbl_order_subtotal
  - tbl_order_tax, tbl_order_tip, tbl_delivery_fee
  - tbl_order_customer_firstname, tbl_order_customer_lastname, tbl_order_customer_phone
  - tbl_order_delivery_address1, tbl_order_delivery_zipcode
  - tbl_order_note, tbl_order_delivery_instructions

Order Statuses: dbitems.tbl_orderstatus
  - tbl_orderstatus_id: 92001=Open, 92002=Done, 92003=Close, 92004=Cancel

Order Items: dbitems.tbl_orderdetail
  - tbl_orderdetail_id (PK), tbl_order_id (FK), tbl_product_id (FK)
  - tbl_orderdetail_qty, tbl_orderdetail_salePrice

Shopping Cart: dbitems.tbl_shoppingcart
  - tbl_shoppingcart_id (PK), tbl_shoppingcart_consumerNmcId
  - tbl_shoppingcartstatus_id, tbl_shoppingcart_dateCreated

=== DBCARDS (Payments) ===

Cards: dbcards.tbl_card
  - tbl_card_id, tbl_card_tocken (PK), tbl_user_id, tbl_card_number
  - tbl_card_nickname, tbl_card_chardHolderName, tbl_card_dateExpire
  - tbl_cardstype_id (FK -> tbl_cardstype), tbl_cardstatus_id (FK -> tbl_cardstatus)
  - tbl_paymentserviceprovider_id (FK)

Card Types: dbcards.tbl_cardstype
  - tbl_cardstype_id: 61=VISA, 62=MASTERCARD, 63=AMERICAN EXPRESS, 65=Discover, 66=Bank Account, 69=Debit Card

Card Status: dbcards.tbl_cardstatus
  - tbl_cardstatus_id: 51=Active, 52=Inactive

Card Users: dbcards.tbl_carduser
  - tbl_carduser_id (PK), tbl_user_nmcId, tbl_card_tocken (FK)
  - tbl_paymentnaturetype_id, tbl_carduser_primaryAccount_f

Payment Providers: dbcards.tbl_paymentserviceprovider
  - tbl_paymentserviceprovider_id (PK), tbl_paymentserviceprovider_name
  - tbl_paymentserviceprovidertype_id

=== ECOMMERCE (Demo/Fallback) ===

customers, products, orders, order_items (simple demo tables with standard column names)
"""


class DatabaseManager:
    """Manages MySQL database connections and queries for the platform"""

    def __init__(self):
        """Initialize database connection (no database lock for cross-DB queries)"""
        self.config = {
            'host': os.getenv('MYSQL_HOST', 'mysql'),
            'port': int(os.getenv('MYSQL_PORT', 3306)),
            'user': os.getenv('MYSQL_USER', 'root'),
            'password': os.getenv('MYSQL_PASSWORD', 'password'),
            'charset': 'utf8mb4',
            'use_unicode': True,
            'autocommit': True
        }
        self.connection = None
        self._connect()

    def _connect(self):
        """Establish database connection"""
        try:
            self.connection = mysql.connector.connect(**self.config)
            if self.connection.is_connected():
                logger.info("Successfully connected to MySQL (multi-database mode)")
        except Error as e:
            logger.error(f"Error connecting to MySQL: {e}")
            self.connection = None

    @contextmanager
    def get_cursor(self):
        """Context manager for database cursor"""
        if not self.connection or not self.connection.is_connected():
            self._connect()

        cursor = self.connection.cursor(dictionary=True)
        try:
            yield cursor
        except Error as e:
            logger.error(f"Database error: {e}")
            raise
        finally:
            cursor.close()

    def _has_database(self, db_name: str) -> bool:
        """Check if a database exists"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("SHOW DATABASES LIKE %s", (db_name,))
                return cursor.fetchone() is not None
        except Error:
            return False

    def get_table_info(self) -> str:
        """Return curated schema description for LLM context"""
        return PLATFORM_SCHEMA

    # ------------------------------------------------------------------
    # E-Commerce Queries (dbitems with ecommerce fallback)
    # ------------------------------------------------------------------

    def get_order_status(self, order_id: int) -> Optional[Dict[str, Any]]:
        """Get order status and details"""
        try:
            with self.get_cursor() as cursor:
                # Try platform DB first
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT
                            o.tbl_order_id AS order_id,
                            o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date,
                            s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount,
                            o.tbl_order_subtotal AS subtotal,
                            o.tbl_order_tax AS tax,
                            o.tbl_delivery_fee AS delivery_fee,
                            o.tbl_order_customer_firstname AS customer_firstname,
                            o.tbl_order_customer_lastname AS customer_lastname,
                            o.tbl_order_delivery_address1 AS delivery_address,
                            o.tbl_order_delivery_zipcode AS zipcode
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s
                            ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_order_id = %s
                    """, (order_id,))
                    order = cursor.fetchone()

                    if order:
                        # Get order items
                        cursor.execute("""
                            SELECT
                                od.tbl_product_id AS product_id,
                                od.tbl_orderdetail_qty AS quantity,
                                od.tbl_orderdetail_salePrice AS price,
                                p.tbl_product_name AS product_name
                            FROM dbitems.tbl_orderdetail od
                            LEFT JOIN dbitems.tbl_product p
                                ON od.tbl_product_id = p.tbl_product_id
                            WHERE od.tbl_order_id = %s
                        """, (order_id,))
                        order['items'] = cursor.fetchall()
                    return order

                # Fallback to demo ecommerce DB
                cursor.execute("""
                    SELECT o.order_id, o.order_date, o.status, o.total_amount,
                           o.shipping_address, o.tracking_number,
                           c.name AS customer_name, c.email AS customer_email
                    FROM ecommerce.orders o
                    LEFT JOIN ecommerce.customers c ON o.customer_id = c.customer_id
                    WHERE o.order_id = %s
                """, (order_id,))
                order = cursor.fetchone()
                if order:
                    cursor.execute("""
                        SELECT oi.product_id, oi.quantity, oi.price,
                               p.name AS product_name
                        FROM ecommerce.order_items oi
                        LEFT JOIN ecommerce.products p ON oi.product_id = p.product_id
                        WHERE oi.order_id = %s
                    """, (order_id,))
                    order['items'] = cursor.fetchall()
                return order

        except Error as e:
            logger.error(f"Error fetching order status: {e}")
            return None

    def get_order_by_number(self, order_number: str) -> Optional[Dict[str, Any]]:
        """Get order by order number (e.g. 'ORD-12345')"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT
                            o.tbl_order_id AS order_id,
                            o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date,
                            s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount,
                            o.tbl_order_customer_firstname AS customer_firstname,
                            o.tbl_order_customer_lastname AS customer_lastname
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s
                            ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_order_number = %s
                    """, (order_number,))
                    return cursor.fetchone()
                # Fallback
                cursor.execute("""
                    SELECT order_id, order_date, status, total_amount, tracking_number
                    FROM ecommerce.orders
                    WHERE tracking_number = %s
                """, (order_number,))
                return cursor.fetchone()
        except Error as e:
            logger.error(f"Error fetching order by number: {e}")
            return None

    def get_product_info(self, product_id: int = None, product_name: str = None) -> Optional[Any]:
        """Get product information by ID or name"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    if product_id:
                        cursor.execute("""
                            SELECT
                                tbl_product_id AS product_id,
                                tbl_product_name AS name,
                                tbl_product_description AS description,
                                tbl_product_regularPrice AS regular_price,
                                tbl_product_salePrice AS sale_price,
                                tbl_product_quantity AS stock_quantity,
                                tbl_product_brand AS brand,
                                tbl_product_sku AS sku
                            FROM dbitems.tbl_product
                            WHERE tbl_product_id = %s
                        """, (product_id,))
                        return cursor.fetchone()
                    elif product_name:
                        cursor.execute("""
                            SELECT
                                tbl_product_id AS product_id,
                                tbl_product_name AS name,
                                tbl_product_description AS description,
                                tbl_product_regularPrice AS regular_price,
                                tbl_product_salePrice AS sale_price,
                                tbl_product_quantity AS stock_quantity,
                                tbl_product_brand AS brand
                            FROM dbitems.tbl_product
                            WHERE tbl_product_name LIKE %s
                            LIMIT 5
                        """, (f"%{product_name}%",))
                        return cursor.fetchall()
                    return None

                # Fallback to demo DB
                if product_id:
                    cursor.execute("""
                        SELECT product_id, name, description, price,
                               stock_quantity, category, brand, is_available
                        FROM ecommerce.products WHERE product_id = %s
                    """, (product_id,))
                    return cursor.fetchone()
                elif product_name:
                    cursor.execute("""
                        SELECT product_id, name, description, price,
                               stock_quantity, category, brand, is_available
                        FROM ecommerce.products WHERE name LIKE %s LIMIT 5
                    """, (f"%{product_name}%",))
                    return cursor.fetchall()
                return None

        except Error as e:
            logger.error(f"Error fetching product info: {e}")
            return None

    def search_products(self, search_term: str, limit: int = 10) -> Optional[List[Dict[str, Any]]]:
        """Search products by name, description, or brand"""
        try:
            with self.get_cursor() as cursor:
                pattern = f"%{search_term}%"
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT
                            tbl_product_id AS product_id,
                            tbl_product_name AS name,
                            tbl_product_description AS description,
                            tbl_product_regularPrice AS regular_price,
                            tbl_product_salePrice AS sale_price,
                            tbl_product_quantity AS stock_quantity,
                            tbl_product_brand AS brand
                        FROM dbitems.tbl_product
                        WHERE (tbl_product_name LIKE %s
                            OR tbl_product_description LIKE %s
                            OR tbl_product_brand LIKE %s)
                        LIMIT %s
                    """, (pattern, pattern, pattern, limit))
                    return cursor.fetchall()

                # Fallback
                cursor.execute("""
                    SELECT product_id, name, description, price,
                           stock_quantity, category, brand
                    FROM ecommerce.products
                    WHERE (name LIKE %s OR description LIKE %s)
                    AND is_available = TRUE
                    LIMIT %s
                """, (pattern, pattern, limit))
                return cursor.fetchall()

        except Error as e:
            logger.error(f"Error searching products: {e}")
            return None

    def get_customer_orders(self, customer_id: int, limit: int = 10) -> Optional[List[Dict[str, Any]]]:
        """Get recent orders for a customer/user"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT
                            o.tbl_order_id AS order_id,
                            o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date,
                            s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s
                            ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_user_id = %s
                        ORDER BY o.tbl_order_date DESC
                        LIMIT %s
                    """, (customer_id, limit))
                    return cursor.fetchall()

                # Fallback
                cursor.execute("""
                    SELECT order_id, order_date, status, total_amount, tracking_number
                    FROM ecommerce.orders
                    WHERE customer_id = %s
                    ORDER BY order_date DESC LIMIT %s
                """, (customer_id, limit))
                return cursor.fetchall()

        except Error as e:
            logger.error(f"Error fetching customer orders: {e}")
            return None

    def get_customer_by_email(self, email: str) -> Optional[Dict[str, Any]]:
        """Get customer info by email (demo DB only)"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT customer_id, name, email, phone, address, registration_date
                    FROM ecommerce.customers WHERE email = %s
                """, (email,))
                return cursor.fetchone()
        except Error as e:
            logger.error(f"Error fetching customer by email: {e}")
            return None

    def get_order_tracking(self, tracking_number: str) -> Optional[Dict[str, Any]]:
        """Get order by tracking/order number"""
        # In platform DB, order_number serves as the tracking reference
        result = self.get_order_by_number(tracking_number)
        if result:
            return result
        # Fallback to demo DB tracking_number field
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT o.order_id, o.order_date, o.status, o.total_amount,
                           o.tracking_number, o.shipping_address,
                           c.name AS customer_name
                    FROM ecommerce.orders o
                    LEFT JOIN ecommerce.customers c ON o.customer_id = c.customer_id
                    WHERE o.tracking_number = %s
                """, (tracking_number,))
                return cursor.fetchone()
        except Error as e:
            logger.error(f"Error fetching order by tracking number: {e}")
            return None

    # ------------------------------------------------------------------
    # Payment Queries (dbcards)
    # ------------------------------------------------------------------

    def get_card_info(self, card_id: int) -> Optional[Dict[str, Any]]:
        """Get card details with type and status"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT
                        c.tbl_card_id AS card_id,
                        c.tbl_card_number AS card_number,
                        c.tbl_card_nickname AS nickname,
                        c.tbl_card_chardHolderName AS holder_name,
                        c.tbl_card_dateExpire AS expiry,
                        ct.tbl_cardstype_name AS card_type,
                        cs.tbl_cardstatus_name AS status
                    FROM dbcards.tbl_card c
                    LEFT JOIN dbcards.tbl_cardstype ct
                        ON c.tbl_cardstype_id = ct.tbl_cardstype_id
                    LEFT JOIN dbcards.tbl_cardstatus cs
                        ON c.tbl_cardstatus_id = cs.tbl_cardstatus_id
                    WHERE c.tbl_card_id = %s
                """, (card_id,))
                return cursor.fetchone()
        except Error as e:
            logger.error(f"Error fetching card info: {e}")
            return None

    def get_cards_by_user(self, user_id: int) -> Optional[List[Dict[str, Any]]]:
        """Get all cards for a user"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT
                        c.tbl_card_id AS card_id,
                        c.tbl_card_number AS card_number,
                        c.tbl_card_nickname AS nickname,
                        ct.tbl_cardstype_name AS card_type,
                        cs.tbl_cardstatus_name AS status,
                        cu.tbl_carduser_primaryAccount_f AS is_primary
                    FROM dbcards.tbl_carduser cu
                    JOIN dbcards.tbl_card c
                        ON cu.tbl_card_tocken = c.tbl_card_tocken
                    LEFT JOIN dbcards.tbl_cardstype ct
                        ON c.tbl_cardstype_id = ct.tbl_cardstype_id
                    LEFT JOIN dbcards.tbl_cardstatus cs
                        ON c.tbl_cardstatus_id = cs.tbl_cardstatus_id
                    WHERE cu.tbl_user_nmcId = %s
                """, (user_id,))
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error fetching cards by user: {e}")
            return None

    def get_card_types(self) -> Optional[List[Dict[str, Any]]]:
        """Get accepted card types (VISA, MASTERCARD, etc.)"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT tbl_cardstype_id AS type_id, tbl_cardstype_name AS name
                    FROM dbcards.tbl_cardstype
                    ORDER BY tbl_cardstype_name
                """)
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error fetching card types: {e}")
            return None

    def get_payment_providers(self) -> Optional[List[Dict[str, Any]]]:
        """Get available payment service providers"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT
                        tbl_paymentserviceprovider_id AS provider_id,
                        tbl_paymentserviceprovider_name AS name
                    FROM dbcards.tbl_paymentserviceprovider
                    WHERE tbl_paymentserviceprovider_delete IS NULL
                       OR tbl_paymentserviceprovider_delete = 0
                    ORDER BY tbl_paymentserviceprovider_order
                """)
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error fetching payment providers: {e}")
            return None

    # ------------------------------------------------------------------
    # Generic
    # ------------------------------------------------------------------

    def execute_custom_query(self, query: str, params: tuple = None) -> Optional[List[Dict[str, Any]]]:
        """Execute a custom SELECT query"""
        try:
            with self.get_cursor() as cursor:
                if params:
                    cursor.execute(query, params)
                else:
                    cursor.execute(query)
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error executing custom query: {e}")
            return None

    def close(self):
        """Close database connection"""
        if self.connection and self.connection.is_connected():
            self.connection.close()
            logger.info("MySQL connection closed")

    def __del__(self):
        """Cleanup on deletion"""
        self.close()
