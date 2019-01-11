/*
 번호,이름,주민번호,나이,시력,이메일,입력일을 저장할수 있는
  class4_info 테이블을 생성.

*/


create table Class4_info(
 num   number(4),
 name  varchar2(15),
 ssn char(14),
 age number(3),
 eye number(3,2),
 email varchar2(50),
 input_date date
);


 --생성된 테이블의 구조 보기 : sqlplus 문
desc class4_info
