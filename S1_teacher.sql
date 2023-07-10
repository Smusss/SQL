# Комментарий 
-- После "--" обязательно ставится пробел
/*
Это многострочный
комментарий 
*/
-- Операторы SQL пишутся В ВЕРХНЕМ РЕГИСТРЕ, snake_case
-- 1. Создание БД 
CREATE DATABASE IF NOT EXISTS lesson_1; -- Создал БД lesson_1, если ЕЕ не было раньше

-- 2. Подключение к конкретной базе 
USE lesson_1; -- Выбрал БД для работы lesson_1

-- 3. Создание таблицы - студент. 
DROP TABLE IF EXISTS student; -- Удалить таблицу, если она существует
CREATE TABLE IF NOT EXISTS student
(
	-- Формула столбца: имя_столбца тип_данных ограничения 
    id INT PRIMARY KEY AUTO_INCREMENT, -- первичный ключ, целое число 
    first_name VARCHAR(45), -- Количество символов в (), строчка на 45 символов
    email VARCHAR(45), -- Почта человека 
    phone VARCHAR(20) -- Номер телефона: "+7-999-888-77-66"
);

-- 4. Заполнение таблицы данными
INSERT student(first_name,email,phone)
VALUES # 3 столбца = 3 значения 
	("Артем", "ffakfkafk@gmail.com", "+7-999-888-55-77"), -- id = 1
    ("Андрей", "ffakfkafk@gmail.com", "+7-999-888-55-77"), -- id = 2
	("Алексей", "ffakfkafk@gmail.com", "+7-999-888-55-77"), -- id = 3
    ("Алексаднр", "ffakfkafk@gmail.com", "+7-999-888-55-77"), -- id = 4
    ("Виктория", "ffakfkafk@gmail.com", "+7-999-888-55-77"); -- id = 5

SELECT * FROM student; -- Вывести все содержимое таблицы student

-- Вывести только имя и почту студентов 
SELECT first_name, email
FROM student;

-- Вывести только телефон и почту студента Артем
SELECT phone, email, first_name, id
FROM student
WHERE first_name = "Артем";

-- Вывести только телефон и почту студентов всех, кроме Артема 
SELECT phone, email, first_name, id
FROM student
WHERE first_name <> "Артем"; --  "!=" и "<>" - одно и то же

-- Вывести инфо о студентах, имена которых начинаются с буквы "А"
SELECT phone, email, first_name, id
FROM student
WHERE first_name LIKE "А%";

SELECT phone, email, first_name, id
FROM student
WHERE first_name LIKE "А%е%";