-- ���̺� ���� :
-- ������̺��� �����ȣ, �����, �Ի���, ������ ��ȸ�Ͽ�
-- ��ȸ�� ����� CP_EMP��� ���̺��� ������ ��.

create table cp_emp as
( select EMPNO, ENAME, HIREDATE, SAL from emp);

select * from CP_EMP;

alter table cp_emp modify sal number(7,2) not null;
select * from user_constraints;


-- not null ������ �ܵ����� �����Ǿ� �ִٸ� ����ȴ�.

-- cp_emp���̺��� �����ȣ�� 7500~7599 ���̿� ����
-- ����� �����ȣ, �����, �Ի���, ������ ��ȸ�Ͽ�
-- cp_emp2���̺��� �����ϰ� �Է��ϼ���.
-- between�� ������ �������� �տ� �ͼ� ��ȸ�ȴ�.
create table 		cp_emp2 as
(select * from
where empno between 7500 and 7599);



-- ������ ���� (���ڵ带 ��ȸ���� �ʰ� ���������� ����)

-- ������̺��� �����ȣ, �����, �μ���ȣ, ����, ����
-- �� ���ڵ尡 ��ȸ���� �ʵ��� ��ȸ �Ұ�.
-- where ���� �������� �ϸ� ���ڵ尡 ��ȸ �ȵ�
select 		EMPNO, ENAME , DEPTNO, JOB, SAL
from			emp
where 		1=0;

-- ���ڵ尡 ���� �� ���̺��� CP_EMP3�� ����
create table cp_emp3 as
(select 		EMPNO, ENAME , DEPTNO, JOB, SAL
from			emp
where 		1=0);

select * from CP_EMP3;
                                  
                                  
