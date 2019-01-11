-- ���� ���ϱ�
-- ��ü �������ϱ�
-- rank( ) over( )
-- rank( ) over( order by �÷��� ���Ĺ��) - �ߺ���ȣ[����]�� �߻��Ҽ� ����
-- ������̺��� �����ȣ, �����, ����, �������� ��ȸ
-- order by�� �ʼ�
select * from EMP;
select       EMPNO, ENAME, SAL,
				rank( ) over(order by sal desc)
from			emp;


-- ������̺��� �����ȣ, �����, ����, �������� ��ȸ
-- ��, �ߺ������� �߻����� ���� �ʵ��� ó���Ͽ� ��ȸ �Ұ�.
select       EMPNO, ENAME, SAL,
				row_number( ) over(order by sal desc)
from			emp;


-- ��ȸ�� ���ڵ带 �׷캰 ���� : partition by
-- ������̺��� �����ȣ, �����, ����,
-- �μ��� �������� ��ȸ
select     	EMPNO, ENAME , SAL, DEPTNO,
				rank() over(partition by DEPTNO order by sal) sal_rank
from 		emp;


-- �μ��� ���������� �ߺ���ȣ ���� ��ȸ
select     	EMPNO, ENAME , SAL, DEPTNO,
				row_number() over(partition by DEPTNO order by sal) sal_rank
from 		emp;



-------------------------------------------------------

-- rollup, cube

----------------------------------------------------
-- rollup :  �׷캰 �Ұ踦 ������ ���
-- �׷����� ���̴� �÷��� �ϳ��� ��쿡�� �Ѱ谡 ��µȴ�.

-- ������̺��� �μ���, ������ �� ��ȸ�ϰ� �Ѱ踦 ���
-- rollup�� �Ұ谡 �������� ��µȴ�.
select        	DEPTNO, sum(sal)
from				emp
group by		rollup(deptno);

-- cube�� �Ұ谡 ���� ��µȴ�.
select        	DEPTNO, sum(sal)
from				emp
group by		cube(deptno);

-- �����÷��� �׷����� �������� rollup�� �׷캰 �Ұ踦 ��������
-- ����Ѵ�.

--������̺���  �μ���, ������ ������, �Ұ�, �Ѱ� ��ȸ

select		DEPTNO, JOB, sum(sal)
from   		emp
group by 	rollup(DEPTNO, JOB)
order by 	DEPTNO;

-- ������̺���  �μ���, ������ ������,������(�׷캰) �Ұ�, �Ѱ�
-- ��ȸ�Ǵ� ���ڵ��� �Ұ� ��ȸ
select		DEPTNO, JOB, sum(sal)
from   		emp
group by 	cube(DEPTNO, JOB);


select*
from user_constraints;

desc dept;


