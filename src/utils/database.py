"""
Database manager for MySQL platform databases (DBITEMS + DBCARDS + DBUSER + ecommerce demo)
Supports cross-database queries for multi-profile customer service.
Profiles: Consumer, Merchant, Reseller, Admin
"""

import os
import time
import logging
from typing import Optional, Dict, Any, List
import mysql.connector
from mysql.connector import Error
from contextlib import contextmanager

logger = logging.getLogger(__name__)

# ======================================================================
# Profile capability definitions (used by UI and NLU)
# ======================================================================
PROFILE_CAPABILITIES = {
    "consumer": {
        "label": "Consumer",
        "description": "End customer who shops on the platform",
        "capabilities": [
            {"id": "product_search", "name": "Product Search", "desc": "Search products by name, brand, or keyword", "icon": "search"},
            {"id": "product_info", "name": "Product Details", "desc": "Get price, description, availability of a product", "icon": "box"},
            {"id": "order_status", "name": "Order Status", "desc": "Check the status of an order by ID or number", "icon": "truck"},
            {"id": "payment_info", "name": "Payment Methods", "desc": "See accepted payment methods and card types", "icon": "credit-card"},
            {"id": "store_locations", "name": "Store Locations", "desc": "Find nearby stores and their info", "icon": "map-pin"},
            {"id": "table_availability", "name": "Table Availability", "desc": "Check available tables at restaurant locations", "icon": "utensils"},
        ]
    },
    "merchant": {
        "label": "Merchant",
        "description": "Store owner who sells on the platform",
        "capabilities": [
            {"id": "sales_summary", "name": "Sales Summary", "desc": "Weekly, monthly, or quarterly sales totals", "icon": "bar-chart"},
            {"id": "top_products", "name": "Top Products", "desc": "Best and worst selling products", "icon": "trending-up"},
            {"id": "sales_by_location", "name": "Sales by Location", "desc": "Revenue breakdown per store location", "icon": "map"},
            {"id": "recent_orders", "name": "Recent Orders", "desc": "View latest orders and their status", "icon": "clipboard"},
            {"id": "inventory_status", "name": "Inventory Status", "desc": "Stock levels and low-stock alerts", "icon": "package"},
            {"id": "order_status", "name": "Order Lookup", "desc": "Look up a specific order by ID or number", "icon": "search"},
        ]
    },
    "reseller": {
        "label": "Reseller",
        "description": "Partner who manages multiple merchants",
        "capabilities": [
            {"id": "merchant_list", "name": "My Merchants", "desc": "List of merchants under your management", "icon": "users"},
            {"id": "merchant_performance", "name": "Merchant Performance", "desc": "Sales overview per merchant", "icon": "activity"},
            {"id": "equipment_summary", "name": "Equipment Deployed", "desc": "Tablets, dongles, TVs across merchants", "icon": "monitor"},
            {"id": "subscription_overview", "name": "Subscriptions", "desc": "Subscription tiers across your merchants", "icon": "layers"},
        ]
    },
    "admin": {
        "label": "Admin",
        "description": "Platform administrator with full access",
        "capabilities": [
            {"id": "platform_stats", "name": "Platform Stats", "desc": "Total users, merchants, orders, revenue", "icon": "pie-chart"},
            {"id": "user_counts", "name": "User Counts", "desc": "Users by type (consumer, merchant, reseller)", "icon": "users"},
            {"id": "order_overview", "name": "Order Overview", "desc": "Platform-wide order stats by status", "icon": "clipboard"},
            {"id": "recent_signups", "name": "Recent Signups", "desc": "Latest registered users and merchants", "icon": "user-plus"},
            {"id": "merchant_list", "name": "All Merchants", "desc": "Full merchant directory with status", "icon": "briefcase"},
            {"id": "revenue_report", "name": "Revenue Report", "desc": "Platform revenue by period", "icon": "dollar-sign"},
        ]
    }
}

