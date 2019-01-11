-- check, notnull, default
-- check : 컬럼의 값을 유효성 검증된 값으로 추가
-- not null : 값이 반드시 입력받아야 할 때
-- default : 컬럼이 생략되어 null 입력될때 대신 들어갈 기본 값.

-- 이름, 나이, 주소, 입력일 을 저장하는 테이블 생성
-- 단, 이름은 필수입력이고, 나이는 20~30대만 입력가능하고,
-- 입력일은 생략되면 현재날짜로 입력되도록 설정하세요.

create table 			other_constraint(                  --number byte 못넣음-
							name varchar2(30 byte) constraint c_name not null,
							age number(2) 
,
							addr varchar2(20byte) null,
							input_date date default sysdate
							);
 --user_constraints에서는 제약사항 (PK,FK,UK,CHECK,NOT,NULL)만 확인가능
  --default는 여기에 안나온다-
  select * from user_constraints;

                    
--
SELECT * from user_tab_cols
where table_name='OTER_CONSTRAINTS';


-- 추가 성공
-- 최초 데이터
insert into other_constraint( name,age,addr,input_date)
values('이재찬',27,'서울시','2018-10-26');
-- 주소와 입력일 생략
insert into other_constraint( name,age)
values('박영민',27);
-- ERROR
-- 이름이 생략되는 경우(not null조건)
/*insert into other_constraint( age,addr,input_date)
values(27,'서울시','2018-10-26');   --불가능--
*/

/*
insert into other_constraint( name,age,addr,input_date)
values('',27,'서울시','2018-10-26');  -- 컬럼이 있어도 값을 안넣으면 ERROR
*/

-- 나이가 20~30대가 아닌경우
/*
insert into other_constraint( name,age,addr,input_date)
values('이재찬',15,'서울시','2018-10-26');

insert into other_constraint( name,age,addr,input_date)
values('이재찬',40,'서울시','2018-10-26');
체크제약조건에 위반
                                                                     --20~39가 체크조건이라 위 조건만 가능
*/

-- not null은 테이블 단위 제약사항으로는 설정할수 없다. (컬럼단위로만 가능)
create table temp(
name varchar2(10),
constraint C_name1 not null(name)
);                              --불가능--

select * from OTHER_CONSTRAINT;
