USE smartfactory;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM customer, orders;


SELECT COUNT(*) FROM customer;	-- 11
SELECT COUNT(*) FROM orders;	-- 19
SELECT COUNT(*) FROM customer, orders; -- 11 * 19 = 209 -> 원하는대로 되지 않는다...

-- WHERE 절을 이용한 조인 조건 추가
SELECT * FROM customer, orders WHERE customer.custid = orders.custid;
SELECT COUNT(*) FROM customer, orders WHERE customer.custid = orders.custid; -- 주문자와 고객명이 동일한 경우 출력

-- < JOIN >
SELECT * FROM customer INNER JOIN orders WHERE customer.custid = orders.custid; -- 주문자와 고객명이 동일한 경우 출력
SELECT * FROM customer JOIN orders WHERE customer.custid = orders.custid; -- 주문자와 고객명이 동일한 경우 출력
SELECT COUNT(*) FROM customer INNER JOIN orders ON customer.custid = orders.custid;

SELECT * FROM customer JOIN orders WHERE customer.custid = orders.custid; -- 주문자와 고객명이 동일한 경우 출력


SELECT *
	FROM customer, orders
    WHERE customer.custid = orders.custid
    ORDER BY customer.custid;
SELECT *	-- inner join 적용
	FROM customer INNER JOIN orders
    ON customer.custid = orders.custid
    ORDER BY customer.custid;    


-- 고객별로 주문한 제품 총 구매액을 고객별로 정렬
-- 실행결과 (고객이름, 총 구매액)

SELECT * 
	FROM customer INNER JOIN orders
    on customer.custid = orders.custid
    GROUP BY customer.custid
    HAVING SUM(amount * price);
    
    
SELECT custname, SUM(amount * price) as 'total_price'
	FROM customer INNER JOIN orders
    ON customer.custid = orders.custid
    GROUP BY custname
    ORDER BY custname;

-- < 서브 쿼리, 부속 질의 >
-- : SQL 문 내에 또다른 SQL 문 작성
-- : SELECT 문의 WHERE 절에 또 다른 테이블 경과를 이용해서 다시 SELECT 문을 괄호로 묶는다
-- : ex ) SELECT ~ FROM ~ WHERE (SELECT ~ FROM ~~);
-- STEP 1. 주문 금액이 가장 큰 주문 내역은 무엇인가?
SELECT MAX(amount*price) FROM orders; -- 10000

-- STEP 2. 가장 큰 주문 금액에 대한 주문아이디, 고객아이디, 상품명 조회;
SELECT orderid,custid,prodname
	FROM orders WHERE (amount*price) = (SELECT MAX(amount*price) FROM orders);
    
SELECT orderid, custid, prodname
	FROM orders WHERE (amount*price) = 10000;

-- STEP 3. 서브 쿼리를 이용해 두 SQL 문을 하나로 합치기.
SELECT orderid,custid,prodname
	FROM orders WHERE (amount*price) = (SELECT MAX(amount*price) FROM orders);
    
-- 주문 이력이 있는 고객 조회
SELECT custname FROM customer WHERE custid IN (SELECT custid FROM orders);



