-- �����Լ� - �÷���  ���� �ϳ��� ����� ��ȯ�ϴ� �Լ���.
-- count : nul�̾ƴ� �÷��� ������ ����

--������̺��� ���ڵ� �� ( �����)  ,���ʽ��� �����ϴ� �����
--���ʽ��� �������� �ʴ� �����, �Ŵ����� �ִ� �����
select		count(empno), count( comm),
				count(empno)-count(comm),count(mgr)
from			emp;


select count(ename)
from emp;
--���� ��,���ʽ��� ��, �� �ΰǺ��� ����
select		sum(sal),sum(comm),sum(sal)+sum(comm)
from			emp;

--�������, ���ʽ� ���
select    	trunc(avg(sal)),avg(comm)
from 		emp;

--�ְ����� ,���� ������, �ְ����װ� ������������ ��

select		max(sal),min(sal), max(sal)-min(sal)
from			emp;

--**where�� ������ �����Լ��� ����� �� ����..!!!(����)
--ex)������̺��� ��տ������� ���� �����ϴ� �����ȣ,
-- �����, ����, �Ի����� ��ȸ
select		empno, ename, sal, hiredate
from		 	emp;
where		sal>avg(sal);               --�Ұ���--

-- �����Լ��� Gruop by �� ���� ����ϸ� �׷캰 ���踦 ��ȸ�Ѵ�.
--�μ���ȣ, �μ��� �ο���, �μ��� ���� ��, ������� ,�ְ� ������
-- ���� ������
select      	deptno, count(empno), sum(sal),
				trunc( avg(sal),2), max(sal), min(sal)
from  		emp
group by 	deptno
order by 	deptno;

--������̺��� �Ŵ����� �����ο���, �ְ����� ��������,
-- �ְ� ������ ���������� ����
select       	MGR , count(mgr), max(Sal),min(sal),
					max(sal)-min(sal)
from				emp
where			mgr is not null
group by 	  	mgr
order by		mgr;

--��¥�Լ�
--��¥�� +�� ����ϸ� �� �� ���Ѵ�.
select     	sysdate+5
from 		dual;

select		add_months(sysdate,5)
from 		dual;

select    	months_between('2019-12-25',sysdate)
from 		dual;

