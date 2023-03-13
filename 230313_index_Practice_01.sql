CREATE DATABASE bookStore CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

use bookStore;

CREATE TABLE authors (
	author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE books (
	book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_date DATE,
    FOREIGN KEY(author_id) REFERENCES authors(author_id)
);

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    book_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY(book_id) REFERENCES books(book_id)
);

INSERT INTO authors VALUES
	(1,'J.K.','Rowling','jkrowling@gmail.com'),
	(2,'George R.R.','Martin','grmartin@yahoo.com'),
	(3,'Stephen','King','sking@hotmail.com');
    
INSERT INTO books VALUES
	(1,'Harry Potter and the Philosopher\'s Stone','1','1997-06-26'),
	(2,'A Game of Thrones','2','1996-08-06'),
	(3,'The Shining','3','1977-01-28');
    
INSERT INTO orders VALUES
	(1,'1','John Smith','2022-02-15'),
	(2,'2','Jane Doe','2022-02-16'),
	(3,'3','Bob Johnson','2022-02-17');
    
SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM orders;