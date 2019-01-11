-- Ineset subquery

-- �ܼ���
-- cp_emp3�� �Ʒ��� ���� ���ڵ带 �߰�.
-- �����ȣ : 1111, ����� : ����ö, �μ���ȣ : 10, ���� : ���,
-- ���� : emp���̺��� �����ȣ�� 7566�� ����� ������
-- ������������ �߰��ϼ���
insert into cp_emp3( EMPNO, ENAME, DEPTNO, JOB, SAL)
values (1111,'����ö',10,'���',
  (select sal from EMP where empno =7566));

--������ ���������� �����ϴ� ������ �������� ���Ǹ� eroor
-- �������� �����°��
insert into cp_emp3( EMPNO, ENAME, DEPTNO, JOB, SAL)
values (1111,'����ö',10,'���',
  (select sal from EMP ));

-- �÷��ϳ��� ���� �־�� �ϴ� ������ �÷� �������� ��ȸ�Ǹ�
-- �߰��ϴ� ���� ������ ���� �����Ƿ� eroor
insert into cp_emp3( EMPNO, ENAME, DEPTNO, JOB, SAL)
values (1111,'����ö',10,'���',
  (select sal, DEPTNO from EMP where empno =7566));

-- ������(������) ��������
-- emp ���̺��� �μ���ȣ�� 30���� �μ��� �����ȣ, �����, �μ���ȣ
-- ����, ������ ��ȸ�Ͽ� cp_emp3���̺� �߰�
insert into cp_emp3
(select EMPNO, ENAME, DEPTNO, JOB, SAL from emp
where DEPTNO =30);

-- emp���̺��� �����ȣ 7566�� ������ȸ
select sal from emp
where empno=7566;

-- tset��----
create table test( job varchar2(9),sal number(7,2),
					hiredate date);
alter table test add inPut_Date date;
alter table test modify hiredate varchar2(7);

-- ������̺��� 1980-02�� �Ի��� ����� ����,����,
-- �Ի�� -��, �Է����� test���̺� �߰�

insert into test
(select job, sum(sal),to_char(hiredate,'yyyy-mm') hiredate,sysdate
from emp
where to_char(hiredate,'yyyy-mm')='1981-02'
group by job,hiredate); --�ùٸ� ���� �ƴ�--       

