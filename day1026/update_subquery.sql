-- update subquery : �ٸ� ���̺��� ���� �����Ͽ� ���� ���̺���
-- ���� �����Ҷ�

-- �ܼ���
-- cp_emp3���̺��� �����ȣ�� '1111'�� ����� ������
-- emp���̺��� �����ȣ�� '7788'�� ����� �������� ����.
update cp_emp3
set sal=(select sal from emp where empno=7788)
where empno=1111;

-- �ܼ��� ���������� �������� �߻��ϸ� error
update cp_emp3
set sal=(select sal from emp)
where empno=1111;

-- �÷��� ������ ��ȸ�ϸ� Error
update cp_emp3
set sal=(select sal,dptno from emp where empno=7788)
where empno=1111;

-- ������ ���������� in�� ����Ͽ� where���� ���
insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222,'�׽�Ʈ',30,'SALESMAN',2000);
commit;
-- cp_emp3���̺���  emp���̺��� �μ���ȣ�� 30���� �����
--���� �����ȣ�� ���� ����� ������ '1000'���� ����

-- Ǫ�¹�� : ���� emp���̺��� 30���� ������� �����ȣ
--select empno from EMP where deptno=30;  �����Ѵ�
--
update 		cp_emp3
set 			sal = 1000
where   	empno in (select empno from EMP where deptno=30);


---------------------------------------------------------------------------

-- delete subquery

--------------------------------------------------------------------------------
-- �ٸ� ���̺��� ���� �����Ͽ� ���� ���̺� ���ڵ� ����
-- �ܼ���
update cp_emp3
set ename = '���ī'
where empno =7698;
commit;

-- cp_emp3 ���̺��� ��������� ����
-- �������� : emp���̺��� ������� 'blake'�� ����� �����ȣ
-- ���� ����� cp_emp3���̺��� ����

delete from 	cp_emp3
where 			empno=(select empno from emp where ename='BLAKE');

-- ������ :
-- cp_emp3���̺���  emp���̺��� �μ���ȣ�� 30���� �����
--���� �����ȣ�� ���� ����� ����
delete from	 cp_emp3
where 			empno in (select empno from emp where deptno=30);



select * from CP_EMP3
