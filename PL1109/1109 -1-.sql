select * from user_procedures;

-- ��Ű���� ���Ե� �Լ� ȣ��
select   test_pack.get_name('������')
from		dual;

-- ���ν��� ȣ��
var age number;
exec test_pack.get_age(1988, :age);
print age




-- ����(random number) : ��ǻ�Ͱ� ������ ����
-- �����Ͽ� ��ȯ�ϴ� ��.
-- dbms_random.value(����, �߻�����) - ���ڸ� ��� �Լ�
-- 1���� ���� 10������ ���� ��� (�Ҽ��� �߻�)
select	trunc(dbms_random.value(1,20))
from		dual;


--dbms_random.string('����', ��������) - ���ڿ��� ��� �Լ�
-- ���� : U - ������ �빮��, | - ������ �ҹ���,
-- a - ��,�ҹ��� ȥ��,  x - �빮�ڿ� ����ȥ��
-- p - Ư������ ȥ��     --��,�ҹ��� ���� ȥ���� X

select 	dbms_random.string('u',10)
from		dual;

select 	dbms_random.string('l',10)
from		dual;

select 	dbms_random.string('a',10)
from		dual;

select 	dbms_random.string('x',10)
from		dual;

select 	dbms_random.string('p',10)
from		dual;


-- ����Ǽ�
select	lucky_pack.lucky_num()
from		dual;

--����
var name varchar2(30);
exec lucky_pack.lucky_name(:name);
print name;


var cur refcursor;
exec test_pack.constraints_search('car_maker',:cur);
print cur;





var ssn char(14);
exec lucky_pack.create_ssn('880101','����','������',:ssn);
print ssn;

exec lucky_pack.create_ssn('880101','����','������',:ssn);
print ssn;


select name,ssn,valid_ssn(ssn) from class4_info ;
