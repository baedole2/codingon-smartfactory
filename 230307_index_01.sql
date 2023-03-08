USE smartfactory;

-- 고객 테이블의 모든 정보를 조회
SELECT * FROM orders;

-- 모든 고객의 고객 아이디를 검색
SELECT custid FROM customer;

-- 모든 고객의 고객아이디와 생년월일을 검색
SELECT custid, birth FROM customer;
SELECT birth, custid FROM customer;

-- 모든 고객의 아이디, 주소, 전화번호, 이름, 생년월일 검색
SELECT custid, addr, phone, custname, birth FROM customer;

-- (와일드카드 사용) 모든 고객의 아이디, 주소, 전화번호, 이름, 생년월일 검색
SELECT * FROM customer;

-- 고객 테이블에 있는 모든 주소를 검색 (중복 포함된 결과)
SELECT addr FROM customer;

-- 고객 테이블에 있는 중복을 제외한 주소 검색
-- DISTINCT : 중복값 제거
SELECT DISTINCT addr FROM customer;

-- WHERE 절
-- 고객 이름이 강례린인 고객을 검색
SELECT * FROM customer WHERE custname='강해린';

-- 제품 가격이 4000원 이상인 주문 내역을 검색
SELECT * FROM orders WHERE price >= 4000;

-- 범위 : BETWEEN a AND begin
-- 1995년 이상 2000년 이하 출생 고객을 검색
SELECT * FROM customer WHERE birth BETWEEN '1995-01-01' AND '2000-12-31';
SELECT * FROM customer WHERE birth >= '1995-01-01' AND birth <= '2000-12-31';

-- 집합
-- 주소가 서울 혹은 런던인 고객 검색
SELECT * FROM customer WHERE addr IN ('대한민국 서울', '영국 런던');
SELECT * FROM customer WHERE addr LIKE '대한민국 서울' or addr LIKE '영국 런던';

-- 주소가 서울 혹은 런던이 아닌 고객 검색
SELECT * FROM customer WHERE addr NOT IN ('대한민국 서울' , '영국 런던');
SELECT * FROM customer WHERE addr <> '대한민국 서울' and addr <> '영국 런던';

-- 패턴 (LIKE) : 특정 패턴을 포함하는 데이터를 검색
-- % : 0개 이상의 문자
-- _ : 1개의 단일 문자
-- 주소가 '미국 로스앤젤레스' 인 고객 검색
SELECT * FROM customer WHERE addr LIKE '미국 로스앤젤레스';

-- 주소에 '미국'이 포함되어 있는 고객 검색
-- 검출 가능한 케이스 예시 : '미국', '미국 ', '미국 워싱턴', '미국 로스앤젤레스', ...
SELECT * FROM customer WHERE addr LIKE '미국%';
-- 주의) 검색 안됨
SELECT * FROM customer WHERE addr = '미국%';
SELECT * FROM customer WHERE addr IN ('미국%');
SELECT * FROM customer WHERE addr LIKE '미국_'; -- 검출 가능한 케이스 예시 : '미국 ' ,

-- 고객 이름 두번째 글자가 '지'인 고객 검색
SELECT * FROM customer WHERE custname LIKE '_지%';

-- 객 이름 세번째 글자가 '수'인 고객 검색
SELECT * FROM customer WHERE custname LIKE '__수%';

-- 복합 조건 (AND, OR, NOT)
-- 주소지가 대한민국이고, 2000년 이후 출생 고객 검색
SELECT * FROM customer WHERE addr LIKE '대한민국%' AND birth >= '2000-01-01';
SELECT * FROM customer WHERE addr LIKE '대한민국%' AND birth >= '20000101';

-- 주소지가 미국이거나 영국인 고객 검색
SELECT * FROM customer WHERE addr LIKE '미국%' OR addr LIKE '영국%';
-- 검색 되는 이유 조건1(addr LIKE '미국%')과 조건2(addr LIKE '영국%')에 대해서 OR 검색을 수행
SELECT * FROM customer WHERE addr LIKE '미국%' OR '영국%'; 
-- 검색 안되는 이유 조건1(addr LIKE '미국%')과 조건2('영국%')에 대해서 OR 검색을 수행

-- 휴대폰 번호 마지막 자리가 4가 아닌 고객 검색
SELECT * FROM customer WHERE phone NOT LIKE '%4';


-- < ORDER BY >
-- order by 절을 사용하지 않는 경우, pk 기준으로 정렬
SELECT * FROM customer;

-- custname 속성을 기준으로 "오름차순" 정렬
SELECT * FROM customer ORDER BY custname;

-- custname 속성을 기준으로 "내림차순" 정렬
SELECT * FROM customer ORDER BY custname DESC;


-- order by & where 함께 사용
-- 2000년 이후 출생자 중에서 주소를 기준으로 내림차순 검색
-- SELECT * FROM customer ORDER BY addr DESC WHERE birth >= '2000-01-01';
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY addr DESC;

-- 2000년 이후 출생자 중에서 주소를 기준으로 내림차순 그리고 아이디를 기준으로 내림차순 검색
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY addr DESC, custid DESC;
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY custid DESC, addr DESC;

-- ORDER BY 뒤에 여러 개의 속성을 줄 수 있음
-- 아래 두 쿼리문의 결과는 상이함
SELECT * FROM orders ORDER BY price, amount;
SELECT * FROM orders ORDER BY amount, price;


