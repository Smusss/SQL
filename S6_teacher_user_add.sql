USE vk_db;
-- Cсылка: https://file.notion.so/f/s/ed99f11a-a5b6-4c6a-8e0b-4b33b70f2af9/vk_db.sql?id=9c3cfb24-07a0-4295-ba9a-2eedc941e695&table=block&spaceId=7cb6e072-1d0a-4d86-8d20-84738dadbe46&expirationTimestamp=1687629340123&signature=IzuGKG3PzR0YsDnKVsIUTkoCccjqHhRSFN_uLdsnMxI&downloadName=vk_db.sql

-- Создание процедуры для добавления нового пользователя с использованием COMMIT / ROLLBACK
DROP PROCEDURE IF EXISTS user_add;
DELIMITER $$ 
CREATE PROCEDURE user_add
(
	firstname VARCHAR(50), lastname VARCHAR(50), email VARCHAR(50), -- users
    phone VARCHAR(50), hometown VARCHAR(50), photo_id INT, birthday DATE,
    OUT result VARCHAR(300)
)
BEGIN
	DECLARE _rollback BIT DEFAULT 0; -- _rollback(_rollback  = 1) - откат; commit - сохранить(_rollback = 0)
	DECLARE code_error VARCHAR(300); --  код ошибки
	DECLARE error_text VARCHAR(300); --  текст ошибки
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
		SET _rollback = 1; -- Найдена ошибка, данные в бд НЕ СОХРАНЯЕМ 
        GET STACKED DIAGNOSTICS CONDITION 1
			code_error = RETURNED_SQLSTATE, error_text = MESSAGE_TEXT;
	END;
    
    START TRANSACTION;

	INSERT INTO users (firstname, lastname, email) -- Имена столбцов
	VALUES (firstname, lastname, email); -- Параметры процедуры
	

	INSERT INTO profiles (user_id, hometown, birthday, photo_id) -- Имена столбцов
	VALUES (last_insert_id(), hometown, birthday, photo_id); -- Параметры процедуры
	
    IF _rollback THEN -- _rollback == 1, то есть ошибка в заполнее данных 
		SET result = CONCAT("Упс! Ошибка: ", code_error, " .Текст ошибки: ", error_text);
        ROLLBACK; -- Откаь изменений , так как у нас есть ошибка 
	ELSE -- _rollback = 0, все ок
		SET result = "O k!";
        COMMIT;
    END IF;

END $$
DELIMITER ;

-- Вызов процедуры 
CALL user_add
	("New", "User", "new_user@gmail.com","0390123", "Moscow", -1, "1998-01-01", @procedure_result);
SELECT @procedure_result;

CALL user_add
	("New", "User", "new_user@gmail.com","0390123", "Moscow", 10, "1998-01-01", @procedure_result);
SELECT @procedure_result;