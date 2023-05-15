use hw5;

CREATE TABLE car_brands (
  Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Cost INT
);

INSERT INTO car_brands (Id, Name, Cost) VALUES
(1, 'Audi', 52642),
(2, 'Mercedes', 57127),
(3, 'Skoda', 9000),
(4, 'Volvo', 29000),
(5, 'Bentley', 350000),
(6, 'Citroen', 21000),
(7, 'Hummer', 41400),
(8, 'Volkswagen', 21600);


/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/

-- 1
CREATE VIEW car_view AS
SELECT * FROM car_brands WHERE Cost < 25000;

-- 2
ALTER VIEW car_view AS
SELECT * FROM car_brands WHERE Cost < 30000;

-- 3
CREATE VIEW sk_au AS
SELECT * FROM car_brands WHERE Name = 'Skoda' or Name = 'Audi';



-- 4
SELECT an_name, an_price FROM Analysis
JOIN Orders ON Analysis.an_id = Orders.ord_an
WHERE ord_datetime between '2020-02-05' and '2020-02-11';

-- 5
CREATE TABLE train_schedule (
  train_id integer,
  station character varying(20),
  station_time time
  );

INSERT INTO train_schedule (train_id, station, station_time) VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');


SELECT *, 
SUBTIME(LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time) as time_to_next_station
FROM train_schedule;
