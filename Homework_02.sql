-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
DROP TABLE IF EXISTS sales;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	count_product INT
);

INSERT sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

-- 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
/* меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ */

ALTER TABLE sales
ADD COLUMN order_type VARCHAR(20);

UPDATE sales
SET order_type = 'Маленький заказ'
WHERE count_product < 100;

UPDATE sales
SET order_type = 'Средний заказ'
WHERE count_product >= 100 AND count_product < 300;

UPDATE sales
SET order_type = 'Большой заказ'
WHERE count_product >= 300;

SELECT id, order_type FROM sales;

# 3. Создайте таблицу “orders”, заполните ее значениями
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(30),
	amount FLOAT,
    order_status VARCHAR(10)
);

INSERT orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00 ,'OPEN'),
    ('e01', 25.50 ,'OPEN'),
    ('e05', 100.70 ,'CLOSED'),
    ('e02', 22.18 ,'OPEN'),
    ('e04', 9.50 ,'CANCELLED');
    
SELECT * FROM ORDERS;

SELECT
id, 
	CASE
		WHEN order_status  = 'OPEN' 
			THEN 'Order is in open state'
		WHEN order_status  = 'CLOSED'
			THEN 'Order is closed'
		WHEN order_status  = 'CANCELLED'
			THEN 'Order is cancelled'
		ELSE 'Error'
	END AS full_order_status
FROM ORDERS;