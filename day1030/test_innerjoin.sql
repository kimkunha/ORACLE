-- inner join : ���� �ٸ� ���̺� ���� ���� �ִ� ��쿡�� ��ȸ     *--�̹������� emp�׺��� deptno,
                                                                                      --*dept ��  deptno�� �����Ͽ�                                                                                    -- ��������
-- �����ȣ, �����, �μ���ȣ, �μ���, ��ġ, ���� ��ȸ                   *--��������

-- �������̺��� ��� �� �ִ� �÷����� ���������� ������ ��

-- ANSI
select          	empno,ename,deptno,dname, loc, sal     -- �̸��ϸ� ���������� �ָ���
from				emp                                                         -- �Ʒ��� ���� ���� �Ҽ� ����.
inner join     dept
on     			deptno=deptno;

----------------------------------------------------------------------


select          	empno, ename, dept.deptno, dname, loc, sal
from				emp                                           -- 1) �׳� deptno�� �ϸ� ���� �ָ��ؼ�
inner join     dept                                          --    ���̺��.�÷����� ����� ��ȸ ����
on     			emp.deptno= dept.deptno;

select * from DEPT ;
--------------------------------------------------------------------------

select          	empno, ename, d.deptno,dname, loc, sal
from				emp  e                                         -- 2)  from emp�� e�� alias�ϰ�
inner join     dept  d                                        --      inner join��  dept��  d�� alias�Ͽ�
on     			e.deptno=d.deptno;                     --    �����ϰ� �Ҽ��ִ�. (���� �÷��� �ٲ������)

------------------------------------------------------------------
select          	e.empno, e.ename, d.deptno,d.dname, d.loc, e.sal
from				  dept  d                                       --     �÷����� alias�� ���� �޾��ָ� �˾ƺ���
inner join       emp  e                                        --     ����
on     			d.deptno= e.deptno;                     --

------------------------------------------------------------------------------

--- oracle

select          	e.empno, e.ename, d.deptno,d.dname, d.loc, e.sal
from				emp e, dept d;         ``--�̷��� �߻��ϸ� ���� �ִ� �����Ͱ� �ƴ� (��Ƽ�� ������Ʈ)


--�̷��� �ؾߵ�--
select          	e.empno, e.ename, d.deptno,d.dname, d.loc, e.sal
from				emp e, dept d
where  			e.deptno = d.deptno;

select * from EMP;
select * from DEPT;

--------    ���� �غ���
--alter table   car_country add constraint  primary key pk_car_country(country)


--alter table car_maker add constraint FK_maker references car_country(country)


---------------  ����
-- ���������� ���̺� pk����
alter table   car_country add constraint   pk_car_country
primary key(maker);

select * from car_country;

-- ������ ���̺� fk����
alter table car_maker add constraint FK_maker
foreign key(maker) references car_country(maker);

select * from car_country;

--������ ���̺� pk����
alter table   car_maker add constraint   pk_maker
primary key(model);

-- �� ���̺��� FK����
alter table car_model add constraint FK_model
foreign key(model) references car_maker(model);


select * from user_constraints;

------------------------------------------------------------------------

-- �𵨸��� '�ƹ���' , '�ҳ�Ÿ', 'A8'�� ������ ������, ������, �𵨸�, ����, ����, �̹��� ��ȸ
-- ANSI
select         cc. country,cc. maker,cma. model, cmo.car_year,
 				cmo. price, cmo. car_img
from         	car_country     cc
inner join    	car_maker			cma
on                  cma.maker=cc.maker
inner join		car_model     cmo
on                cmo. model= cma.model
where          cmo.model in ('�ƹ���' , '�ҳ�Ÿ', 'A8');




--ORACLE
select         cc. country,cc. maker,cma. model, cmo.car_year,
 				cmo. price, cmo. car_img
from         	car_country     cc, car_maker cma, car_model cmo
where 			(cma.maker=cc.maker and cma.model=cma.model)
and				cmo.model in  ('�ƹ���' , '�ҳ�Ÿ', 'A8');

-- �����ȣ, �����, ����, �Ի���, �μ���ȣ, �μ���, ��ġ, �����ȣ,
-- �õ�, ����, ��, ������ ��ȸ�ϼ���.
-- ������̺��� �����ȣ�� �����ȣ ���̺��� seq �� ������������ ����ϼ���.
      select * from user_constraints;
--ansi

--�ݺ�����--

select           e.EMPNO, e.ENAME, e.SAL, e.HIREDATE, e.DEPTNO,d.LOC , z.SEQ,
					 z.SIDO, z.GUGUN, z. DONG
from	  			emp  	e
inner join 		dept 		d
on               e.deptno=d.deptno
inner join		zipcode   z
on 			z. seq = e.empno
where 	z.seq in (e.empno);




--orcle
select           e.EMPNO, e.ENAME, e.SAL, e.HIREDATE, e.DEPTNO,d.LOC , z.SEQ,
					 z.SIDO, z.GUGUN, z. DONG
from	  			emp  	e   ,    dept 		d    ,  zipcode   z
where 		 ( 	  e.deptno=d.deptno and z. seq = e.empno) and z.seq in(e.empno);
