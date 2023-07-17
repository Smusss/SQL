import pymysql
from config import host, password, db_name, user

try:
    connection = pymysql.connect(
        host=host, #host='localhost' from config
        port=3306,
        user=user,
        password=password,
        database=db_name,
        cursorclass=pymysql.cursors.DictCursor #позволяет получить данные из селектов по одной строчке в сиде словаря
    )
    print('Connected')
    try:
        #Все команды
        cursor = connection.cursor()
        #drop вся таблица
        cursor.execute("DROP TABLE IF EXISTS test")
        connection.commit()
        #create
        create_query = """CREATE TABLE IF NOT EXISTS test
                        (
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            firstname VARCHAR(45)
                        );"""
        cursor.execute(create_query)
        print('Table created')

        #insert, update, delete - не сохраняют данные (временное хран), нужна команда сохранения изменений
        insert_query = """INSERT test(firstname)
                VALUES
                    ('Anton'),
                    ('Alex'),
                    ('Michle');"""
        cursor.execute(insert_query)
        connection.commit()
        print('Table corrected')
        #UPDATE
        cursor.execute("UPDATE test SET firstname = 'TEST' WHERE id = 1;")
        connection.commit()
        #delete - значение (объект)
        cursor.execute("DELETE FROM test WHERE id = 3;")
        connection.commit()
        #select

        cursor.execute("SELECT * FROM test;")
        rows = cursor.fetchall() #все строки из таблицы в формате списка словарей
        for row in rows:         #[{'id': 1, 'firstname': 'TEST'}, {'id': 2, 'firstname': 'Alex'}, ...]
            print(row)
        print(rows)

    finally:
        connection.close()

except Exception as ex:
    print(ex)
    print('Disconnected')
