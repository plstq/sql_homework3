use homework3;
CREATE TABLE salespeople (
    snum INT,
    sname VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO salespeople (snum, sname, city)
VALUES
    (1001, 'Peel', 'London'),
    (1002, 'Serres', 'San Jose'),
    (1004, 'Motika', 'London'),
    (1007, 'Rifkin', 'Barcelona'),
    (1003, 'Axelrod', 'New York');
select * from salespeople;
--------------------------------------------------
CREATE TABLE customers (
    cnum INT,
    cname VARCHAR(50),
    city VARCHAR(50),
    rating INT,
    snum INT
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
    (2001, 'Hoffman', 'London', 100, 1001),
    (2002, 'Giovanni', 'Rome', 200, 1003),
    (2003, 'Liu', 'SanJose', 200, 1002),
    (2004, 'Grass', 'Berlin', 300, 1002),
    (2006, 'Clemens', 'London', 100, 1001),
    (2008, 'Cisneros', 'SanJose', 300, 1007),
    (2007, 'Pereira', 'Rome', 100, 1004);
select * from customers;
--------------------------------------------------
CREATE TABLE orders (
    onum INT,
    amt DECIMAL(10, 2),
    odate DATE,
    cnum INT,
    snum INT
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
    (3001, 18.69, '1990-10-03', 2008, 1007),
    (3003, 767.19, '1990-10-03', 2001, 1001),
    (3002, 1900.10, '1990-10-03', 2007, 1004),
    (3005, 5160.45, '1990-10-03', 2003, 1002),
    (3006, 1098.16, '1990-10-03', 2008, 1007),
    (3009, 1713.23, '1990-10-04', 2002, 1003),
    (3007, 75.75, '1990-10-04', 2004, 1002),
    (3008, 4723.00, '1990-10-05', 2006, 1001),
    (3010, 1309.95, '1990-10-06', 2004, 1002),
    (3011, 9891.88, '1990-10-06', 2006, 1001);
select * from orders;
-- task 1
SELECT s.city, s.sname, s.snum, NULL as comm
FROM salespeople s;
-- task 2
SELECT c.rating, c.cname
FROM customers c
JOIN salespeople s ON c.snum = s.snum
WHERE c.city = 'SanJose';
-- task 3
SELECT DISTINCT snum
FROM orders;
-- task 4
SELECT *
FROM customers
WHERE cname LIKE 'G%';
-- task 5
SELECT *
FROM orders
WHERE amt > 1000;
-- task 6
SELECT MIN(amt) as min_amt
FROM orders;
-- task 7
SELECT *
FROM customers
WHERE rating > 100 AND city <> 'Rome';
--------------------------------------------------
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполнение данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);
select * from staff;
-- task 1
SELECT *
FROM staff
ORDER BY salary DESC;
-- task 2
SELECT s.*
FROM staff s
JOIN (
    SELECT salary
    FROM staff
    ORDER BY salary DESC
    LIMIT 5
) t ON s.salary = t.salary
ORDER BY s.salary ASC;
-- task 3
SELECT post, SUM(salary) AS total_salary
FROM staff
GROUP BY post
HAVING total_salary > 100000;