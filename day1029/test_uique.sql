-- unique : 값이 없을수도 있고 있다면 유일해야할 때.
-- 이름, 이메일, 주소 저장하는 테이블 생성
create table column_uique(
					name varchar2(30),
					emil varchar2(50) constraint uk_email unique,
					addr varchar2(100)
						);

select * from user_constraints;

-- 추가성공
-- 최초입력
insert into column_uique(name, emil,addr)
values('이재찬','lee@test.com','경기도 수원시 영통구');
commit;
-- 이메일이 없는 경우(
입력) 경우
insert into column_uique(name ,addr)
values('이재찬','경기도 수원시 영통구');

insert into column_uique(name, emil,addr)
values('이재찬1','','경기도 수원시 영통구');

commit;

-- 실패하는 경우
-- 같은 이메일이 입력되었을 때
insert into column_uique(name, emil,addr)
values('박영민','lee@test.com','부산시');
--unique는 같은 값이 입력되었을시만 ERROR이 난다.
commit;

select * from COLUMN_UIQUE ;

---------------------  테이블 단위  ----------------------------
-- 번호, 이름, 전화번호, 카드번호를 저장하는 테이블을 생성
-- 전화번호와 카드번호는  없을수도 있고, 있다면 유일할 것.

create table table_unique(
					num number(5),
					name varchar2(30),
					tel varchar2(13),
					card_num char(4),
					constraint uk_tel unique(tel),
					constraint uk_Card_num unique(card_num)
					);

select * from user_constraints;
select * from user_indexes;

-- 추가 성공
-- 최초입력
insert into table_unique(num, name, tel,card_num)
values(1,'김정운','010-8769-6112','1234');
--전화번호와 같은번호가 다른 경우
insert into table_unique(num, name, tel,card_num)
values(2,'이재현','010-1111-2222','1235');
--null 입력
insert into table_unique(num, name, tel,card_num)
values(1,'이재현운','','');
insert into table_unique(num, name)
values(3,'김정운');    --이름이 같더라도 성공가능-

-- 에러
-- 전화번호든 카드번호든 둘중 하나만 같다면 에러
insert into table_unique(num, name, tel,card_num)
values(4,'정택성','010-1424-6112','1235');    --카드번호가 같아서 ERROR

insert into table_unique(num, name, tel,card_num)
values(1,'김정운','010-8769-6112','1514');    -- tel이 같으므로 EROOR

select * from TABLE_UNIQUE;