-- < LIMIT >
-- LIMIT 형식: LIMIT 시작, 개수 == LIMIT 개수 OFFSET 시작
-- 주의) LIMIT 에서 시작은 0임을 잊지말자!!
-- ex. LIMIT 2 == LIMIT 0, 2 == LIMIT 2 OFFSET 0
-- 고객 테이블 전체 정보를 조회하는데, 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer LIMIT 2;
SELECT * FROM customer LIMIT 0, 2;

-- 고객 테이블 전체 정보를 조회하는데, 두번째부터 여섯번째 행만 조회하고 싶은 경우
SELECT * FROM customer LIMIT 1, 5;
SELECT * FROM customer LIMIT 5 OFFSET 1;

-- 2000년 이후 출생 고객 중에서 앞에 2건만 조회하고 싶은 경우
SELECT * FROM customer WHERE birth >= '2000-01-01' LIMIT 2;

-- 2000년 이후 출생 고객 중에서 뒤에 2건만 조회하고 싶은 경우
SELECT * FROM customer WHERE birth >= '2000-01-01' ORDER BY custid DESC LIMIT 2;
SELECT * FROM customer LIMIT 1, 2;

-- 이하 2023-03-08 수업 내용

-- < IS NULL >
-- 고객 테이블에서 연락처가 존재하지 않는 고객 조회
SELECT * FROM customer WHERE phone IS NULL;
SELECT * FROM customer WHERE birth IS NULL;
SELECT * FROM customer WHERE phone IS NULL AND birth IS NULL;

-- 고객 테이블에서 연락처가 존재하는 고객 조회
SELECT * FROM customer WHERE phone IS NOT NULL;


-- < 집계 함수 >
-- SUM, AVG, MIN, MAX, COUNT
SELECT * FROM orders;

-- 주문 테이블에서 총 판매 개수 검색 + 의미 있는 열 이름으로 변경
SELECT SUM(amount) AS total_amount FROM orders; -- 49
SELECT SUM(amount) AS 'total_amount' FROM orders; -- 49
SELECT SUM(amount) '총 판매개수' FROM orders; -- 49
SELECT SUM(amount) 총판매개수 FROM orders; -- 49

-- 주문 테이블에서 총 주문 내역 건수 조회
-- COUNT(*) : 모든 행의 개수를 카운트
SELECT COUNT(*) FROM orders;
SELECT COUNT(orderid) FROM orders;

SELECT COUNT(*) FROM customer; -- 11
SELECT COUNT(phone) FROM customer; -- 10
SELECT COUNT(birth) FROM customer; -- 9

-- 주문 테이블에서 총 판매 개수, 평균 판매 개수, 상품 최저가, 상품 최고가 검색
-- 총 판매 개수 : SUM()
-- 평균 판매 개수 : AVG()
-- 상품 최저가 : MIN()
-- 상품 최고가 : MAX()

SELECT SUM(amount) '총 판매 개수',
		AVG(amount) '평균 판매 개수',
        MIN(price) '상품 최저가',
        MAX(price) '상품 최고가'
FROM orders;
        
-- 고객별로 주문한 주문 내역 건수 구하기
SELECT custid, count(*) FROM orders GROUP BY custid;

-- 고객별로 주문한 상품 총 수량 구하기
SELECT custid, SUM(amount) FROM orders GROUP BY custid;

-- 고객별로 주문한 총 주문액 구하기
-- 사칙연산 : +, -, *, /
SELECT custid, SUM(price * amount) FROM orders GROUP BY custid;

-- 상품별로 판매 개수 구하기
SELECT prodname, SUM(amount) AS '판매 개수' FROM orders GROUP BY prodname ORDER BY '판매 개수' DESC;		-- ORDER BY 작동안함
SELECT prodname, SUM(amount) AS 판매개수 FROM orders GROUP BY prodname ORDER BY 판매개수 DESC;			-- ORDER BY 작동함	
SELECT prodname, SUM(amount) AS 'total' FROM orders GROUP BY prodname ORDER BY 'total' DESC;		-- ORDER BY 작동안함	
SELECT prodname, SUM(amount) AS '판매 개수' FROM orders GROUP BY prodname ORDER BY SUM(amount) DESC;	-- ORDER BY 작동함
SELECT prodname, SUM(amount) AS 판매개수 FROM orders GROUP BY prodname ORDER BY SUM(amount) DESC;		-- ORDER BY 작동함

-- 추가) 짝수 해에 태어난 고객 조회
SELECT * FROM customer WHERE YEAR(birth) % 2 = 0;

-- 추가) 2000-02-22 다음날에 태어난 고객 조회
-- DATE('2000-02-22'): '2000-02-22' 문자 데이터를 날짜 데이터로 변환
SELECT * FROM customer WHERE birth = DATE('2000-02-22') + 1;

-- 추가) 홀수 일에 태어난 고객 조회
SELECT * FROM customer WHERE MOD(DAY(birth), 2) = 1;

-- < HAVING >
-- group by 명령 이후 추가 조건

-- 총 주문액이 10000원 이상인 고객에 대해 고객별로 주문한 상품 총 수량 구하기
-- = 고객별로 // 주문한 상품 총 수량 구하기


-- HAVING 절은 GROUP BY 절과 반드시 함게 사용 해야함
-- HAVNIG 절은 WHERE 절보다 뒤에 나와야 함.

-- 총 주문액이 10000원 이상인 고객에 대해 고객별로 주문한 상품 총 수량 구하기 (단, custid가 'bunny' 인 경우 제외)
SELECT custid, SUM(amount), SUM(price * amount) AS '확인용'
	FROM orders
    WHERE custid <> 'bunny'
	GROUP BY custid HAVING SUM(price * amount) >= 10000;
