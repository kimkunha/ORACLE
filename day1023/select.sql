-- Ư�� ���̺��� ���ϴ� �÷��� ��� ���ڵ带 ��ȸ
-- class4_info ���̺��� �̸�, ��ȣ, ���� ��ȸ
/*
select name, num,ag
from class4_info;
*/

-- ��ȸ�ϴ� �÷��� *�� ����ϸ� ��� �÷��� ��ȸ
/*
select *
from class4_info;
*/


-- �÷�ũ�� ����
-- 0 : �����Ͱ� ���ٸ� 0�� ä���� ���
column num format 0000




-- ���ڿ��� "a���ڼ��� ����"

col name format 999
col eye format 0.000
col email format a10

-- 9 : �����Ͱ� �����ϴ°͸� ���
column age format 999

select *
from class4_info;