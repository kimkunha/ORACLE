-- 제약사항을 확인 : user_constraints
-- 제약사항명은 테이블명 처럼 유일해야한다.
select * from user_constraints;

-- 번호, 이름, 전화번호, 주민번호, 이메일 저장하는 테이블 생성.
-- 주민번호는 null을 허용하지 않으면서 유일해야 한다.
create table column_primary(
					num number,
					name varchar2(30),
					tel varchar2(13),
					ssn char(14) constraint pk_column_primary primary key,
					email varchar2(50)
);

select * from COLUMN_PRIMARY;
/*
drop table column_primary;  -테이블 삭제-
purge recyclebin;   -휴지통에서 테이블 삭제-
*/

--------------------------- 컬럼하나로 pk가 구성되는 경우
-- 추가성공
-- 최초 레코드 삽입
insert into column_primary(num,name,tel,ssn,email)
values(1,'이재찬','010-1234-5678','880101-1234567','lee@test.com');
commit;

-- 주민번호가 다른경우
insert into column_primary(num,name,tel,ssn,email)
values(2,'이재현','010-2222-6432','890101-1234567','lee@test.com');


insert into column_primary(num,name,tel,ssn,email)
values(3,'이재홍','010-8452-6412','511517-4154875','lee@test.com');



select * from COLUMN_PRIMARY;


-- 추가실패
-- 주민번호에 같은 주민번호가 입력되는 경우 ERROR
insert into column_primary(num,name,tel,ssn,email)
values(4,'정택성','010-8271-5482','880101-1234567','jung@test.com');
commit;
-- null이 입력 되는 경우   ERROR
-- 숫자, 날짜는 컬럼이 생략되면 null이 입력되고
-- 문자열 (고정길이, 가변길이)는 컬럼이 생략되는 경우와 "(empty)
-- 로 데이터가 추가되는 경우에 null 입력된다.

-- 컬럼이에  NULL이 되는 경우  2가지
-- 1. 컬럼이 생략되어 insert되는경우
insert into column_primary(num,name,tel,email)
values(4,'정택성','010-8271-5482','jung@test.com');
-- 2. 컬럼은 정의되어 있으나 ''('이것이 2개)가 입력되는 경우
insert into column_primary(num,name,tel,ssn,email)
values(4,'정택성','010-8271-5482','','jung@test.com');

-- table level constraint
-- 이름, 아이디, 비밀번호를 저장 테이블 생성
-- 아이디는 null을 허용하지 않으면서 값은 유일해야 한다.


create table table_primary(
					name varchar2(30),
					id varchar2(20),
					passwd varchar2(30),
					constraint pk_table_primary  primary key(id)
					);

select * from TABLE_PRIMARY;
-- 추가성공
insert into table_primary(name,id,passwd)
values('김희철','kim','1234');
commit;
insert into table_primary(name,id,passwd)
values('김희철','test','1234');
--insert into table_primary(name,id,passwd)     --id에 pk가 걸려있어서 생성이 안됨.
--values('김영철','test','12424');
commit;
-- 추가실패
insert into table_primary(name,passwd)
values('김희철','123455');

insert into table_primary(name,id,passwd)
values('김희철','','1234');


-- 여러개의 컬럼이 pk로 구성되는 경우.
-- table 단위 제약사항으로만 설정가능


-- (문제) 가장 마지막사원번호 보다 1 증가한 값으로
-- EMMP_00007899 의 형식을 가진 값을 조회

/*[내가 해서 틀린값] select        concat('EMMP_', lpad(empno,8,0))
from emp;
*/
select   concat('EMMP_',lpad(max(empno)+1,8,0))
from emp;


-- 아이템명, 아이템 번호, 설명
-- 아이템 번호는 레코드가 추가될때 순차적으로 증가하며
-- 'ITEM_0001'의 형식을 가진다.
-- 아이템 번호와 아이템명은 같을수 없다.
/*create table table_multi_primary(
					item_num char(9),
					item varchar2(60),
					item_info varchar2(4000),
					constraint pk_table_primary primary key(item_num,item)
					);
*/

--drop table TABLE_MULTI_PRIMARY;
--purge recyclebin;
-- 테이블 생성이 안되서 TABLE_MULTI_PRIMARY2로 만듬
select * from       TABLE_MULTI_PRIMARY2;
create table table_multi_primary2(
					item_num char(9),
					item varchar2(60),
					item_info varchar2(4000),
					constraint pk_table_primary2 primary key(item_num,item)
					);

select * from TABLE_MULTI_PRIMARY2;

-- item_0001 조회
select concat('ITEM_',lpad(nvl(max(item_num),0)+1,4,0))
from table_multi_primary2;


-- 여러개의 컬럼이 하나의 PK로 구성되는 경우
-- 추가성공 : 최초데이터 입력
-- 조회된 레코드가 null일때만 값을 변경 (조회된 레코드가 없다면 동작X)
-- 두 컬럼의 값이 다른경우 :  성공
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values  ((select concat('ITEM_',lpad(nvl(max(item_num),0)+1,4,0))
from table_multi_primary2),'물파리',
'바로앞 라이더에게 날려 라이더를 잠시 띄울수 있다');
commit;

-- 두 컬럼값이 모두 다른 경우 : 성공
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values  ((select concat('ITEM_',lpad(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
from table_multi_primary2),'물폭탄',
'일정거리의 앞 라이더들에게 날려 공격받은 라이더들을 잠시 띄울수 있다');


-- 두 컬럼중 하나의 컬럼만 다른 경우 : 성공
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('item_0002','물파리', '당하면 짜증남.');


insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('item_0002','물파리1', '당하면 짜증남.');

-- 에러가 발생하는 경우
-- 두 컬럼이 모두 같은 값을 가질때
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('item_0002','물파리', '바로 앞 라이데에게 날려 라이더를 잠시 띄울 수 있음');


-- 둘중 하나라도 null이 추가 될때
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('','물파리', '당하면 짜증남.');

insert into TABLE_MULTI_PRIMARY2(item_num,item_info)
values ('item_0003','유도탄', '앞선 특정 라이더를 조준하여 미사일을 발사.');




