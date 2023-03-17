-- cpp_db 이름의 데이터베이스 생성
CREATE DATABASE cpp_db_practice CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- user 이름의 사용자 생성
CREATE USER 'user2'@'localhost' IDENTIFIED BY '10130424';

-- user 사용자에게 모든 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'user2'@'localhost' WITH GRANT OPTION;
-- 현재 유저 목록 조회
SELECT user FROM mysql.user;

USE cpp_db_practice;
SHOW TABLES;
SELECT * FROM characters;
