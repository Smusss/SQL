-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS get_time;

DELIMITER $$
CREATE FUNCTION get_time(time_in INT)
RETURNS VARCHAR(100) NO SQL
BEGIN
    DECLARE time_str VARCHAR(100) DEFAULT " ";
    DECLARE temp INT DEFAULT 0;
    
    SET temp = time_in % 60;  -- sec
    SET time_in = (time_in - temp)/60;  -- to min
    SET time_str = CONCAT(' ', temp, ' seconds.');
	SET temp = time_in % 60; -- min
    SET time_in = (time_in - temp) / 60; -- to hours
    SET time_str = CONCAT(temp,' minutes, ', time_str);
    SET temp = time_in % 24; -- hour
    SET time_in = (time_in - temp) / 24; -- to days
    SET time_str = CONCAT(time_in, ' days, ', temp, ' hours, ', time_str);
 RETURN time_str;
END $$ 
DELIMITER ;

SET @time_in_sec:= 123456;
SELECT get_time(@time_in_sec) AS time_in_string;

-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS print_evens;
DELIMITER //
CREATE PROCEDURE print_evens
(
	IN in_number INT -- макс число
)
BEGIN
	DECLARE n INT;
    DECLARE k INT DEFAULT 2;
    DECLARE i INT DEFAULT 0;
    DECLARE evens VARCHAR(45) DEFAULT "";
    SET n = in_number;

	REPEAT
		SET evens = CONCAT(evens, i, ", ");
        SET i = i + k;
        UNTIL i > n -- Условие выхода из цикла: когда дойдем до максимума
	END REPEAT;
	SELECT evens;
END //

CALL print_evens(15);


/*
Дополнительное задание: (для ВК: https://www.notion.so/c448e32ae1344f22b1deae7f42c8b57f)
Создать процедуру, которая решает следующую задачу
Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
а) из одного города
б) состоят в одной группе
в) друзья друзей

Создать функцию, вычисляющей коэффициент популярности пользователя (по количеству друзей)

Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
(по желанию)

Создайте таблицу logs типа Archive. 
Пусть при каждом создании записи в таблицах users, communities и messages в таблицу logs помещается время и дата создания записи, 
название таблицы, идентификатор первичного ключа. (Триггеры)
*/
