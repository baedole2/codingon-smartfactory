show databases;
use smartfactory;

-- 1. 모든 회원목록을 가져오는데, 이때 birthday 컬럼의 값을 기준으로 오름차순 정렬하여 가져오시오.
SELECT * FROM user ORDER BY birthday;

-- A-1.
SELECT * FROM user ORDER BY birthday;
SELECT * FROM user ORDER BY birthday ASC;


-- 2. 회원 목록 중 gender 컬럼의 값이 "M"인 회원목록을 가져오는데,
-- 이때 name 컬럼의 값을 기준으로 내림차순 정렬하여 가져오시오.
SELECT * FROM user WHERE gender = 'M' ORDER BY Name DESC;

-- A-2.
SELECT * FROM user WHERE gender = 'M' ORDER BY Name DESC;
SELECT * FROM user WHERE gender IN ('M') ORDER BY Name DESC;


-- 3. 1990 년대에 태어난 회원의 Id, Name 컬럼을 가져와 목록으로 보여주시오.
SELECT Id, Name FROM user WHERE birthday LIKE '199_%';

-- A-3.
SELECT id, name FROM user WHERE birthday LIKE '199%';
SELECT id, name FROM user WHERE birthday BETWEEN '1990-01-01' AND '1999-12-31';
SELECT id, name FROM user WHERE birthday >= '1990-01-01' AND birthday <= '1999-12-31';


-- 4. 6월 생 회원의 목록을 birthday 기준으로 오름차순 정렬하여 가져오시오
SELECT * FROM user WHERE birthday LIKE '____-06-__' ORDER BY birthday;

-- A-4.
SELECT * FROM user WHERE birthday LIKE '%-06-%' ORDER BY birthday;
SELECT * FROM user WHERE birthday LIKE '%-06-%' ORDER BY birthday ASC;
SELECT * FROM user WHERE birthday LIKE '____-06-__' ORDER BY birthday;


-- 5. gender 컬럼의 값이 “M” 이고, 1970 년대에 태어난 회원의 목록을 가져오시오.
SELECT * FROM user WHERE gender = 'M' AND birthday LIKE '197_%';

-- A-5.
SELECT * FROM user WHERE gender = 'M' AND birthday LIKE '197_%';



-- 6. 모든 회원목록 중 age를 기준으로 내림차순 정렬하여 가져오는데, 그때 처음 3개의 레코드만 가져오시오.
SELECT * FROM user ORDER BY age DESC LIMIT 0,3;

-- A-6.
SELECT * FROM user ORDER BY age DESC LIMIT 0,3;



-- 7. 모든 회원 목록 중 나이가 25이상 50이하인 회원의 목록을 출력하시오.
SELECT * FROM user WHERE age BETWEEN 25 AND 50;

-- A-7.
SELECT * FROM user WHERE age BETWEEN 25 AND 50;


