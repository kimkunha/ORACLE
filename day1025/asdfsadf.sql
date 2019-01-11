-- ���ڿ� �Լ� ���.
--����  : length (���ڿ�)
select  	'oracle����'||length('oracle')||'��',length('�׽�Ʈ')
from 	 dual;


--��� ���̺��� �����, ��������� ���ڼ��� ��ȸ
select		ename, length(ename)
from emp;


--������̺��� ������� 4���� ����� ������� ��ȸ
-- select �̿ܿ��� where������ ����. ������ ����
--���� ��� where �÷��� like  '____'; ���� �ٸ����
-- �������ε� ��ȸ ���� �̻�, ����

select		ename
from  		emp
where  		length(ename)=4;


--�빮�� : upper
select     	upper('Test'),upper('�׽�ƮAdcdE')
from  dual;


-- �ҹ��� : lower
select     lower('Test')
from dual;



--������̺��� ������� 'scott'�� ����� �����ȣ, �����
-- �Ի���, ������ ��ȸ�ϼ���.
-- 2���� ����� ����.
select EMPNO, ENAME , HIREDATE, SAL
from     emp
--where ename = 'SCOTT';
--where  ename=upper('scott');
where    lower(ename) = 'scott';


--������̺��� ������� ��� �ҹ��ڷ� ��ȸ
select	lower (ENAME)
from emp;

--�ε��� ���� : instr(���ڿ�, ã�� ���ڿ�)
--�빮�� �ҹ��� ���缭�ؾ� ��ȸ ����
 select		instr('AbcdeF','A') ,instr('AbcdeF','F'),
 				instr('AbcdeF','c'),instr('AbcdeF','k')
 from	dual;

select * from CLASS4_INFO;
insert into class4_info(num, name, email) values(6,'�׽�Ʈ'
,'test@kr');
select * from CLASS4_INFO;
insert into class4_info(num, name, email) values(7,'�׽�Ʈ1'
,'test.kr');
commit;

--�л� ���̺��� ��ȣ,�̸�, �̸���,�̸����� ��ȿ�� ��ȸ
select NUM , NAME, EMAIL ,instr(email,'@'),instr(email,'.')
from          CLASS4_INFO;

--���ڿ� �ڸ��� : substr(���ڿ�,�����ε���,�ڸ� ���ڼ�)
-- ( �ȿ� �ִ� ���ڸ� ���ڷ� �����ؼ� ó������ 1�� ����)
select	substr('Abcdefg',4,3),substr('Abcdefg',2,6),
			substr('Abcdefg',1)
from	dual;



--class4_info ���̺��� ��ȣ,�̸�,
--email�÷���'�����ּ�'�� ��ȸ �ϼ���.  ex)test@test.com
-- test���� �÷�   2)������ �ּҸ� ��ȸ


select       NUM, NAME, substr(email,1,instr(email,'@')-1)
from	CLASS4_INFO;

--test@sist.co.kr
--���� �ּ�@������ �ּ�

select num, name, substr(email, 1, instr(email, '@')-1)
from class4_info;

select num, name, substr(email, instr(email, '@')+1)
from class4_info;

select instr('ABCDe', 'e')
from dual;

select * from class4_info;

--��������  : �յ� ���� ���� trim ,  �հ��� ���� : Ltrim
-- �ް��� ���� : Rtrim
--� ���忡 �ݺ��Ǵ� ���ڵ� ���� ����   (L,Rtrim�� ���ȵ�)
--  '-' from �̷������� ���
select        '['||trim('   abc    ')||']'
, '['||ltrim('   abc    ')||']'  , '['||Rtrim('   abc    ')||']'
, trim('-' from '---------oracle---------------')
from   dual;



-- ù ���ڸ� �빮�ڷ� : initcap('���ڿ�')
-- ( ) �ȿ��� ������⸦ �ϸ� �����ܾ ���� �빮�ڷ� ����
select      initcap('oracle java jsp jQuery SCOTT')
from   dual;



--�÷����� �ᵵ ù���ڸ� �빮�ڷ� ����
select    initcap(ename)
from      emp;




--���ڿ� ���̱� : concat('���ڿ�','���Ϲ��ڿ�')
select       concat('abc','def'), concat(concat('abc','def'),'ghi')
from     dual;


--���ڿ� ä���
--    �������� ä��� : Lpad('���ڿ�;, '���ڸ���', 'ä�﹮�ڿ�')
select          lpad('abcde',7,'$')  ,lpad('abcdefg',10,0)
from     dual;


--���������� ä��� : Rpad('���ڿ�;, '���ڸ���', 'ä�﹮�ڿ�')
select   rpad('abcdef',10,'��')  , rpad('ABC',10,'#')
from              dual;


