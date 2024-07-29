CREATE DATABASE Online_Store_db;
USE Online_Store_db;


CREATE TABLE category(
category_id INT PRIMARY KEY,
category_type VARCHAR(80)
);

INSERT INTO category(category_id,category_type) VALUES
(1, 'Electronic'),
(2 , 'Books'),
(3 , 'Clothing'),
(4 , 'Home-Decor');

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category_id INT,
product_price INT,
product_qnty INT,
FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO products(product_id,product_name,category_id,product_price,product_qnty) VALUES 
(11 , 'Laptop' , 1 , 40000 , 10),
(12 , 'Mouse' , 1 , 300 , 15),
(13 , 'Trousers', 3 , 500 , 10),
(14 , 'Novel' , 2 , 200 , 20),
(15 , 'Metal Wall Decor' , 4 , 2000 , 50),
(16 , 'Lamps' , 4 , 1000 , 12),
(17 , 'Sofa Set' , 4 , 25000 , 5),
(18 , 'Smart Phones' , 1 , 70000 , 8);



CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
customer_email VARCHAR(100),
customer_mobile NUMERIC(10)
);

INSERT INTO customers(customer_id,customer_name,customer_email,customer_mobile) VALUES 
(470 , 'Ruhi' , 'ruhi123@gmail.com' , 9818679810 ),
(472 , 'Raj' , 'raj45@gmail.com' , 9012347689),
(489 , 'Karan' , 'karan67@gmail.com' , 7865903490),
(477 , 'Noah' , 'noah20@gmail.com' , 8909385672);

CREATE TABLE orders_db(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);

INSERT INTO orders_db(order_id,customer_id,order_date) VALUES
(41 , 470 , str_to_date('20-06-2024' , '%d-%m-%Y')),
(42 , 472 , str_to_date('28-02-2024' , '%d-%m-%Y')),
(43 , 489 , str_to_date('10-06-2024' , '%d-%m-%Y')),
(44 , 477 , str_to_date('15-03-2024' , '%d-%m-%Y'));


CREATE TABLE order_details(
order_detail_id INT PRIMARY KEY,
order_id INT,
customer_id INT,
product_id INT,
quantity INT,
unit_price INT,
FOREIGN KEY (order_id) REFERENCES orders_db(order_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_details(order_detail_id,order_id,customer_id,product_id,quantity,unit_price) VALUES
(01 , 41 , 470 , 11 , 1 , 40000),
(02 , 41 , 470 , 15 , 4 , 2000),
(03 , 43 , 489 , 18 , 1 , 70000),
(04 , 42 , 472 , 13 , 2 , 500),
(05 , 42 , 472 , 17 , 2 , 25000),
(06 , 44 , 477 , 14 , 5 , 200),
(07 , 44 , 477 , 16 , 2 , 1000),
(08 , 44 , 477 , 12 , 2 , 300);	


SELECT * FROM order_details 
WHERE quantity >= 2;

SELECT product_name , product_price 
FROM products
WHERE category_id = (SELECT category_id FROM category WHERE category_type = 'Electronic');

SELECT p.product_name , SUM(OD.quantity) AS total_sold
FROM order_details OD
JOIN products P
ON OD.product_id = P.product_id
GROUP BY OD.product_id , p.product_name
ORDER BY total_sold DESC
LIMIT 5;


SELECT SUM(od.quantity * od.unit_price) AS total_sales
FROM orders_db o
JOIN order_details od ON o.order_id = od.order_id;


SELECT * FROM category;
SELECT * FROM products;
SELECT * FROM orders_db;
SELECT * FROM order_details;
SELECT * FROM customers;




































