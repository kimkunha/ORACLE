-- ���ڿ� ������ like���� ����� ���̺�
create table test_like(
num number,
name varchar2(30),
loc varchar2(300),
highschool varchar2(60)
);


insert into test_like(num,name,loc,highschool)
values(1,'������','����� ������ ���ﵿ','������');
insert into test_like(num,name,loc,highschool)
values(2,'������','����� ���α� ������','������');
insert into test_like(num,name,loc,highschool)
values(3,'�ڿ���','��⵵ ������ ���뱸','���հ�');
insert into test_like(num,name,loc,highschool)
values(4,'����ö','����� ���ʱ� ���ʵ�','�԰�');
insert into test_like(num,name,loc,highschool)
values(5,'��������','���� ��絿 ','�ð�');
insert into test_like(num,name,loc,highschool)
values(6,'������','��⵵ ������ ������','������');

select*from test_like;


-- like �����ڴ� %, _ ��ȣ�� ���� ���
-- %�� ��� ���ڿ�, _ �� ����
-- test_like ���̺���  '�����'�� ��� ����� ��ȣ, �̸�, ��� , ����б���
-- ��ȸ�ϼ���

select    num, name, highschool
from       test_like
where       loc like'�����%';


-- �̸��� '��'���� ������ �л��� ��ȣ, �̸�, �ּҸ� ��ȸ

select num, name, loc
from test_like
where name like '%��';


--�̸��� '��'�� ���ԵǾ� �ִ� �л��� ��ȣ, �̸� , �ּ� , ����б����� ��ȸ�ϼ���.

select  name, num, loc, highschool
from  test_like
where    name like '%��%';


-- �̸��� 3�����̸� ��� ���ڰ� '��'�� ����� ��ȣ�� �̸��� ��ȸ

select        name, num
from            test_like
where        name like '_��_';

--�̸��� 4������ �л��� ��ȣ, �̸�, ����б����� ��ȸ

select     name, num, highschool
from       test_like
where     name like '____';




--�����ּҸ� �����ϴ� ���̺�
create table zipcode(
zipcode     char(7),
sido char(6),
gugun varchar2(25),
dong varchar2(100),
bunji varchar2(25),
seq number(5)
);

alter table zipcode modify dong varchar2(100);

truncate table zipcode;


select count(*)
from zipcode;

select      *
from zipcode;



-- �츮���� ���� �ּҸ� ��ȸ
-- ���̸�)
select         zipCode, sido, gugun, dong bunji,seq
from      zipcode
where    dong like '%������%';

-- ������̺��� ����� 'A'�� 2�� ��� �ִ� �����
-- �����ȣ ,�����, �Ի��� ��ȸ     &A&A& �̷����ϸ� ����

select    ename, empno, hiredate
from      emp
where  ename like '%A%A%';

select * from emp ;

-- �ߺ�����
-- ������̺��� �Ŵ��� ��ȣ�� ��ȸ
-- �� �ߺ��Ǵ� �Ŵ��� ��ȣ�� ������� �ʴ´�.
-- distincet : �����Լ��� ����Ͽ� �׷캰 ���踦 �����ټ�����.
-- �ٸ� ���� ������ Į���� ���� ����� ���, ��� �÷��� ����
-- �����ؾ� �ߺ������� �ȴ�.

select   distinct mgr,ename
from     emp;



--group by : �׷����� �������� ���� �÷��� ���� ���Ǹ� error
select mgr, /*ename */
from emp
group by mgr ;

