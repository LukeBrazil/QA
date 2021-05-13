CREATE DATABASE IF NOT EXISTS gamesdb;
SHOW DATABASES;

CREATE TABLE customers(
	customer_id INT NOT NULL AUTO_INCREMENT,
    first_name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    address varchar(100) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE products(
	product_id INT NOT NULL AUTO_INCREMENT,
    product_name varchar(20) NOT NULL,
    product_price float NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE orders(
	order_id INT NOT NULL AUTO_INCREMENT,
    fk_customer_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    order_quantity INT NOT NULL,
    FOREIGN KEY (fk_customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (fk_product_id) REFERENCES products(product_id),
    PRIMARY KEY (order_id)
);

SHOW TABLES;
desc customers;

INSERT INTO customers(first_name, last_name, address) values ('Luke', 'Brazil', '555 Ace Trace Blvd');
SELECT * FROM CUSTOMERS;
INSERT INTO products(product_name, product_price) values('iPhone 11', 134.85);
SELECT * FROM products;
INSERT INTO orders(fk_customer_id, fk_product_id, order_quantity) values (1, 1, 25);
SELECT * FROM orders
ALTER TABLE orders ADD date_ordered DATETIME NOT NULL DEFAULT current_timestamp;
INSERT INTO orders(fk_customer_id, fk_product_id, order_quantity) values (1, 1, 2);
SELECT * FROM orders;
SELECT orders.order_id, customers.customer_id, customers.first_name, customers.last_name, customers.address
FROM orders
INNER JOIN customers on orders.fk_customer_id=customers.customer_id;
-- ;