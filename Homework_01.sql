/*
Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц
Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными
Выведите название, производителя и цену для товаров, количество которых превышает 2
Выведите весь ассортимент товаров марки “Samsung”
Допы:
Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
4.1. Товары, в которых есть упоминание "Iphone"
4.2. "Galaxy"
4.3. Товары, в которых есть ЦИФРЫ(REGEXP - регулярки, либо RLIKE)
4.4. Товары, в которых есть ЦИФРА "8"
*/

CREATE DATABASE IF NOT EXISTS homework_01;
USE homework_01;

CREATE TABLE IF NOT EXISTS phone
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    model VARCHAR(30), 
	manufacturer VARCHAR(30),
    price_rub FLOAT
    );  
    
INSERT PHONE (model, manufacturer, price_rub)
VALUES
	("A40", "Sumsung", 40000),
	("Iphone 5", "Iphone", 110000), 
	("OnePlus 5", "OnePlus", 50000), 
	("v80", "Motorola", 5000),
    ("Galaxy", "Sumsung", 60000),
    ("11", "Iphone", 150000), 
	("A80", "Xiaomi", 30000);
    
SELECT * FROM phone;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT id, model, manufacturer, price_rub FROM phone
WHERE manufacturer = "Sumsung";

-- Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT id, model, manufacturer, price_rub FROM phone
WHERE 100000 < price_rub AND price_rub < 140000;

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT id, model, manufacturer, price_rub FROM phone
WHERE model LIKE "%Iphone%" OR manufacturer LIKE "%Iphone%";

-- 4.2. "Galaxy"
SELECT id, model, manufacturer, price_rub FROM phone
WHERE model LIKE "%Galaxy%" OR manufacturer LIKE "%Galaxy%";

-- Товары, в которых есть ЦИФРЫ(REGEXP - регулярки, либо RLIKE)
SELECT id, model, manufacturer, price_rub FROM phone
WHERE model RLIKE "[0-9]" OR manufacturer RLIKE "[0-9]";

SELECT id, model, manufacturer, price_rub FROM phone
WHERE model REGEXP "[0-9]" OR manufacturer REGEXP "[0-9]";

-- 4.4. Товары, в которых есть ЦИФРА "8"
SELECT id, model, manufacturer, price_rub FROM phone
WHERE id LIKE "%8%" OR model LIKE "%8%" OR manufacturer LIKE "%8%" OR price_rub LIKE "%8%";

SELECT id, model, manufacturer, price_rub FROM phone
WHERE id OR model OR manufacturer OR price_rub LIKE "%8%";


