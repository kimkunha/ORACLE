create table Kh2
(no number (5),
name  varchar(10),
gender char (2),
adress varchar2(3600),
score   number(3),
input_date date);

-- desc kh2
insert into Kh2(no, name, gender, adress, score, input_date) values(1,'김준호','m','서울시 강남구 역삼동',64,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(2,'김준현','m','서울시 구로구 개봉동',87,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(3,'오나미','f','서울시 영등포구 여의도동',97,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(4,'황재성','m','서울시 동작구 상도동',100,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(5,'유재석','m','경기도 수원시 영통구',100,sysdate);

select * from kh2;



