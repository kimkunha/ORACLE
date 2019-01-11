/* �Ʒ��� ���ǿ� �´� ���̺��� �����ϰ� ������ ��������� �ο��� �� ��� �������ǿ� �����ϴ�
���� ������ ��쿡 ���� �����ϴ� ��� �������� �ۼ��ϼ���.
 �μ���ȣ, �����, ����, �̸���, ��ȭ��ȣ,����,  �ּ�, �Ի���, �����ȣ�� �����ϴ� ���̺��� ����.
 -�������
 	-�μ���ȣ�� dept ���̺��� deptno�� �Է��� �� �ִ�.  => �ܷ���Ű
 	-������� �����������̰� �ѱ۷� 10���� ���� �Է°����ϸ�,  => check
 	-������ �����̰� ������� �Է��� �����ϴ�. �Է°��� ������ 2500~8000���� �Է°���  => check
 	-�̸���, ��ȭ��ȣ�� ���� ���� ������ �ִٸ� �����ϴ� ==> primary key�̿�,
 	-������ ���ڶǴ� ���ڸ� �Է°����ϴ�.   ==>    check
 	-�ּҴ� ���� ���� �ִ�. ==>  unique
 	-�Ի����� ��¥�����̸�, �߰��� �� �Ի����� null�̶�� ���� ��¥�� �ԷµǾ�� �Ѵ�. ==>default
 	-�����ȣ�� ���� 4�ڸ��̸� null�� ������� �ʰ� �ߺ������͸� ������ �� ����. ==>primary key
 	-��� ������Ȳ�� ������Ȳ�� ���� �������� �ۼ��� �� foreign key�� �ش��ϴ� ���������
 	  ��Ȱ��ȭ ��Ų �� ��������.

*/

create table work5(
	deptno number(2) constraint fk_ddeptno references DEPT(deptno),
	ename varchar2(30) not  null,
	sal number(9) constraint c_sal check(sal between 2500 and 8000),
	email varchar2(50) constraint uk_kemail unique , --����ũ
	tel varchar2(13)constraint uk_ktel unique, --����ũ
	gender char(6) constraint c_gender check(gender= '����' or gender = '����'),
	addr varchar2(100) NULL,
	hiredate date default sysdate,
	empno  number(4)constraint pk_empno primary key  --�⺻Ű empno
	);

commit;
select * from work5;

insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(40,'����',2700,'','','����','','',1234);
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(20,'����',10000,'','','����','','',3333);
insert into work5(deptno,ename,sal,email,tel,gender,addr,empno)
values(30,'����',6000,'','','����','',1236);

select * from user_constraints;
drop table work5;
purge recyclebin;


/*-�μ���ȣ�� dept ���̺��� deptno�� �Է��� �� �ִ�.  => �ܷ���Ű
 	-������� �����������̰� �ѱ۷� 10���� ���� �Է°����ϸ�,  => check
 	-������ �����̰� ������� �Է��� �����ϴ�. �Է°��� ������ 2500~8000���� �Է°���  => check
 	-�̸���, ��ȭ��ȣ�� ���� ���� ������ �ִٸ� �����ϴ� ==> primary key�̿�,
 	-������ ���ڶǴ� ���ڸ� �Է°����ϴ�.   ==>    check
 	-�ּҴ� ���� ���� �ִ�. ==>  unique
 	-�Ի����� ��¥�����̸�, �߰��� �� �Ի����� null�̶�� ���� ��¥�� �ԷµǾ�� �Ѵ�. ==>default
 	-�����ȣ�� ���� 4�ڸ��̸� null�� ������� �ʰ� �ߺ������͸� ������ �� ����. ==>primary key
 	-��� ������Ȳ�� ������Ȳ�� ���� �������� �ۼ��� �� foreign key�� �ش��ϴ� ���������
 	  ��Ȱ��ȭ ��Ų �� ��������. */
------------------------------------------------------------------------
--�μ���ȣ�� dept ���̺��� deptno�� �Է��� �� �ִ�.
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'����',2700,'ggg@naver.com','010-3333-3333','����','����� ��õ��','',1100);
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(60,'����',2700,'ggg@naver.com','010-3333-3333','����','����� ��õ��','',1100);
-------------------------------------------------------------------------
--������� �����������̰� �ѱ۷� 10���� ���� �Է°����ϸ�
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'����',2700,'ggk@naver.com','010-3333-3333','����','����� ��õ��','',1101);
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(60,'������������������������',2700,'ggo@naver.com','010-3333-3333','����','����� ��õ��','',1102);
--------------------------------------------------------------------------
--������ �����̰� ������� �Է��� �����ϴ�. �Է°��� ������ 2500~8000���� �Է°���
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'����',2800,'ggo@naver.com','010-3333-3333','����','����� ��õ��','',1102);

--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'������',10000,'ggl@naver.com','010-3333-3333','����','����� ��õ��','',1103);
---------------------------------------------------------------------------
--�̸���, ��ȭ��ȣ�� ���� ���� ������ �ִٸ� �����ϴ�
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'������',10000,'ggr@naver.com','010-3333-3333','����','����� ��õ��','',1103);

--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'����',2800,'ggk@naver.com','010-3333-3334','����','����� ��õ��','',1103);

---------------------------------------------------------------------------
--������ ���ڶǴ� ���ڸ� �Է°����ϴ�.
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'������',2800,'ggt@naver.com','010-3333-3338','����','����� ��õ��','',1105);
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate,empno)
values(30,'������',2800,'gut@naver.com','010-3333-3339','�߼�','����� ��õ��','',1106);
---------------------------------------------------------------------------
--�Ի����� ��¥�����̸�, �߰��� �� �Ի����� null�̶�� ���� ��¥�� �ԷµǾ�� �Ѵ�.
--�Ի����� NULL�� ��
insert into work5(deptno,ename,sal,email,tel,gender,addr,empno)
values(30,'������',2800,'gut@naver.com','010-3333-3339','����','����� ��õ��',1106);
--�ϻ����� �ԷµǾ��� ��\
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate, empno)
values(30,'������',2800,'gqt@naver.com','010-3333-3320','����','����� ��õ��','2018-11-11',1107);
---------------------------------------------------------------------------
--�����ȣ�� ���� 4�ڸ��̸� null�� ������� �ʰ� �ߺ������͸� ������ �� ����.
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate, empno)
values(30,'������',2800,'gqh@naver.com','010-3333-3321','����','����� ��õ��','2018-11-11',1110);
--����
insert into work5(deptno,ename,sal,email,tel,gender,addr,hiredate, empno)
values(30,'������',2800,'gqh@naver.com','010-3333-3321','����','����� ��õ��','2018-11-11',1110);
------------------------------------------------------------------------
--foreign key�� �ش��ϴ� ��������� ��Ȱ��ȭ.
alter table work5 disable constraint fk_ddeptno;

--������� ����
alter table work5 drop constraint fk_ddeptno;


