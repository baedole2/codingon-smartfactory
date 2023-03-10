CREATE DATABASE company CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE company;

CREATE TABLE departments (
	id int PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
	id int PRIMARY KEY,
    name VARCHAR(50),
    age int,
    department_id int,
    FOREIGN KEY(department_id) REFERENCES departments(id) ON UPDATE CASCADE ON DELETE CASCADE 
);

DESC departments;
DESC employees;

INSERT INTO departments VALUES (1, 'Sales', 'New York');
INSERT INTO departments VALUES (2, 'Marketing', 'San Francisco');
INSERT INTO departments VALUES (3, 'Engineering', 'Seattle');
INSERT INTO employees VALUES (1, 'John Doe', 25, 1);
INSERT INTO employees VALUES (2, 'Jane Smith', 30, 1);
INSERT INTO employees VALUES (3, 'Bob Johnson', 40, 2);
INSERT INTO employees VALUES (4, 'Alice Lee', 35, 3);
INSERT INTO employees VALUES (5, 'Tom Wilson', 28, 3);

