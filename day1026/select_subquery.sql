-- �ܼ��� :
-- Scalar subquery : select ��ȸ�ϴ� �÷��� ���������� ����ϴ� ��.
-- emp���̺��� �����ȣ, �����, �μ���ȣ,�μ��� ��ȸ
-- �μ����� dept���̺� ����
-- �����̸��� �÷��� �����ϸ� � ���̺� �����ϴ� �÷�����
-- �����Ͽ� ����ؾ� �Ѵ� ( ���̺��, �÷���)
select 		empno, ename, deptno,
				(select dname from dept
          		where dept.deptno=emp.deptno)
from emp;


 --xx--
insert into cp_emp3
( select empno,ename,deptno,job,sal from emp
where deptno in (10,30));
select * from CP_EMP3 ;
commit;

-- ������̺��� �����ȣ�� '7698'�� ����� �μ���ȣ��
-- ���� �μ��� cp_emp3���̺��� ��ȸ
-- ��ȸ�÷��� �����ȣ, �����, �μ���ȣ, ���� ��ȸ.

select	 	EMPNO, ENAME, DEPTNO, JOB
from     	cp_emp3
where    	deptno = (select deptno from emp where empno =7698);


--�÷����� ������ �������� in, any, all, exists

-- ������̺��� �����ȣ�� '7698','7566'�� ����� �μ���ȣ��
-- ���� �μ��� cp_emp3���̺��� ��ȸ
-- ��ȸ�÷��� �����ȣ, �����, �μ���ȣ, ���� ��ȸ.


select	EMPNO, ENAME, DEPTNO, JOB
from 	cp_emp3
where  DEPTNO  in (select deptno from emp where empno in (7698, 7782)) ;

--�ܺΰ� �Է¹ޱ� :
--��������  &������ - �Ϸ�â ���� : �Է�â�� �Է��� ���� ��������
-- &�������� �������� �״�� ���ԵǹǷ� ���ڿ��� �Է��� ���
-- ' '�� �����־�� ������ �߻����� �ʴ´�.
select * from EMP  where deptno=&d_no;
select * from EMP  where ename='&enano';

-- exists : ����������

-- exists : ���������� ���� �����Ѵٸ� �ٱ������� ����
-- ������̺��� �ԷµǴ� �μ� ��ȣ�� �����Ѵٸ� �����ȣ,
-- �����, �Ի���,�μ���ȣ�� ��ȸ
select empno,ename,hiredate,deptno
from emp
where exists ( select deptno from emp where deptno =&deptno) ;


--all : and -  <- ���������� ��ȸ�� �� �� ���� ���� ������ �� ����
--                >-  ������������ ��ȸ�� ���� ���� ū ������ �� ����
-- �Էµ� �μ����� ���� ������ ���� �������,
-- ������ ���� ����� ��ȸ
select empno, ename, sal,deptno
from emp
where sal < all (select sal from emp where deptno=&d_no);

--any : or
select empno, ename, sal,deptno
from emp
where sal < any (select sal from emp where deptno=10);

------------------------------------------------------------------------------

-- ROWNUM : ��ȸ�� ����� �������� ��ȣ�� ���̴� ���� �÷�

----------------------------------------------------------------------------------

-- ��ȣ, �����ȣ, �����, �Ի��� ��ȸ
-- �� ��ȣ�� ��ȸ����� 1���� ���������� �ο��Ǿ�� �Ѵ�.

select rownum, empno, ename, hiredate
from emp
where deptno in (10,20);

-- order by �� ���� ���Ǹ� ��ȣ�� ���̰� �ȴ�.
select  	    rownum, empno, ename
from   		emp
order by ename;


-- rownum�� where ������ ����ϸ� 1�����ʹ� ��ȸ�� �ǳ�
-- 1���� �ƴ� ��ȣ�� ��ȸ���� �ʴ´�.

-- ������̺��� �����ȣ, �����, �Ի��� ������ ��ȸ
-- ��, ����� ��ȸ 1~5�� ������ ���

select            ROWNUM, EMPNO, ENAME, HIREDATE
from  			emp
where         ROWNUM BETWEEN 1 AND 5;


-- ������ ��������
-- ��ȸ���(inline view) �� ������ �� ��ȸ
/*
       select  �÷���.....
       from	(select...)

*/

select  		rownum, empno, ename, sal, hi
from      (select rownum,empno, ename, sal, hiredate hi from emp
 				order by sal);

--������̺��� ���� �������� �Ի��� ������� 5�� ��ȸ
-- ��ȸ�÷� :  �����ȣ, �����, �Ի���

select rownum, empno, ename, hiredate
from (select   	 EMPNO, ENAME,  hiredate
			from emp order by hiredate desc)
			where rownum between 1 and 5;

-- ������̺��� ���� �������� �Ի��� ���� ������� 5����ȸ
-- ��ȸĮ�� : �����ȣ, ����� �Ի���
select rownum, r,empno,ename,hiredate from(select rownum r, empno, ename, hiredate from
(select empno , ename, hiredate from emp order by hiredate desc))
where r between 2 and 6  ;


select * from user_constraints;
select * from CAR_MODEL
