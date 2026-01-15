-- E-commerce Database Schema
-- Voice Customer Service Agent Database

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(50),
    address TEXT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category VARCHAR(100),
    brand VARCHAR(100),
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_name (name),
    INDEX idx_category (category),
    INDEX idx_available (is_available)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    total_amount DECIMAL(10, 2) NOT NULL,
    shipping_address TEXT NOT NULL,
    tracking_number VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    INDEX idx_customer (customer_id),
    INDEX idx_status (status),
    INDEX idx_tracking (tracking_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Order Items table
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    INDEX idx_order (order_id),
    INDEX idx_product (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data

-- Sample customers
INSERT INTO customers (name, email, phone, address) VALUES
('Juan Pérez', 'juan.perez@example.com', '+34 600 123 456', 'Calle Mayor 123, Madrid, España'),
('María García', 'maria.garcia@example.com', '+34 600 234 567', 'Av. Diagonal 456, Barcelona, España'),
('Carlos López', 'carlos.lopez@example.com', '+34 600 345 678', 'Gran Vía 789, Valencia, España'),
('Ana Martínez', 'ana.martinez@example.com', '+34 600 456 789', 'Paseo de Gracia 321, Barcelona, España'),
('Luis Rodríguez', 'luis.rodriguez@example.com', '+34 600 567 890', 'Calle Alcalá 654, Madrid, España');

-- Sample products
INSERT INTO products (name, description, price, stock_quantity, category, brand, is_available) VALUES
('iPhone 15 Pro', 'Smartphone Apple iPhone 15 Pro 256GB', 1199.99, 50, 'Smartphones', 'Apple', TRUE),
('Samsung Galaxy S24', 'Smartphone Samsung Galaxy S24 128GB', 899.99, 75, 'Smartphones', 'Samsung', TRUE),
('MacBook Air M2', 'Portátil Apple MacBook Air 13" M2 256GB', 1299.99, 30, 'Laptops', 'Apple', TRUE),
('Dell XPS 15', 'Portátil Dell XPS 15 Intel i7 512GB', 1499.99, 25, 'Laptops', 'Dell', TRUE),
('Sony WH-1000XM5', 'Auriculares inalámbricos con cancelación de ruido', 399.99, 100, 'Audio', 'Sony', TRUE),
('iPad Pro 12.9"', 'Tablet Apple iPad Pro 12.9" 256GB', 1199.99, 40, 'Tablets', 'Apple', TRUE),
('Samsung TV 55" QLED', 'Televisor Samsung QLED 55 pulgadas 4K', 899.99, 20, 'TV', 'Samsung', TRUE),
('AirPods Pro 2', 'Auriculares inalámbricos Apple AirPods Pro 2da Gen', 279.99, 150, 'Audio', 'Apple', TRUE),
('Logitech MX Master 3', 'Ratón inalámbrico Logitech MX Master 3', 99.99, 80, 'Accesorios', 'Logitech', TRUE),
('Teclado Mecánico Keychron', 'Teclado mecánico Keychron K8 RGB', 89.99, 60, 'Accesorios', 'Keychron', TRUE);

-- Sample orders
INSERT INTO orders (customer_id, status, total_amount, shipping_address, tracking_number) VALUES
(1, 'delivered', 1199.99, 'Calle Mayor 123, Madrid, España', 'ES123456789'),
(2, 'shipped', 899.99, 'Av. Diagonal 456, Barcelona, España', 'ES234567890'),
(3, 'processing', 1579.98, 'Gran Vía 789, Valencia, España', 'ES345678901'),
(4, 'pending', 379.98, 'Paseo de Gracia 321, Barcelona, España', NULL),
(1, 'delivered', 1299.99, 'Calle Mayor 123, Madrid, España', 'ES456789012'),
(5, 'shipped', 189.98, 'Calle Alcalá 654, Madrid, España', 'ES567890123');

-- Sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
-- Order 1: Juan Pérez - iPhone 15 Pro
(1, 1, 1, 1199.99),

-- Order 2: María García - Samsung Galaxy S24
(2, 2, 1, 899.99),

-- Order 3: Carlos López - MacBook Air M2 + Ratón
(3, 3, 1, 1299.99),
(3, 9, 1, 99.99),
(3, 10, 2, 89.99),

-- Order 4: Ana Martínez - Sony WH-1000XM5 + AirPods Pro 2
(4, 5, 1, 399.99),
(4, 8, 1, 279.99),

-- Order 5: Juan Pérez - MacBook Air M2
(5, 3, 1, 1299.99),

-- Order 6: Luis Rodríguez - Logitech MX Master 3 + Teclado
(6, 9, 1, 99.99),
(6, 10, 1, 89.99);

-- Create a view for order summaries
CREATE OR REPLACE VIEW order_summary AS
SELECT
    o.order_id,
    o.customer_id,
    c.name as customer_name,
    c.email as customer_email,
    o.order_date,
    o.status,
    o.total_amount,
    o.tracking_number,
    COUNT(oi.order_item_id) as item_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id, c.name, c.email, o.order_date, o.status, o.total_amount, o.tracking_number;

-- Grant permissions
GRANT ALL PRIVILEGES ON ecommerce.* TO 'root'@'%';
FLUSH PRIVILEGES;
