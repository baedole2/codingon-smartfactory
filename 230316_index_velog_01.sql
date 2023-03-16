CREATE DATABASE PRACTICE CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE PRACTICE;

create TABLE students (
	id INT PRIMARY KEY,
    name VARCHAR(10),
    age INT,
    FOREIGN KEY (id) REFERENCES grades(id)
);

create TABLE grades (
	id INT PRIMARY KEY,
    grade INT
);
SELECT * FROM students;
SELECT * FROM grades;

SELECT * FROM students JOIN grades;