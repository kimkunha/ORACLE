create table trigger1(
	name varchar2(30),
	age number(3),
	addr varchar2(100)
);

create table trigger2(
	name varchar2(30),
	age number(3)
);


drop trigger test_trigger;
select * from user_triggers;

select*from trigger1;
select*from trigger2;


insert into trigger1(name,age,addr)
values('������',26,'��õ�� ������');

update	trigger1
set		name='���ü�',age=30
where	name='������';


delete from trigger1
where name ='������';


delete from trigger2
where name ='������';

select * from user_triggers;
drop trigger event_compare;


  select *from class4_info;


insert into class4_info(num,age) values(99,29);
commit;
