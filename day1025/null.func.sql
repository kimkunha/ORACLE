--null ��ȯ
--���ڵ带 �߰��Ҷ� �÷��� ������� ������ null�� �Է�
-- char,varchar2�ΰ��  : �÷��� ������� �ʰų�, "�ΰ��
-- number,date : �÷��� ������� ���� ��� ,
select * from emp ;


--������̺��� �����, ����, ���ʽ� ��ȸ
-- �� , ���ʽ��� ���� ������� 100���� ���
-- nvl(comm,100)  <-- �̷��� ��     ���ڿ� ���ڿ��� �ϸ� ����,
-- nvl(comm,100��)  �̷��Դ� �ȵ�  ������ �ѹ����̶� �׷���
select 	 ename, sal, nvl(comm,100)
from      emp;

-- �����ȣ���̺��� �Է��� ���� �����ȣ, �õ�, ����, ��, ����
-- ��ȸ, ������ ���ٸ� '��������'���� ���

select  		lower(ZIPCODE), SIDO, GUGUN, DONG,
				nvl(BUNJI,'��������')
from   		zipcode
where   	dong like '����1��%';


--class4_info���̺��� ��ȣ, �̸�, �Է��� ��ȸ
--��, �Է����� ���ٸ� ���糯¥�� ����ϼ���.


select  NUM, NAME ,nvl(INPUT_DATE,sysdate)
from    CLASS4_INFO;


