-- view�� �����ҷ��� ������ ������ ���� ������ view
-- ���� ������ �ο� �ؾ��Ѵ�
-- ������ ������ ���� �ο�  (����â ����  �����ڰ������� ������  'scott'�� ���� �ֱ� �ϸ�ȴ�

create view test_view as(select*from emp);    -- ���Ѿ���--

grant create view to ������;   --����â���� �ϸ��--


-- �ܼ� view ���� ( ���̺� �ϳ��� ������ view)

create view emp_view as (Select* from cp_emp3);

select * from user_views;

select * from emp_view;
select * from cp_emp3;          --�Ѵ� ���� â�� ����--

-- view DML

insert into emp_view(empno,ename,deptno,job,sal)
values(1234,'������','20','����',4000);

-- update
update      emp_view
set                job='����', sal=4100
where       empno=1234;


 --����
delete from  emp_view
where empno=1234;
-- �ܼ� view�� ���̺� ��ɾ� �� �Ȱ��� ����. update, delete �Ȱ��� ������ ��


--view ����
drop view emp_view;
select * from emp_view;


-- �ܼ� view (�ϳ��� ���̺� ��� �÷����� view����)
-- cp_emp3���̺��� �����ȣ, �����, ����, �������� view����
create view emp_view as
		(Select empno, ename, job, sal from cp_emp3);

select * from user_views;

-- view�� ���Ե��� ���� �÷��� insert�� �����ϸ� null�� �Էµȴ�.
insert into emp_view(empno, ename, job, sal)
values(1234,'������','����',4100);
select * from emp_view;
select * from cp_emp3;  --null�� �����Ȱ��� Ȯ��--


-- ���� view : ���̺� �������� ����Ͽ� ������ view,
--					��ȸ�Ҷ� �Լ���  ����Ͽ� ��ȸ�� ����� ������ view

-- ���� view�� insert, update, delete�� ������� �ʴ´�.
-- �������� ���̺��� ������ �ܼ� select�� ����Ͽ� ��ȸ �Ҷ�.

create view car_view as
(select cma.maker, cma.model,cmo.car_year, cmo.price,
cmo.cc, cmo.car_option
from car_maker cma, car_model cmo
where cmo.model=cma.model);

select * from user_views;
-- view�� ����ϸ� join�� ����� �ܼ� ������ ���� �� �ִ�.
select	maker, model, car_year,price, cc, car_option
from		car_view
where maker = '����';


-- ���� view�� insert, update, delete �Ҽ� ����.
insert into car_view(maker,model, car_year, price,cc,car_option)
values('����','���ν���',2017,3000,1999,'��¦3��,abs');

-- �ܼ� view�� insert, update, delete ���� view ������ with read only
create view read_emp as
(select * from cp_emp2) with read only;

select * from user_views;

select * from read_emp;

-- with read only �ɼ��� ����� view�� �߰�, ����, ������ �Ҽ� ����.
insert into read_emp(empno, ename, hiredate, sal)
values(1234,'������',sysdate,5000);
