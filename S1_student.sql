## комментарии
-- комментарий
/* многострочный 
коммент
*/
-- 1. Создание БД
CREATE DATABASE IF NOT EXISTS lesson_1;

-- 2. Подключение к конкретной БД
USE lesson_1;

-- 3. Создание таблицы
CREATE TABLE IF NOT EXISTS student
(
	-- Формула стобца: имя_столбца тип_данных ограничения
    id INT PRIMARY KEY AUTO_INCREMENT, -- первичный ключ, целое число
    firstname VARCHAR(45), -- количество символов
    email VARCHAR(45),
    phone VARCHAR(20)
    );  
    
-- заполнение данными таблицы
INSERT student(firstname,email, phone)
VALUES # 3 столбца = 3 значения
	("Artem", "121@mail.ru", "+7-800-123-45-67"), -- id = 1
	("Andrey", "122@mail.ru", "+7-800-123-45-66"), -- id = 2
	("Alex", "123@mail.ru", "+7-800-123-45-65"), -- id = 3
	("Anton", "124@mail.ru", "+7-800-123-45-64"), -- id = 4
	("Viktoria", "125@mail.ru", "+7-800-123-45-63"); -- id = 5
SELECT * FROM student; -- ВЫВОД СОДЕРЖИМОГО ТАБЛИЦЫ;
SELECT firstname, email
FROM student;

SELECT id, email, phone
FROM student
WHERE firstname="Artem";      

SELECT id, email, phone
FROM student
WHERE firstname !="Artem"; 

SELECT id, email, phone
FROM student
WHERE firstname <>"Artem"; 


SELECT id, email, phone
FROM student
WHERE firstname !="Artem"; 


SELECT firstname
FROM student
WHERE firstname LIKE "A%"; 

SELECT firstname
FROM student
WHERE firstname LIKE "A%n";

SELECT firstname
FROM student
WHERE firstname LIKE "A%e%";