-- ��������� Ȯ�� : user_constraints
-- ������׸��� ���̺�� ó�� �����ؾ��Ѵ�.
select * from user_constraints;

-- ��ȣ, �̸�, ��ȭ��ȣ, �ֹι�ȣ, �̸��� �����ϴ� ���̺� ����.
-- �ֹι�ȣ�� null�� ������� �����鼭 �����ؾ� �Ѵ�.
create table column_primary(
					num number,
					name varchar2(30),
					tel varchar2(13),
					ssn char(14) constraint pk_column_primary primary key,
					email varchar2(50)
);

select * from COLUMN_PRIMARY;
/*
drop table column_primary;  -���̺� ����-
purge recyclebin;   -�����뿡�� ���̺� ����-
*/

--------------------------- �÷��ϳ��� pk�� �����Ǵ� ���
-- �߰�����
-- ���� ���ڵ� ����
insert into column_primary(num,name,tel,ssn,email)
values(1,'������','010-1234-5678','880101-1234567','lee@test.com');
commit;

-- �ֹι�ȣ�� �ٸ����
insert into column_primary(num,name,tel,ssn,email)
values(2,'������','010-2222-6432','890101-1234567','lee@test.com');


insert into column_primary(num,name,tel,ssn,email)
values(3,'����ȫ','010-8452-6412','511517-4154875','lee@test.com');



select * from COLUMN_PRIMARY;


-- �߰�����
-- �ֹι�ȣ�� ���� �ֹι�ȣ�� �ԷµǴ� ��� ERROR
insert into column_primary(num,name,tel,ssn,email)
values(4,'���ü�','010-8271-5482','880101-1234567','jung@test.com');
commit;
-- null�� �Է� �Ǵ� ���   ERROR
-- ����, ��¥�� �÷��� �����Ǹ� null�� �Էµǰ�
-- ���ڿ� (��������, ��������)�� �÷��� �����Ǵ� ���� "(empty)
-- �� �����Ͱ� �߰��Ǵ� ��쿡 null �Էµȴ�.

-- �÷��̿�  NULL�� �Ǵ� ���  2����
-- 1. �÷��� �����Ǿ� insert�Ǵ°��
insert into column_primary(num,name,tel,email)
values(4,'���ü�','010-8271-5482','jung@test.com');
-- 2. �÷��� ���ǵǾ� ������ ''('�̰��� 2��)�� �ԷµǴ� ���
insert into column_primary(num,name,tel,ssn,email)
values(4,'���ü�','010-8271-5482','','jung@test.com');

-- table level constraint
-- �̸�, ���̵�, ��й�ȣ�� ���� ���̺� ����
-- ���̵�� null�� ������� �����鼭 ���� �����ؾ� �Ѵ�.


create table table_primary(
					name varchar2(30),
					id varchar2(20),
					passwd varchar2(30),
					constraint pk_table_primary  primary key(id)
					);

select * from TABLE_PRIMARY;
-- �߰�����
insert into table_primary(name,id,passwd)
values('����ö','kim','1234');
commit;
insert into table_primary(name,id,passwd)
values('����ö','test','1234');
--insert into table_primary(name,id,passwd)     --id�� pk�� �ɷ��־ ������ �ȵ�.
--values('�迵ö','test','12424');
commit;
-- �߰�����
insert into table_primary(name,passwd)
values('����ö','123455');

insert into table_primary(name,id,passwd)
values('����ö','','1234');


-- �������� �÷��� pk�� �����Ǵ� ���.
-- table ���� ����������θ� ��������


-- (����) ���� �����������ȣ ���� 1 ������ ������
-- EMMP_00007899 �� ������ ���� ���� ��ȸ

/*[���� �ؼ� Ʋ����] select        concat('EMMP_', lpad(empno,8,0))
from emp;
*/
select   concat('EMMP_',lpad(max(empno)+1,8,0))
from emp;


-- �����۸�, ������ ��ȣ, ����
-- ������ ��ȣ�� ���ڵ尡 �߰��ɶ� ���������� �����ϸ�
-- 'ITEM_0001'�� ������ ������.
-- ������ ��ȣ�� �����۸��� ������ ����.
/*create table table_multi_primary(
					item_num char(9),
					item varchar2(60),
					item_info varchar2(4000),
					constraint pk_table_primary primary key(item_num,item)
					);
*/

--drop table TABLE_MULTI_PRIMARY;
--purge recyclebin;
-- ���̺� ������ �ȵǼ� TABLE_MULTI_PRIMARY2�� ����
select * from       TABLE_MULTI_PRIMARY2;
create table table_multi_primary2(
					item_num char(9),
					item varchar2(60),
					item_info varchar2(4000),
					constraint pk_table_primary2 primary key(item_num,item)
					);

select * from TABLE_MULTI_PRIMARY2;

-- item_0001 ��ȸ
select concat('ITEM_',lpad(nvl(max(item_num),0)+1,4,0))
from table_multi_primary2;


-- �������� �÷��� �ϳ��� PK�� �����Ǵ� ���
-- �߰����� : ���ʵ����� �Է�
-- ��ȸ�� ���ڵ尡 null�϶��� ���� ���� (��ȸ�� ���ڵ尡 ���ٸ� ����X)
-- �� �÷��� ���� �ٸ���� :  ����
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values  ((select concat('ITEM_',lpad(nvl(max(item_num),0)+1,4,0))
from table_multi_primary2),'���ĸ�',
'�ٷξ� ���̴����� ���� ���̴��� ��� ���� �ִ�');
commit;

-- �� �÷����� ��� �ٸ� ��� : ����
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values  ((select concat('ITEM_',lpad(max(substr(item_num,instr(item_num,'_')+1))+1,4,0))
from table_multi_primary2),'����ź',
'�����Ÿ��� �� ���̴��鿡�� ���� ���ݹ��� ���̴����� ��� ���� �ִ�');


-- �� �÷��� �ϳ��� �÷��� �ٸ� ��� : ����
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('item_0002','���ĸ�', '���ϸ� ¥����.');


insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('item_0002','���ĸ�1', '���ϸ� ¥����.');

-- ������ �߻��ϴ� ���
-- �� �÷��� ��� ���� ���� ������
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('item_0002','���ĸ�', '�ٷ� �� ���̵����� ���� ���̴��� ��� ��� �� ����');


-- ���� �ϳ��� null�� �߰� �ɶ�
insert into TABLE_MULTI_PRIMARY2(item_num,item,item_info)
values ('','���ĸ�', '���ϸ� ¥����.');

insert into TABLE_MULTI_PRIMARY2(item_num,item_info)
values ('item_0003','����ź', '�ռ� Ư�� ���̴��� �����Ͽ� �̻����� �߻�.');