# Curated schema description for LLM context (per profile)
PLATFORM_SCHEMA = """
=== DBITEMS (E-Commerce Platform) ===

Products: dbitems.tbl_product
  - tbl_product_id (PK), tbl_product_name, tbl_product_description
  - tbl_product_regularPrice, tbl_product_salePrice, tbl_product_saleDiscount
  - tbl_product_quantity (stock), tbl_product_brand, tbl_product_sku
  - tbl_productstatus_id, tbl_producttype_id, tbl_product_usernmcId (owner)

Categories: dbitems.tbl_category
  - tbl_category_id (PK), tbl_category_parentId, tbl_category_level

Orders: dbitems.tbl_order
  - tbl_order_id (PK), tbl_user_id, tbl_merchant_id, tbl_consumer_id
  - tbl_order_number, tbl_order_date, tbl_orderstatus_id
  - tbl_order_total, tbl_order_subtotal, tbl_order_tax, tbl_order_tip, tbl_delivery_fee
  - tbl_order_customer_firstname, tbl_order_customer_lastname
  - tbl_location_table_id (FK for dine-in)

Order Statuses: dbitems.tbl_orderstatus
  - 92001=Open, 92002=Done, 92003=Close, 92004=Cancel

Order Items: dbitems.tbl_orderdetail
  - tbl_order_id (FK), tbl_product_id (FK), tbl_orderdetail_qty, tbl_orderdetail_salePrice
  - tbl_location_id (FK to location)

Product Inventory: dbitems.tbl_productinventory
  - tbl_product_id (FK), tbl_location_id (FK), tbl_productinventory_quantity

=== DBCARDS (Payments) ===

Card Types: dbcards.tbl_cardstype
  - 61=VISA, 62=MASTERCARD, 63=AMERICAN EXPRESS, 65=Discover

Payment Providers: dbcards.tbl_paymentserviceprovider
  - tbl_paymentserviceprovider_id, tbl_paymentserviceprovider_name

=== DBUSER (Users & Locations) ===

Merchants: dbuser.tbl_merchant
  - tbl_merchant_id (PK), tbl_merchant_nmcId, tbl_user_id
  - tbl_user_reseller_id, tbl_merchant_logoimage
  - tbl_merchant_dongles_quantity, tbl_merchant_tablet_quantity, tbl_merchant_tv_quantity
  - tbl_merchant_basic_subs, tbl_merchant_standard_subs, tbl_merchant_deluxe_subs

Resellers: dbuser.tbl_reseller
  - tbl_reseller_id (PK), tbl_reseller_nmcId, tbl_user_id

Locations: dbuser.tbl_location
  - tbl_location_id (PK), tbl_location_userId (merchant owner)
  - tbl_location_storeName, tbl_location_storeNumber
  - tbl_location_latitude, tbl_location_longitude
  - tbl_location_table_qty

Location Seating: dbuser.tbl_location_seating
  - tbl_location_seating_id, tbl_location_id (FK)
  - tbl_location_seating_section, tbl_location_seating_tables_qty

Location Tables: dbuser.tbl_location_table
  - tbl_location_table_id, tbl_location_seating_id (FK)
  - tbl_location_table_name, tbl_location_table_seats_qty, tbl_location_table_status_f

User Types: dbuser.tbl_usertype
  - 1=Consumer, 2=Merchant, 3=Agent, 4=Admin

=== ECOMMERCE (Demo/Fallback) ===
customers, products, orders, order_items (simple demo tables)
"""


