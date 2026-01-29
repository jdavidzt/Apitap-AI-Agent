"""
Database manager for MySQL e-commerce database
"""

import os
import logging
from typing import Optional, Dict, Any, List
import mysql.connector
from mysql.connector import Error
from contextlib import contextmanager

logger = logging.getLogger(__name__)


class DatabaseManager:
    """Manages MySQL database connections and queries for e-commerce"""

    def __init__(self):
        """Initialize database connection"""
        self.config = {
            'host': os.getenv('MYSQL_HOST', 'mysql'),
            'port': int(os.getenv('MYSQL_PORT', 3306)),
            'database': os.getenv('MYSQL_DATABASE', 'ecommerce'),
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
                logger.info(f"Successfully connected to MySQL database: {self.config['database']}")
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

    def get_table_info(self) -> str:
        """
        Get information about available tables

        Returns:
            String description of database schema
        """
        try:
            with self.get_cursor() as cursor:
                cursor.execute("SHOW TABLES")
                tables = cursor.fetchall()

                table_info = []
                for table in tables:
                    table_name = list(table.values())[0]
                    cursor.execute(f"DESCRIBE {table_name}")
                    columns = cursor.fetchall()

                    column_names = [col['Field'] for col in columns]
                    table_info.append(f"{table_name}: {', '.join(column_names)}")

                return "\n".join(table_info)

        except Error as e:
            logger.error(f"Error getting table info: {e}")
            return "Tables: orders, products, customers, order_items"

    def get_order_status(self, order_id: int) -> Optional[Dict[str, Any]]:
        """
        Get order status and details

        Args:
            order_id: Order ID

        Returns:
            Order information or None
        """
        try:
            with self.get_cursor() as cursor:
                query = """
                    SELECT
                        o.order_id,
                        o.customer_id,
                        o.order_date,
                        o.status,
                        o.total_amount,
                        o.shipping_address,
                        o.tracking_number,
                        c.name as customer_name,
                        c.email as customer_email
                    FROM orders o
                    LEFT JOIN customers c ON o.customer_id = c.customer_id
                    WHERE o.order_id = %s
                """
                cursor.execute(query, (order_id,))
                order = cursor.fetchone()

                if order:
                    # Get order items
                    cursor.execute("""
                        SELECT
                            oi.product_id,
                            oi.quantity,
                            oi.price,
                            p.name as product_name
                        FROM order_items oi
                        LEFT JOIN products p ON oi.product_id = p.product_id
                        WHERE oi.order_id = %s
                    """, (order_id,))
                    items = cursor.fetchall()
                    order['items'] = items

                return order

        except Error as e:
            logger.error(f"Error fetching order status: {e}")
            return None

    def get_product_info(self, product_id: int = None, product_name: str = None) -> Optional[Dict[str, Any]]:
        """
        Get product information

        Args:
            product_id: Product ID
            product_name: Product name (used if product_id not provided)

        Returns:
            Product information or None
        """
        try:
            with self.get_cursor() as cursor:
                if product_id:
                    query = """
                        SELECT
                            product_id,
                            name,
                            description,
                            price,
                            stock_quantity,
                            category,
                            brand,
                            is_available
                        FROM products
                        WHERE product_id = %s
                    """
                    cursor.execute(query, (product_id,))
                elif product_name:
                    query = """
                        SELECT
                            product_id,
                            name,
                            description,
                            price,
                            stock_quantity,
                            category,
                            brand,
                            is_available
                        FROM products
                        WHERE name LIKE %s
                        LIMIT 5
                    """
                    cursor.execute(query, (f"%{product_name}%",))
                else:
                    return None

                result = cursor.fetchone() if product_id else cursor.fetchall()
                return result

        except Error as e:
            logger.error(f"Error fetching product info: {e}")
            return None

    def get_customer_orders(self, customer_id: int, limit: int = 10) -> Optional[List[Dict[str, Any]]]:
        """
        Get customer's recent orders

        Args:
            customer_id: Customer ID
            limit: Number of orders to retrieve

        Returns:
            List of orders or None
        """
        try:
            with self.get_cursor() as cursor:
                query = """
                    SELECT
                        order_id,
                        order_date,
                        status,
                        total_amount,
                        tracking_number
                    FROM orders
                    WHERE customer_id = %s
                    ORDER BY order_date DESC
                    LIMIT %s
                """
                cursor.execute(query, (customer_id, limit))
                orders = cursor.fetchall()
                return orders

        except Error as e:
            logger.error(f"Error fetching customer orders: {e}")
            return None

    def get_customer_by_email(self, email: str) -> Optional[Dict[str, Any]]:
        """
        Get customer information by email

        Args:
            email: Customer email

        Returns:
            Customer information or None
        """
        try:
            with self.get_cursor() as cursor:
                query = """
                    SELECT
                        customer_id,
                        name,
                        email,
                        phone,
                        address,
                        registration_date
                    FROM customers
                    WHERE email = %s
                """
                cursor.execute(query, (email,))
                customer = cursor.fetchone()
                return customer

        except Error as e:
            logger.error(f"Error fetching customer by email: {e}")
            return None

    def search_products(self, search_term: str, limit: int = 10) -> Optional[List[Dict[str, Any]]]:
        """
        Search products by name or description

        Args:
            search_term: Search term
            limit: Number of results to return

        Returns:
            List of products or None
        """
        try:
            with self.get_cursor() as cursor:
                query = """
                    SELECT
                        product_id,
                        name,
                        description,
                        price,
                        stock_quantity,
                        category,
                        brand
                    FROM products
                    WHERE (name LIKE %s OR description LIKE %s)
                    AND is_available = TRUE
                    LIMIT %s
                """
                search_pattern = f"%{search_term}%"
                cursor.execute(query, (search_pattern, search_pattern, limit))
                products = cursor.fetchall()
                return products

        except Error as e:
            logger.error(f"Error searching products: {e}")
            return None

    def get_order_tracking(self, tracking_number: str) -> Optional[Dict[str, Any]]:
        """
        Get order information by tracking number

        Args:
            tracking_number: Tracking number

        Returns:
            Order information or None
        """
        try:
            with self.get_cursor() as cursor:
                query = """
                    SELECT
                        o.order_id,
                        o.order_date,
                        o.status,
                        o.total_amount,
                        o.tracking_number,
                        o.shipping_address,
                        c.name as customer_name
                    FROM orders o
                    LEFT JOIN customers c ON o.customer_id = c.customer_id
                    WHERE o.tracking_number = %s
                """
                cursor.execute(query, (tracking_number,))
                order = cursor.fetchone()
                return order

        except Error as e:
            logger.error(f"Error fetching order by tracking number: {e}")
            return None

    def execute_custom_query(self, query: str, params: tuple = None) -> Optional[List[Dict[str, Any]]]:
        """
        Execute a custom SELECT query

        Args:
            query: SQL query
            params: Query parameters

        Returns:
            Query results or None
        """
        try:
            with self.get_cursor() as cursor:
                if params:
                    cursor.execute(query, params)
                else:
                    cursor.execute(query)
                results = cursor.fetchall()
                return results

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
