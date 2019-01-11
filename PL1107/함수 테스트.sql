select * from user_procedures;

-- �Լ� ����-
drop function plus;

-- �ֹι�ȣ�� ��ȿ�� ����
select	check_ssn('880101-123456'),
			check_ssn('88010-11234567'),
			check_ssn('880101-1234567'),
			check_ssn('8801011-123456')
from		dual;




select * from CLASS4_INFO;


update	class4_info
set		ssn='880101-123456'
where	num=6;
commit;



-- class4_info ���̺��� ��ȣ, �̸�, �ֹι�ȣ,
-- �ֹι�ȣ�� ���� üũ �Ͽ� ��� ���ڵ带 ��ȸ
select  num,name,ssn, check_ssn(ssn)
from  	class4_info;
-- �ֹι�ȣ�� ��ȿ�Ҷ� ���̸� ���ϴ� �Լ� ���
select	get_age('880101-123456'),
			get_age('88010-11234567'),
			get_age('880101-1234567'),
			get_age('8801011-123456'),
			get_age('010101-5234567'),
			get_age('010101-4234567'),
			get_age('010101-7234567'),
			get_age('990101-0234568')
from 	dual;
delete from class4_info
where num=10;


insert into class4_info(num,name,ssn)
values(8,'���ӽ�','890307-5234567');

insert into class4_info(num,name,ssn)
values(9,'����','030107-4234567');

insert into class4_info(num,name,ssn)
values(10,'������','990107-9234567');

--��ȣ, �̸�, �ֹι�ȣ, ���� ��ȸ
-- ���̴� �ֹι�ȣ�� �������� ���� ���̸� ����ϰ�
-- ��ȿ���� �ʴٸ� 0�� ����Ѵ�.
select  	num,name, ssn, get_age(ssn)
from 	class4_info
order by num ;


--�̸��� ��ȿ�� ����

select   valid_email('@.') a,
			valid_email('a@b.c') b,
			valid_email('aaaaaa.') c,
			valid_email('ssssssssssss@') d,
			valid_email('aaaaaa@.') e
from 	dual;


--��ȣ, �̸�, �̸���, �̸����� ��ȿ�� ��ȸ

select 	num, name, email,valid_email(email) ����
from		class4_info;

-- 1~ 9999999 ���� 1�� �����ϴ� ������ �ۼ�
create sequence seq_item
increment by 1
start with 1
maxvalue 9999999
cache 10
nocycle;

select * from user_sequences;

select seq_item.currval
from dual;


create table test_func(
		num char(10),
		name varchar2(30),
		input_date date default sysdate,
		constraint pk_test_func primary key (num)
 );

-- �Լ��� ȣ���Ͽ� ������ �����ǹ�ȣ�� ���
-- �Ű����� ���� �Լ��� ȣ�� �� ������ ( )�� ������ �ʾ�
 select  item_num()
 from	dual;


-- ���ڿ������� �����ϴ� ��ȣ�� ����Ͽ� table�� �߰�
insert into test_func(num,name)
values(item_num,'����ö');

select * from test_func;


select valid_ssn('901217-1074411')
from dual;


select num, name, ssn, valid_ssn(ssn)
from class4_info;



select * from user_procedures
where object_type like 'p%';

var num number;
exec proc_plus(11,11, :num);
print num ;

select * from cp_emp2;
var insert_msg varchar2(30);
execute proc_insert_cpemp2(1111,'������',3000, :num, :insert_msg);
print insert_msg;
print num

