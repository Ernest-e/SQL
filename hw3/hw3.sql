USE hw3;



CREATE TABLE SALESPEOPLE (
  snum INT PRIMARY KEY,
  sname VARCHAR(25),
  city VARCHAR(25),
  comm FLOAT
);

INSERT INTO SALESPEOPLE (snum, sname, city, comm)
VALUES 
  (1001, 'Peel', 'London', 0.12),
  (1002, 'Serres', 'San Jose', 0.13),
  (1003, 'Motika', 'London', 0.11),
  (1004, 'Rifkin', 'Barcelona', 0.15),
  (1005, 'Axelrod', 'New York', 0.10);

CREATE TABLE customers (
  cnum INT PRIMARY KEY,
  cname VARCHAR(255),
  city VARCHAR(255),
  rating INT,
  snum INT,
  FOREIGN KEY (snum) REFERENCES SALESPEOPLE(snum)
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
  (2001, 'Hoffman', 'London', 100, 1001),
  (2002, 'Giovanni', 'Rome', 200, 1003),
  (2003, 'Liu', 'San Jose', 200, 1002),
  (2004, 'Grass', 'Berlin', 300, 1002),
  (2006, 'Clemens', 'London', 100, 1001),
  (2007, 'Pereira', 'Rome', 100, 1004),
  (2008, 'Cisneros', 'San Jose', 300, 1005);

CREATE TABLE orders (
  onum INT NOT NULL,
  amt DECIMAL(10,2) NOT NULL,
  odate DATE NOT NULL,
  cnum INT NOT NULL,
  snum INT NOT NULL,
  PRIMARY KEY (onum),
  FOREIGN KEY (cnum) REFERENCES customers(cnum),
  FOREIGN KEY (snum) REFERENCES SALESPEOPLE(snum)
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
  (3001, 18.69, '1990-10-03', 2008, 1005),
  (3002, 1900.10, '1990-10-03', 2007, 1004),
  (3003, 767.19, '1990-10-03', 2001, 1001),
  (3005, 5160.45, '1990-10-03', 2003, 1002),
  (3006, 1098.16, '1990-10-03', 2008, 1005),
  (3007, 75.75, '1990-10-04', 2004, 1002),
  (3008, 4723.00, '1990-10-05', 2006, 1001),
  (3009, 1713.23, '1990-10-04', 2002, 1003),
  (3010, 1309.95, '1990-10-06', 2004, 1002),
  (3011, 9891.88, '1990-10-06', 2006, 1001);



/*
1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

*/

-- 1
SELECT city, sname, snum, comm FROM SALESPEOPLE;

-- 2
SELECT cname, rating FROM customers
WHERE city = 'San Jose';

-- 3
SELECT DISTINCT snum FROM SALESPEOPLE;

-- 4
SELECT * from customers
WHERE cname LIKE 'G%';

-- 5
SELECT * FROM orders
WHERE amt >1000;

-- 6 
 SELECT * FROM orders
 WHERE amt = (SELECT MIN(amt) FROM orders);
 
 -- 7 
  SELECT * FROM customers
  WHERE rating > 100 AND NOT city = 'Rome';
  
  