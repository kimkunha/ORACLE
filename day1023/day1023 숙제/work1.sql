create table Kh2
(no number (5),
name  varchar(10),
gender char (2),
adress varchar2(3600),
score   number(3),
input_date date);

-- desc kh2
insert into Kh2(no, name, gender, adress, score, input_date) values(1,'����ȣ','m','����� ������ ���ﵿ',64,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(2,'������','m','����� ���α� ������',87,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(3,'������','f','����� �������� ���ǵ���',97,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(4,'Ȳ�缺','m','����� ���۱� �󵵵�',100,sysdate);
insert into Kh2(no, name, gender, adress, score, input_date) values(5,'���缮','m','��⵵ ������ ���뱸',100,sysdate);

select * from kh2;



