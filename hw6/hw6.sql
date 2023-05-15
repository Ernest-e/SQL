use hw6;

/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/


-- 1
DELIMITER $$
CREATE FUNCTION times(num INT)
RETURNS VARCHAR (100)
DETERMINISTIC
BEGIN
	RETURN CONCAT(
		FLOOR(num / (24 * 3600)), ' days ',
		FLOOR((num % (24 * 3600)) / 3600), ' hours ',
		FLOOR((num % 3600) / 60), ' minutes ',
		num % 60, ' seconds'
	);
END$$
DELIMITER ;  

SELECT times(123456);

-- 2
DELIMITER $$
CREATE PROCEDURE evens(n INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE res VARCHAR (100) DEFAULT ' ';
	WHILE i <= n DO
		IF i % 2 = 0 THEN
			SET res = CONCAT(res, ' ', i);
		END IF;
		SET i = i + 1;
	END WHILE;
    SELECT res;
END $$
DELIMITER ;

CALL evens(10)