class DatabaseManager:
    """Manages MySQL database connections and queries for the platform"""

    def __init__(self):
        self.config = {
            'host': os.getenv('MYSQL_HOST', '127.0.0.1'),
            'port': int(os.getenv('MYSQL_PORT', 3306)),
            'user': os.getenv('MYSQL_USER', 'root'),
            'password': os.getenv('MYSQL_PASSWORD', ''),
            'charset': 'utf8mb4',
            'use_unicode': True,
            'autocommit': True
        }
        self.connection = None
        self._connect()

    def _connect(self):
        try:
            self.connection = mysql.connector.connect(**self.config)
            if self.connection.is_connected():
                logger.info("Successfully connected to MySQL (multi-database mode)")
        except Error as e:
            logger.error(f"Error connecting to MySQL: {e}")
            self.connection = None

    @contextmanager
    def get_cursor(self):
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
        try:
            with self.get_cursor() as cursor:
                cursor.execute("SHOW DATABASES LIKE %s", (db_name,))
                return cursor.fetchone() is not None
        except Error:
            return False

    def get_table_info(self) -> str:
        return PLATFORM_SCHEMA

    def get_capabilities(self, profile: str = None) -> Dict:
        if profile and profile in PROFILE_CAPABILITIES:
            return {profile: PROFILE_CAPABILITIES[profile]}
        return PROFILE_CAPABILITIES

    # ==================================================================
    # QUERY LOGGING
    # ==================================================================

    def log_query(self, profile: str, user_id: str, query_text: str,
                  intent: str, response_text: str, db_data_found: bool,
                  response_time_ms: int, input_method: str = "text"):
        """Log a query to the agent log table"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    INSERT INTO apitap_agent.query_log
                    (user_profile, user_id, query_text, intent, response_text,
                     db_data_found, response_time_ms, input_method)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                """, (profile, user_id, query_text, intent, response_text,
                      db_data_found, response_time_ms, input_method))
        except Error as e:
            logger.warning(f"Failed to log query (non-critical): {e}")

    def get_query_logs(self, limit: int = 50, profile: str = None) -> List[Dict]:
        """Retrieve recent query logs"""
        try:
            with self.get_cursor() as cursor:
                if profile:
                    cursor.execute("""
                        SELECT id, user_profile, user_id, query_text, intent,
                               response_text, db_data_found, response_time_ms,
                               input_method, created_at
                        FROM apitap_agent.query_log
                        WHERE user_profile = %s
                        ORDER BY created_at DESC LIMIT %s
                    """, (profile, limit))
                else:
                    cursor.execute("""
                        SELECT id, user_profile, user_id, query_text, intent,
                               response_text, db_data_found, response_time_ms,
                               input_method, created_at
                        FROM apitap_agent.query_log
                        ORDER BY created_at DESC LIMIT %s
                    """, (limit,))
                return cursor.fetchall()
        except Error as e:
            logger.warning(f"Failed to get query logs: {e}")
            return []

    def get_log_stats(self) -> Dict:
        """Get aggregated log stats for dashboard"""
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT
                        user_profile,
                        COUNT(*) as total_queries,
                        SUM(db_data_found) as successful,
                        ROUND(AVG(response_time_ms)) as avg_response_ms
                    FROM apitap_agent.query_log
                    GROUP BY user_profile
                """)
                return cursor.fetchall()
        except Error as e:
            logger.warning(f"Failed to get log stats: {e}")
            return []

    # ==================================================================
    # CONSUMER QUERIES
    # ==================================================================

    def get_order_status(self, order_id: int) -> Optional[Dict[str, Any]]:
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT o.tbl_order_id AS order_id, o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date, s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount, o.tbl_order_subtotal AS subtotal,
                            o.tbl_order_tax AS tax, o.tbl_delivery_fee AS delivery_fee,
                            o.tbl_order_customer_firstname AS customer_firstname,
                            o.tbl_order_customer_lastname AS customer_lastname
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_order_id = %s
                    """, (order_id,))
                    order = cursor.fetchone()
                    if order:
                        cursor.execute("""
                            SELECT p.tbl_product_name AS product_name,
                                od.tbl_orderdetail_qty AS quantity,
                                od.tbl_orderdetail_salePrice AS price
                            FROM dbitems.tbl_orderdetail od
                            LEFT JOIN dbitems.tbl_product p ON od.tbl_product_id = p.tbl_product_id
                            WHERE od.tbl_order_id = %s
                        """, (order_id,))
                        order['items'] = cursor.fetchall()
                    return order

                cursor.execute("""
                    SELECT o.order_id, o.order_date, o.status, o.total_amount,
                           c.name AS customer_name
                    FROM ecommerce.orders o
                    LEFT JOIN ecommerce.customers c ON o.customer_id = c.customer_id
                    WHERE o.order_id = %s
                """, (order_id,))
                return cursor.fetchone()
        except Error as e:
            logger.error(f"Error fetching order status: {e}")
            return None

    def get_order_by_number(self, order_number: str) -> Optional[Dict[str, Any]]:
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT o.tbl_order_id AS order_id, o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date, s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_order_number = %s
                    """, (order_number,))
                    return cursor.fetchone()
                cursor.execute("""
                    SELECT order_id, order_date, status, total_amount
                    FROM ecommerce.orders WHERE tracking_number = %s
                """, (order_number,))
                return cursor.fetchone()
        except Error as e:
            logger.error(f"Error fetching order by number: {e}")
            return None

    def get_product_info(self, product_id: int = None, product_name: str = None) -> Optional[Any]:
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    if product_id:
                        cursor.execute("""
                            SELECT tbl_product_id AS product_id, tbl_product_name AS name,
                                tbl_product_description AS description,
                                tbl_product_regularPrice AS regular_price,
                                tbl_product_salePrice AS sale_price,
                                tbl_product_quantity AS stock_quantity,
                                tbl_product_brand AS brand, tbl_product_sku AS sku
                            FROM dbitems.tbl_product WHERE tbl_product_id = %s
                        """, (product_id,))
                        return cursor.fetchone()
                    elif product_name:
                        cursor.execute("""
                            SELECT tbl_product_id AS product_id, tbl_product_name AS name,
                                tbl_product_regularPrice AS regular_price,
                                tbl_product_salePrice AS sale_price,
                                tbl_product_quantity AS stock_quantity, tbl_product_brand AS brand
                            FROM dbitems.tbl_product WHERE tbl_product_name LIKE %s LIMIT 5
                        """, (f"%{product_name}%",))
                        return cursor.fetchall()
                if product_id:
                    cursor.execute("SELECT * FROM ecommerce.products WHERE product_id = %s", (product_id,))
                    return cursor.fetchone()
                elif product_name:
                    cursor.execute("SELECT * FROM ecommerce.products WHERE name LIKE %s LIMIT 5", (f"%{product_name}%",))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching product info: {e}")
            return None

    def search_products(self, search_term: str, limit: int = 10) -> Optional[List[Dict]]:
        try:
            with self.get_cursor() as cursor:
                pattern = f"%{search_term}%"
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT tbl_product_id AS product_id, tbl_product_name AS name,
                            tbl_product_regularPrice AS regular_price,
                            tbl_product_salePrice AS sale_price,
                            tbl_product_quantity AS stock_quantity, tbl_product_brand AS brand
                        FROM dbitems.tbl_product
                        WHERE (tbl_product_name LIKE %s OR tbl_product_description LIKE %s
                               OR tbl_product_brand LIKE %s)
                        LIMIT %s
                    """, (pattern, pattern, pattern, limit))
                    return cursor.fetchall()
                cursor.execute("""
                    SELECT product_id, name, price, stock_quantity, brand
                    FROM ecommerce.products WHERE (name LIKE %s OR description LIKE %s) LIMIT %s
                """, (pattern, pattern, limit))
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error searching products: {e}")
            return None

    def get_customer_orders(self, customer_id: int, limit: int = 10) -> Optional[List[Dict]]:
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT o.tbl_order_id AS order_id, o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date, s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_consumer_id = %s
                        ORDER BY o.tbl_order_date DESC LIMIT %s
                    """, (customer_id, limit))
                    return cursor.fetchall()
                cursor.execute("""
                    SELECT order_id, order_date, status, total_amount
                    FROM ecommerce.orders WHERE customer_id = %s
                    ORDER BY order_date DESC LIMIT %s
                """, (customer_id, limit))
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error fetching customer orders: {e}")
            return None

    def get_store_locations(self, lat: float = None, lng: float = None, limit: int = 10) -> Optional[List[Dict]]:
        """Get store locations, optionally sorted by proximity"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    if lat and lng:
                        cursor.execute("""
                            SELECT tbl_location_id AS location_id,
                                tbl_location_storeName AS store_name,
                                tbl_location_storeNumber AS store_number,
                                tbl_location_latitude AS latitude,
                                tbl_location_longitude AS longitude,
                                tbl_location_table_qty AS table_count,
                                (6371 * ACOS(COS(RADIANS(%s)) * COS(RADIANS(tbl_location_latitude))
                                 * COS(RADIANS(tbl_location_longitude) - RADIANS(%s))
                                 + SIN(RADIANS(%s)) * SIN(RADIANS(tbl_location_latitude)))) AS distance_km
                            FROM dbuser.tbl_location
                            WHERE tbl_location_statusId = 7001
                              AND tbl_location_latitude IS NOT NULL
                              AND tbl_location_latitude != ''
                            ORDER BY distance_km ASC LIMIT %s
                        """, (lat, lng, lat, limit))
                    else:
                        cursor.execute("""
                            SELECT tbl_location_id AS location_id,
                                tbl_location_storeName AS store_name,
                                tbl_location_storeNumber AS store_number,
                                tbl_location_latitude AS latitude,
                                tbl_location_longitude AS longitude,
                                tbl_location_table_qty AS table_count
                            FROM dbuser.tbl_location
                            WHERE tbl_location_statusId = 7001
                            LIMIT %s
                        """, (limit,))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching store locations: {e}")
            return None

    def get_table_availability(self, location_id: int = None) -> Optional[List[Dict]]:
        """Get table availability for a location (restaurant seating)"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    if location_id:
                        cursor.execute("""
                            SELECT t.tbl_location_table_id AS table_id,
                                t.tbl_location_table_name AS table_name,
                                t.tbl_location_table_seats_qty AS seats,
                                t.tbl_location_table_status_f AS available,
                                s.tbl_location_seating_section AS section
                            FROM dbuser.tbl_location_table t
                            JOIN dbuser.tbl_location_seating s
                                ON t.tbl_location_seating_id = s.tbl_location_seating_id
                            WHERE s.tbl_location_id = %s
                            ORDER BY s.tbl_location_seating_section, t.tbl_location_table_name
                        """, (location_id,))
                    else:
                        cursor.execute("""
                            SELECT l.tbl_location_storeName AS store_name,
                                s.tbl_location_seating_section AS section,
                                COUNT(t.tbl_location_table_id) AS total_tables,
                                SUM(t.tbl_location_table_status_f) AS available_tables
                            FROM dbuser.tbl_location_table t
                            JOIN dbuser.tbl_location_seating s
                                ON t.tbl_location_seating_id = s.tbl_location_seating_id
                            JOIN dbuser.tbl_location l
                                ON s.tbl_location_id = l.tbl_location_id
                            GROUP BY l.tbl_location_storeName, s.tbl_location_seating_section
                            LIMIT 20
                        """)
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching table availability: {e}")
            return None

    def get_card_types(self) -> Optional[List[Dict]]:
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT tbl_cardstype_id AS type_id, tbl_cardstype_name AS name
                    FROM dbcards.tbl_cardstype ORDER BY tbl_cardstype_name
                """)
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error fetching card types: {e}")
            return None

    def get_payment_providers(self) -> Optional[List[Dict]]:
        try:
            with self.get_cursor() as cursor:
                cursor.execute("""
                    SELECT tbl_paymentserviceprovider_id AS provider_id,
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

    # ==================================================================
    # MERCHANT QUERIES
    # ==================================================================

    def get_merchant_sales(self, merchant_id: int, period: str = "monthly") -> Optional[Dict]:
        """Get sales summary for a merchant by period (weekly, monthly, quarterly)"""
        period_sql = {
            "weekly": "AND o.tbl_order_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)",
            "monthly": "AND o.tbl_order_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)",
            "quarterly": "AND o.tbl_order_date >= DATE_SUB(NOW(), INTERVAL 90 DAY)",
            "yearly": "AND o.tbl_order_date >= DATE_SUB(NOW(), INTERVAL 365 DAY)",
        }
        date_filter = period_sql.get(period, period_sql["monthly"])
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute(f"""
                        SELECT
                            COUNT(*) AS total_orders,
                            COALESCE(SUM(o.tbl_order_total), 0) AS total_revenue,
                            COALESCE(SUM(o.tbl_order_subtotal), 0) AS subtotal,
                            COALESCE(SUM(o.tbl_order_tax), 0) AS total_tax,
                            COALESCE(SUM(o.tbl_order_tip), 0) AS total_tips,
                            COALESCE(SUM(o.tbl_delivery_fee), 0) AS total_delivery_fees,
                            COALESCE(AVG(o.tbl_order_total), 0) AS avg_order_value
                        FROM dbitems.tbl_order o
                        WHERE o.tbl_merchant_id = %s
                          AND o.tbl_orderstatus_id != 92004
                          {date_filter}
                    """, (merchant_id,))
                    summary = cursor.fetchone()
                    summary['period'] = period
                    summary['merchant_id'] = merchant_id
                    return summary
                return None
        except Error as e:
            logger.error(f"Error fetching merchant sales: {e}")
            return None

    def get_merchant_top_products(self, merchant_id: int, limit: int = 10, bottom: bool = False) -> Optional[List[Dict]]:
        """Get top or bottom selling products for a merchant"""
        order_dir = "ASC" if bottom else "DESC"
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute(f"""
                        SELECT
                            p.tbl_product_id AS product_id,
                            p.tbl_product_name AS product_name,
                            SUM(od.tbl_orderdetail_qty) AS total_sold,
                            SUM(od.tbl_orderdetail_salePrice * od.tbl_orderdetail_qty) AS total_revenue,
                            p.tbl_product_salePrice AS current_price
                        FROM dbitems.tbl_orderdetail od
                        JOIN dbitems.tbl_product p ON od.tbl_product_id = p.tbl_product_id
                        JOIN dbitems.tbl_order o ON od.tbl_order_id = o.tbl_order_id
                        WHERE o.tbl_merchant_id = %s
                          AND o.tbl_orderstatus_id != 92004
                        GROUP BY p.tbl_product_id, p.tbl_product_name, p.tbl_product_salePrice
                        ORDER BY total_sold {order_dir}
                        LIMIT %s
                    """, (merchant_id, limit))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching merchant top products: {e}")
            return None

    def get_merchant_sales_by_location(self, merchant_id: int) -> Optional[List[Dict]]:
        """Get sales breakdown by location for a merchant"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems') and self._has_database('dbuser'):
                    cursor.execute("""
                        SELECT
                            l.tbl_location_storeName AS store_name,
                            l.tbl_location_storeNumber AS store_number,
                            COUNT(DISTINCT o.tbl_order_id) AS total_orders,
                            COALESCE(SUM(o.tbl_order_total), 0) AS total_revenue
                        FROM dbitems.tbl_order o
                        JOIN dbitems.tbl_orderdetail od ON o.tbl_order_id = od.tbl_order_id
                        JOIN dbuser.tbl_location l ON od.tbl_location_id = l.tbl_location_id
                        WHERE o.tbl_merchant_id = %s
                          AND o.tbl_orderstatus_id != 92004
                        GROUP BY l.tbl_location_id, l.tbl_location_storeName, l.tbl_location_storeNumber
                        ORDER BY total_revenue DESC
                    """, (merchant_id,))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching sales by location: {e}")
            return None

    def get_merchant_recent_orders(self, merchant_id: int, limit: int = 15) -> Optional[List[Dict]]:
        """Get recent orders for a merchant"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT o.tbl_order_id AS order_id, o.tbl_order_number AS order_number,
                            o.tbl_order_date AS order_date, s.tbl_orderstatus_name AS status,
                            o.tbl_order_total AS total_amount,
                            o.tbl_order_customer_firstname AS customer_name
                        FROM dbitems.tbl_order o
                        LEFT JOIN dbitems.tbl_orderstatus s ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        WHERE o.tbl_merchant_id = %s
                        ORDER BY o.tbl_order_date DESC LIMIT %s
                    """, (merchant_id, limit))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching merchant orders: {e}")
            return None

    def get_merchant_inventory(self, merchant_id: int, low_stock_only: bool = False) -> Optional[List[Dict]]:
        """Get product inventory for a merchant, optionally filtered to low stock"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    low_filter = "AND p.tbl_product_quantity <= p.tbl_product_remaining_limit" if low_stock_only else ""
                    cursor.execute(f"""
                        SELECT p.tbl_product_id AS product_id, p.tbl_product_name AS name,
                            p.tbl_product_quantity AS stock,
                            p.tbl_product_remaining_limit AS low_threshold,
                            p.tbl_product_salePrice AS price
                        FROM dbitems.tbl_product p
                        JOIN dbuser.tbl_merchant m ON p.tbl_product_usernmcId = m.tbl_merchant_nmcId
                        WHERE m.tbl_merchant_id = %s {low_filter}
                        ORDER BY p.tbl_product_quantity ASC LIMIT 20
                    """, (merchant_id,))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching merchant inventory: {e}")
            return None

    # ==================================================================
    # RESELLER QUERIES
    # ==================================================================

    def get_reseller_merchants(self, reseller_user_id: int) -> Optional[List[Dict]]:
        """Get merchants managed by a reseller"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    cursor.execute("""
                        SELECT m.tbl_merchant_id AS merchant_id,
                            m.tbl_merchant_nmcId AS nmc_id,
                            m.tbl_user_id AS user_id,
                            m.tbl_merchant_dongles_quantity AS dongles,
                            m.tbl_merchant_tablet_quantity AS tablets,
                            m.tbl_merchant_tv_quantity AS tvs,
                            m.tbl_merchant_basic_subs AS basic_subs,
                            m.tbl_merchant_standard_subs AS standard_subs,
                            m.tbl_merchant_deluxe_subs AS deluxe_subs
                        FROM dbuser.tbl_merchant m
                        WHERE m.tbl_user_reseller_id = %s
                    """, (reseller_user_id,))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching reseller merchants: {e}")
            return None

    def get_reseller_performance(self, reseller_user_id: int) -> Optional[Dict]:
        """Get aggregated performance of all merchants under a reseller"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser') and self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT
                            COUNT(DISTINCT m.tbl_merchant_id) AS total_merchants,
                            COUNT(DISTINCT o.tbl_order_id) AS total_orders,
                            COALESCE(SUM(o.tbl_order_total), 0) AS total_revenue
                        FROM dbuser.tbl_merchant m
                        LEFT JOIN dbitems.tbl_order o ON o.tbl_merchant_id = m.tbl_merchant_id
                            AND o.tbl_orderstatus_id != 92004
                        WHERE m.tbl_user_reseller_id = %s
                    """, (reseller_user_id,))
                    return cursor.fetchone()
                return None
        except Error as e:
            logger.error(f"Error fetching reseller performance: {e}")
            return None

    def get_reseller_equipment_summary(self, reseller_user_id: int) -> Optional[Dict]:
        """Get equipment totals across all merchants of a reseller"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    cursor.execute("""
                        SELECT
                            COUNT(*) AS total_merchants,
                            COALESCE(SUM(tbl_merchant_dongles_quantity), 0) AS total_dongles,
                            COALESCE(SUM(tbl_merchant_tablet_quantity), 0) AS total_tablets,
                            COALESCE(SUM(tbl_merchant_tv_quantity), 0) AS total_tvs
                        FROM dbuser.tbl_merchant
                        WHERE tbl_user_reseller_id = %s
                    """, (reseller_user_id,))
                    return cursor.fetchone()
                return None
        except Error as e:
            logger.error(f"Error fetching equipment summary: {e}")
            return None

    def get_reseller_subscription_overview(self, reseller_user_id: int) -> Optional[Dict]:
        """Get subscription tier counts across all merchants of a reseller"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    cursor.execute("""
                        SELECT
                            COUNT(*) AS total_merchants,
                            COALESCE(SUM(tbl_merchant_basic_subs), 0) AS total_basic,
                            COALESCE(SUM(tbl_merchant_standard_subs), 0) AS total_standard,
                            COALESCE(SUM(tbl_merchant_deluxe_subs), 0) AS total_deluxe
                        FROM dbuser.tbl_merchant
                        WHERE tbl_user_reseller_id = %s
                    """, (reseller_user_id,))
                    return cursor.fetchone()
                return None
        except Error as e:
            logger.error(f"Error fetching subscription overview: {e}")
            return None

    # ==================================================================
    # ADMIN QUERIES
    # ==================================================================

    def get_platform_stats(self) -> Optional[Dict]:
        """Get platform-wide statistics"""
        try:
            with self.get_cursor() as cursor:
                stats = {}
                if self._has_database('dbitems'):
                    cursor.execute("SELECT COUNT(*) AS total FROM dbitems.tbl_order WHERE tbl_orderstatus_id != 92004")
                    stats['total_orders'] = cursor.fetchone()['total']
                    cursor.execute("SELECT COALESCE(SUM(tbl_order_total), 0) AS rev FROM dbitems.tbl_order WHERE tbl_orderstatus_id != 92004")
                    stats['total_revenue'] = float(cursor.fetchone()['rev'])
                    cursor.execute("SELECT COUNT(*) AS total FROM dbitems.tbl_product")
                    stats['total_products'] = cursor.fetchone()['total']
                if self._has_database('dbuser'):
                    cursor.execute("SELECT COUNT(*) AS total FROM dbuser.tbl_merchant")
                    stats['total_merchants'] = cursor.fetchone()['total']
                    cursor.execute("SELECT COUNT(*) AS total FROM dbuser.tbl_reseller")
                    stats['total_resellers'] = cursor.fetchone()['total']
                    cursor.execute("SELECT COUNT(*) AS total FROM dbuser.tbl_location WHERE tbl_location_statusId = 7001")
                    stats['active_locations'] = cursor.fetchone()['total']
                return stats if stats else None
        except Error as e:
            logger.error(f"Error fetching platform stats: {e}")
            return None

    def get_admin_user_counts(self) -> Optional[List[Dict]]:
        """Get user counts by type"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    cursor.execute("SELECT COUNT(*) AS total FROM dbuser.tbl_merchant")
                    merchants = cursor.fetchone()['total']
                    cursor.execute("SELECT COUNT(*) AS total FROM dbuser.tbl_reseller")
                    resellers = cursor.fetchone()['total']
                    return [
                        {"type": "Merchants", "count": merchants},
                        {"type": "Resellers", "count": resellers},
                    ]
                return None
        except Error as e:
            logger.error(f"Error fetching user counts: {e}")
            return None

    def get_admin_order_overview(self) -> Optional[List[Dict]]:
        """Get order counts by status"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute("""
                        SELECT s.tbl_orderstatus_name AS status, COUNT(*) AS count
                        FROM dbitems.tbl_order o
                        JOIN dbitems.tbl_orderstatus s ON o.tbl_orderstatus_id = s.tbl_orderstatus_id
                        GROUP BY s.tbl_orderstatus_name
                        ORDER BY count DESC
                    """)
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching order overview: {e}")
            return None

    def get_admin_revenue_by_period(self, period: str = "monthly") -> Optional[List[Dict]]:
        """Get platform revenue grouped by date periods"""
        group_by = {
            "daily": "DATE(o.tbl_order_date)",
            "weekly": "YEARWEEK(o.tbl_order_date)",
            "monthly": "DATE_FORMAT(o.tbl_order_date, '%Y-%m')",
        }
        date_group = group_by.get(period, group_by["monthly"])
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbitems'):
                    cursor.execute(f"""
                        SELECT {date_group} AS period,
                            COUNT(*) AS orders,
                            COALESCE(SUM(o.tbl_order_total), 0) AS revenue
                        FROM dbitems.tbl_order o
                        WHERE o.tbl_orderstatus_id != 92004
                        GROUP BY {date_group}
                        ORDER BY period DESC LIMIT 12
                    """)
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching revenue by period: {e}")
            return None

    def get_admin_all_merchants(self, limit: int = 20) -> Optional[List[Dict]]:
        """Get all merchants with basic info"""
        try:
            with self.get_cursor() as cursor:
                if self._has_database('dbuser'):
                    cursor.execute("""
                        SELECT m.tbl_merchant_id AS merchant_id,
                            m.tbl_merchant_nmcId AS nmc_id,
                            m.tbl_user_id AS user_id,
                            m.tbl_user_reseller_id AS reseller_id,
                            m.tbl_merchant_basic_subs AS basic_subs,
                            m.tbl_merchant_standard_subs AS standard_subs,
                            m.tbl_merchant_deluxe_subs AS deluxe_subs
                        FROM dbuser.tbl_merchant m
                        LIMIT %s
                    """, (limit,))
                    return cursor.fetchall()
                return None
        except Error as e:
            logger.error(f"Error fetching all merchants: {e}")
            return None

    # ==================================================================
    # Generic
    # ==================================================================

    def execute_custom_query(self, query: str, params: tuple = None) -> Optional[List[Dict]]:
        try:
            with self.get_cursor() as cursor:
                cursor.execute(query, params) if params else cursor.execute(query)
                return cursor.fetchall()
        except Error as e:
            logger.error(f"Error executing custom query: {e}")
            return None

    def close(self):
        if self.connection and self.connection.is_connected():
            self.connection.close()
            logger.info("MySQL connection closed")

    def __del__(self):
        self.close()
