--�����Լ�
select     sin(25),cos(25),tan(25)
from   dual;


--���밪 : abs(��)
select  abs(25),abs(-25)
from  dual;


--�ݿø� : round(��, �ڸ���)
select       round(777.775,2) , round(777.777,-1)
from  dual;


--���� : trunc(��, �ڸ���)
select      trunc(777.777,2)  , trunc(777.777,-2)
from dual;


--�ø� : ceil(��)
select       ceil(10.166) , ceil(10.0001)
from   dual;


-- ���� : floor(��)
select        floor(10.9), floor(10.9879789)
from   dual;


--������̺��� �����ȣ, �����, �Ի���, ����, ������ ��ȸ�ϼ���
-- ��,������ ������ 3.3%����ϰ� �������� �����Ͽ� ����غ�����.

select		EMPNO, ENAME, HIREDATE, SAL,
				trunc(SAL *0.033,-1) tax
from	EMP;


select      trunc(26.4,-1)
from  dual;
