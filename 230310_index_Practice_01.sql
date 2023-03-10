-- 1. SQL 문으로 new_user 테이블 생성하기
USE new_smartfactory;

CREATE TABLE new_user (
	id VARCHAR(10) PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    name VARCHAR(5) NOT NULL,
    gender CHAR(1),
    birthday DATE NOT NULL,
    age INT NOT NULL
);

DESC new_user;


-- 2. DDL을 이용해 아래 테이블 생성하기

CREATE TABLE member (
	id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(5) NOT NULL,
    age int,
    gender VARCHAR(2) NOT NULL,
    email VARCHAR(50),
    promotion VARCHAR(2) default 'x' 
);

DESC member;

-- 3. DDL 이용해 테이블 구조 수정하기
ALTER TABLE member MODIFY id VARCHAR(10);
ALTER TABLE member DROP age;
ALTER TABLE member ADD interest VARCHAR(100);

DESC member;