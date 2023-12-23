
CREATE TABLE customers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT, 
  phone VARCHAR(10)
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  customer_id INT,
  order_date DATETIME,
  total_price REAL,
  dine_go TEXT 
);

CREATE TABLE status (
  status_id INT,
  statusNm TEXT
);

CREATE TABLE menus (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type TEXT,
  name TEXT,
  price REAL
);

CREATE TABLE ingredients (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  stock INTEGER
);

-- Create a table to store the relationship between orders and menus
CREATE TABLE order_items (
  order_id INT,
  menu_id INT,
  quantity INT
);

--Insert to status
INSERT INTO status (status_id, statusNm)  VALUES (1,'Dine in ');
INSERT INTO status (status_id, statusNm)  VALUES (2,'To go ');


-- Insert to customers
INSERT INTO customers (name, phone) VALUES ('Mama', '0812345678');
INSERT INTO customers (name, phone) VALUES ('Meme', '0823456789');
INSERT INTO customers (name, phone) VALUES ('Lisa', '0834567890');
INSERT INTO customers (name, phone) VALUES ('Jisoo', '0123456789');
INSERT INTO customers (name, phone) VALUES ('Christine', '0125847963');


-- Insert to menus
INSERT INTO menus (type, name, price) VALUES ('pizza', 'Pepperoni Pizza', 350);
INSERT INTO menus (type, name, price) VALUES ('pizza', 'Cheese Pizza', 400);
INSERT INTO menus (type, name, price) VALUES ('appetizer', 'French fried', 79);
INSERT INTO menus (type, name, price) VALUES ('appetizer', 'Chicken stick', 89);
INSERT INTO menus (type, name, price) VALUES ('drink', 'Coke', 25);
INSERT INTO menus (type, name, price) VALUES ('drink', 'Water', 20);


-- Insert to ingredients
INSERT INTO ingredients (name, stock) VALUES ('Flour', 100);
INSERT INTO ingredients (name, stock) VALUES ('Tomato Sauce', 50);
INSERT INTO ingredients (name, stock) VALUES ('Cheese', 25);
INSERT INTO ingredients (name, stock) VALUES ('Pepperoni', 15);
INSERT INTO ingredients (name, stock) VALUES ('Chicken', 20);
INSERT INTO ingredients (name, stock) VALUES ('Potato', 15);




--Orders
--id1 with service charge and vat 7%
INSERT INTO orders 
            (customer_id, 
             order_date, 
             total_price, 
             dine_go)
SELECT 1, 
      '2023-11-01 13:01:15', 
            SUM(m.price * oi.quantity) * 1.17,
            'To go '
FROM menus m
JOIN order_items oi ON m.id = oi.menu_id
WHERE oi.order_id = 1;

INSERT INTO order_items (order_id, menu_id, quantity) VALUES (1, 1, 1);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (1, 2, 1);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (1, 3, 2);

INSERT INTO status VALUES (2,'To go ');

--id2
INSERT INTO orders 
            (customer_id, 
             order_date, 
             total_price, 
             dine_go)
SELECT 2,
      '2023-11-02 14:45:25', 
            SUM(m.price * oi.quantity) * 1.17, 
            'Dine in'
FROM menus m
JOIN order_items oi ON m.id = oi.menu_id
WHERE oi.order_id = 2;

INSERT INTO order_items (order_id, menu_id, quantity) VALUES (2, 2, 1);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (2, 4, 2);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (2, 6, 2);
INSERT INTO status VALUES (1,'Dine in ');

--id3
INSERT INTO orders 
            (customer_id, 
             order_date, 
             total_price, 
             dine_go)
SELECT 3,
      '2023-11-04 09:25:19', 
            SUM(m.price * oi.quantity) * 1.17,
            'To go'
FROM menus m
JOIN order_items oi ON m.id = oi.menu_id
WHERE oi.order_id = 3;

INSERT INTO order_items (order_id, menu_id, quantity) VALUES (3,1, 4);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (3, 3, 1);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (3, 5, 2);

INSERT INTO status VALUES (2,'To go ');

--id4
INSERT INTO orders 
            (customer_id, 
             order_date, 
             total_price, 
             dine_go)
SELECT 4, 
      '2023-11-05 11:08:14', 
            SUM(m.price * oi.quantity) * 1.17, 
            'Dine in'
FROM menus m
JOIN order_items oi ON m.id = oi.menu_id
WHERE oi.order_id = 4;

INSERT INTO order_items (order_id, menu_id, quantity) VALUES (4, 2, 2);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (4, 4, 1);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (4, 6, 2);

INSERT INTO status VALUES (1,'Dine in ');

--id5 
INSERT INTO orders 
            (customer_id, 
             order_date, 
             total_price, 
             dine_go)
SELECT 5,
      '2023-11-07 11:25:58', 
            SUM(m.price * oi.quantity) * 1.17, 
            'Dine in'
FROM menus m
JOIN order_items oi ON m.id = oi.menu_id
WHERE oi.order_id = 4;

INSERT INTO order_items (order_id, menu_id, quantity) VALUES (5, 2, 2);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (5, 4, 1);
INSERT INTO order_items (order_id, menu_id, quantity) VALUES (5, 6, 2);

INSERT INTO status VALUES (1,'Dine in ');

.mode box

--1. JOIN customer id, customer name, menu name and quantity
SELECT o.customer_id, 
      c.name  AS customer_name, 
            m.name AS menu_name, 
            oi.quantity, 
            m.price  
FROM orders o
  JOIN order_items oi ON o.id	= oi.order_id
  JOIN menus m 		ON oi.menu_id	= m.id
  JOIN customers c 	ON o.customer_id  = c.id;

-- 2. Subquery to return customers who ordered more than 2 items 
SELECT o.customer_id, 
      SUM(oi.quantity) AS total_quantity
FROM orders o
  JOIN order_items oi ON o.id = oi.order_id
    GROUP BY o.customer_id
      HAVING SUM(oi.quantity) > 2;

-- 3. Number of customers ordered between Nov 1-7
SELECT COUNT
      (DISTINCT o.customer_id) AS total_customers  
FROM orders o
  WHERE o.order_date 
    BETWEEN '2023-11-01' AND '2023-11-07'; 

-- 4. Connect orders with ingredients
WITH order_ingredients AS (
      SELECT oi.order_id, 
             oi.menu_id, 
             oi.quantity 
     FROM orders o
  JOIN order_items oi ON o.id = oi.order_id
)
    SELECT oi.order_id, 
              i.name, 
              oi.quantity, 
              i.stock - oi.quantity AS remaining_stock
    FROM order_ingredients oi
JOIN ingredients i ON oi.menu_id = i.id;

-- 5. Order details with customer 
SELECT
  o.id       AS order_id,
  o.customer_id,
  c.name     AS customer_name,
  o.dine_go  AS order_status
FROM orders o
JOIN customers c ON o.customer_id = c.id;
