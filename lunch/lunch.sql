/* 관리자 */
DROP TABLE lunch_admin 
	CASCADE CONSTRAINTS;

/* 새 테이블 */
DROP TABLE TABLE2 
	CASCADE CONSTRAINTS;

/* 도시락 */
DROP TABLE lunch 
	CASCADE CONSTRAINTS;

/* 주문 */
DROP TABLE ordering 
	CASCADE CONSTRAINTS;

-----------------------------------------------

/* 관리자 */
CREATE TABLE lunch_admin (
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pass VARCHAR2(20) NOT NULL, /* 비밀번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	input_date DATE DEFAULT default sysdate /* 입력일 */
);




CREATE UNIQUE INDEX PK_lunch_admin
	ON lunch_admin (
		id ASC
	);

ALTER TABLE lunch_admin
	ADD
		CONSTRAINT PK_lunch_admin
		PRIMARY KEY (
			id
		);

/* 새 테이블 */
CREATE TABLE TABLE2 (
);

COMMENT ON TABLE TABLE2 IS '새 테이블';

/* 도시락 */
CREATE TABLE lunch (
	lunch_code CHAR(10) NOT NULL, /* 도시락 코드 */
	lunch_name VARCHAR2(60) NOT NULL, /* 도시락 */
	img VARCHAR2(90) NOT NULL, /* 이미지 */
	price NUMBER(5) NOT NULL, /* 단가 */
	spec VARCHAR2(4000) NOT NULL, /* 특징 */
	input_date DATE DEFAULT default sysdate, /* 입력일 */
	id VARCHAR2(20) /* 아이디 */
);



CREATE UNIQUE INDEX PK_lunch
	ON lunch (
		lunch_code ASC
	);

ALTER TABLE lunch
	ADD
		CONSTRAINT PK_lunch
		PRIMARY KEY (
			lunch_code
		);
		
------------------------DDL for table ordering

/* 주문 */
CREATE TABLE ordering (
	order_num CHAR(12) NOT NULL, /* 주문번호 */
	quan NUMBER(2) NOT NULL, /* 수량 */
	order_name VARCHAR2(30) NOT NULL, /* 주문자명 */
	phone VARCHAR2(13) NOT NULL, /* 전화번호 */
	ip_address VARCHAR2(15) NOT NULL, /* 주문ip */
	order_date DATE DEFAULT dafault sysdate, /* 주문일자 */
	status CHAR(1) DEFAULT default 'N', /* 제작상태 */
	lunch_code CHAR(10) /* 도시락 코드 */
);


CREATE UNIQUE INDEX PK_ordering
	ON ordering (
		order_num ASC
	);

ALTER TABLE ordering
	ADD
		CONSTRAINT PK_ordering
		PRIMARY KEY (
			order_num
		);

ALTER TABLE lunch
	ADD
		CONSTRAINT FK_lunch_id
		FOREIGN KEY (
			id
		)
		REFERENCES lunch_admin (
			id
		);

ALTER TABLE ordering
	ADD
		CONSTRAINT FK_lunch_code
		FOREIGN KEY (
			lunch_code
		)
		REFERENCES lunch (
			lunch_code
		);
		
