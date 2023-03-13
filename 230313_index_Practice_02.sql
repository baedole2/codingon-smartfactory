-- 1. author_id가 1인 작성자의 이메일을 jkrowling@yahoo.com으로 업데이트하는 SQL 문을 작성합니다.
UPDATE authors SET email = 'jkrowling@yahoo.com' WHERE author_id = 1;
-- 2. books 테이블에서 book_id 2인 책을 삭제하는 SQL 문을 작성합니다.

DELETE FROM books WHERE book_id = 2;

ALTER TABLE books DROP FOREIGN KEY author_id;
AlTER TABLE books ADD CONSTRAINT FOREIGN KEY (author_id) REFERENCES authors(author_id) ON UPDATE CASCADE ON DELETE CASCADE;
AlTER TABLE orders ADD CONSTRAINT FOREIGN KEY (book_id) REFERENCES books(book_id) ON UPDATE CASCADE ON DELETE CASCADE;
DELETE FROM books WHERE author_id = 3;

-- 단 현재 authors 테이블의 author_id를 참조하고 있어서 바로 삭제는 안됨.

-- 3. 다음 세부 정보가 포함된 새 책을 삽입하는 SQL 문을 작성합니다.
-- 책 ID: 4
-- 제목: 스탠드
-- 저자 ID: 3
-- 발행일자 : 1978-01-01
 INSERT INTO books VALUES (4,'스탠드',3,'1978-01-01');

-- 4. book_id 1인 책의 출판 날짜를 1997-06-30으로 업데이트하는 SQL 문을 작성하십시오.
UPDATE books SET publication_date = '1997-06-30' WHERE book_id = 1;

-- 5. 022-02-17 이전에 접수된 모든 주문을 삭제하는 SQL 문을 작성합니다.
DELETE FROM orders WHERE order_date < '2022-02-17'; 

-- 6. 다음 세부 정보와 함께 새 주문을 삽입하는 SQL 문을 작성합니다.
-- 주문 ID: 4
-- 책 ID: 1
-- 고객 이름: 사라 존슨
-- 주문일자 : 2022-02-18
INSERT INTO orders VALUES (4,1,'사라 존슨','2022-02-18');

-- 7. order_id가 1인 주문의 고객 이름을 Jack Smith로 업데이트하는 SQL 문을 작성합니다.
UPDATE orders SET customer_name = 'Jack Smith' WHERE order_id = 1;
-- 하지만 이미 지워진 상태라 표면적으론 의미가 없음.

-- 8. 다음 세부 정보와 함께 새 작성자를 삽입하는 SQL 문을 작성합니다.
-- 저자 ID: 4
-- 이름: 아가사
-- 성: 크리스티
-- 이메일: agatha.christie@example.com
INSERT INTO authors VALUES (4,'아가사','크리스티','agatha.christie@example.com');

-- 9. author_id 2인 작성자의 성을 Martinez로 업데이트하는 SQL 문을 작성합니다.
UPDATE authors SET last_name = 'Martinez' WHERE author_id = 2;

-- 10. author_id 3인 저자가 쓴 모든 책을 삭제하는 SQL 문을 작성합니다.
DELETE FROM books WHERE author_id = 3;
-- 단 현재 authors 테이블의 author_id를 참조하고 있어서 바로 삭제는 안됨.