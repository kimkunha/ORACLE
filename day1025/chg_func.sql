--��ȯ�Լ�
--���ڿ��� �ƴ� ��(����, ��¥)�� ���ڿ��� ��ȯ
-- ���� -> ������ �ڸ���, ��   '.'�� ���
select		to_char(20181025,'0,000,000,000'),
				to_char(20181025,'9,999,999,999')
from			dual;


select		to_char(2018.1025,'999,999.999')
from			dual;


--������̺��� �����ȣ, �����, �Ի���, ������ȸ
-- ��, ������ �����Ͱ� �ִ� �ͱ����� , �� �־� ���
select		EMPNO, ENAME, HIREDATE,
				to_char(sal,'9,999,999')
from    		emp;



--to_Char�Լ��� ��ȯ�Ǵ� ����� ���ڿ��̹Ƿ� ��Ģ������ �Ұ����ϴ�.
--���ڿ��� ��Ģ������ �������� �ʴ�. ��ȣ�ȿ����� ����.
select			to_char(sal+100,'9,999,999')  sal
from             emp;



--��¥  --> ���ڿ���ȯ
-- mm�� dd�� ������ 2�� ���
select		to_char(sysdate,'yyyy-mm-dd am hh(hh24):mi:ss day dy  ')
from    		dual;




--pattern�� Ư�����ڰ� �ƴ� ���ڿ��� ����Ҷ��� "�� ���´�.
select      to_char(sysdate,'yyyy"��"mm"��"dd"��"')
from 		dual;



--pattern�� �ʹ� ��Ի���ϸ�  error  �ް��ϸ� ���� �ȳ�.

select 		to_char(sysdate,'yyyy"��"')
from 		dual;



--������̺��� �����ȣ, �����, �Ի����� ��ȸ
--��, �Ի����� '��-��-�� -����' �� �������� ���

select		empno, ename,
to_char  	(hiredate,'yyyy-mm-dd day hh24 : mi : ss')
from  		emp;



--***������̺��� �Ի�⵵�� '1981���� ������� �����ȣ, �����
-- �Ի��� , ������ ��ȸ ***
-- ��¥�ϰ� ���ڴ� �� �ȵ�. ��¥�� ��¥������ ����
-- ���� �� ����  �ٲ㼭 ���ִ� ���� ����
select		EMPNO, ENAME, HIREDATE, SAL
from			emp
where		to_char(HIREDATE,'yyyy')='1981';



select * from CLASS4_INFO;

--���糯¥�� �ƴ�  ��¥�� �߰��Ҷ�
--��¥������ ���ڿ��� �߰��ϸ� �ȴ�.
insert into
class4_info(num,name,input_Date) values(8,'�缼��','2018-10-21');
insert into
class4_info(num,name,input_Date)values (9,to_date('2018-10-21','yyyy-mm-dd'))'�缼��','2018-10-22');


select to_char(input_date,'yyyy-mm')
from class4_info


--to_char�� ��¥�� ���ڸ� �Է¹޾ƾ� �Ѵ�.(�Լ��� ��(����)��
-- ���������� �����Ѵ�.
--select      to_char('2018-10-25','mm') error
select   to_char(to_date('2018-10-25','yyyy-mm-dd')'mm')
from 	dual;


--���ں�ȯ : to_number('���������� ���ڿ�')
select		'25'-'10', to_number('25') -to_number('10')
from 		dual;


--------------------------------------------------------

--  �����Լ� : decoda(��, �񱳰�, ��°�,�񱳰�,��°�,...�񱳰��� ������ ��°�)

------------------------ ---------------------------------
-- ������̺��� �����ȣ, �����, ����, �μ���
-- �� �μ����� �Ʒ��� ǥ�� �ش��ϴ� �μ������� ����մϴ�.
-- 10- ���ߺ�, 20- ����������, 30-ǰ�������� �׿ܴ�  Ź���η� ���


select       empno,ename, sal, deptno,
decode		(deptno,10,'���ߺ�',20,'����������',
				30,'ǰ¡����','Ź����')dname
from  		emp;



--�����ȣ, �����, ���ʽ�,�μ���ȣ, �μ�Ƽ�� ��ȸ
--��, �μ�Ƽ��� �μ����� �Ʒ��� ǥ�� ���� ��������
--10 -����� 20%, 20 - ������ 50%,   30  - ���� 30% �� �� ���� 5%

select		EMPNO, ENAME, SAL  , DEPTNO,
decode		(DEPTNO,10,sal*0.2,20, sal*0.5,30,sal*0.3,
				sal*0.1) incen
from 		emp;


--case
--�����ȣ, �����, ���� ,�μ���ȣ, �μ�Ƽ�� ��ȸ
--��, �μ�Ƽ��� �μ����� �Ʒ��� ǥ�� ���� ��������
--10 -����� 20%, 20 - ������ 50%,   30  - ���� 30% �� �� ���� 5%
select		EMPNO, ENAME, SAL, DEPTNO,
                case deptno when 10 then '���ߺ�'
									when  20  then '����������'
									when 30 then 'ǰ��������'
									else 'Ź����'
									end     dname
from emp;



select		EMPNO, ENAME, COMM, DEPTNO,
				CASE DEPTNO WHEN 10 THEN SAL+nvl(comm,0)+5sal*0.2
										WHEN 20 THEN SAL+nvl(comm,0)+5sal*0.5
                           				WHEN 30 THEN SAL+nvl(comm,0)+5sal*0.3
										END   INCEN
from emp;




select  			EMPNO, ENAME, COMM, DEPTNO,
				CASE DEPTNO WHEN 10 THEN SAL*0.2
				END   INCEN
from emp;

--------------------------------------------

select   	EMPNO, ENAME, COMM, DEPTNO,
decode		(deptno,10,sal*0.2)   insen
from 		emp;

--��� ���̺��� �����ȣ, �����, ������ ��ȸ
-- ��, ������ ù ���ڰ�  'C'-�ĸ����, 'S' - ������� �ִ� ���
--'M'-������ ,'A'- ���캸�� ���, 'P' - �θ��
-- ��ҹ��� ���缭 ����.     
                               

select	 	empno, ENAME, JOB,
				decode(substr(job,1,1),'C','�Ҹ�ǰ',
				'S','�� ����� �ִ� ���','M','������',
				'A','���캸�»��','�θ��')
from emp;



