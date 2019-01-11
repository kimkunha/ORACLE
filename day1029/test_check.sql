-- check, notnull, default
-- check : �÷��� ���� ��ȿ�� ������ ������ �߰�
-- not null : ���� �ݵ�� �Է¹޾ƾ� �� ��
-- default : �÷��� �����Ǿ� null �Էµɶ� ��� �� �⺻ ��.

-- �̸�, ����, �ּ�, �Է��� �� �����ϴ� ���̺� ����
-- ��, �̸��� �ʼ��Է��̰�, ���̴� 20~30�븸 �Է°����ϰ�,
-- �Է����� �����Ǹ� ���糯¥�� �Էµǵ��� �����ϼ���.

create table 			other_constraint(                  --number byte ������-
							name varchar2(30 byte) constraint c_name not null,
							age number(2) 
,
							addr varchar2(20byte) null,
							input_date date default sysdate
							);
 --user_constraints������ ������� (PK,FK,UK,CHECK,NOT,NULL)�� Ȯ�ΰ���
  --default�� ���⿡ �ȳ��´�-
  select * from user_constraints;

                    
--
SELECT * from user_tab_cols
where table_name='OTER_CONSTRAINTS';


-- �߰� ����
-- ���� ������
insert into other_constraint( name,age,addr,input_date)
values('������',27,'�����','2018-10-26');
-- �ּҿ� �Է��� ����
insert into other_constraint( name,age)
values('�ڿ���',27);
-- ERROR
-- �̸��� �����Ǵ� ���(not null����)
/*insert into other_constraint( age,addr,input_date)
values(27,'�����','2018-10-26');   --�Ұ���--
*/

/*
insert into other_constraint( name,age,addr,input_date)
values('',27,'�����','2018-10-26');  -- �÷��� �־ ���� �ȳ����� ERROR
*/

-- ���̰� 20~30�밡 �ƴѰ��
/*
insert into other_constraint( name,age,addr,input_date)
values('������',15,'�����','2018-10-26');

insert into other_constraint( name,age,addr,input_date)
values('������',40,'�����','2018-10-26');
üũ�������ǿ� ����
                                                                     --20~39�� üũ�����̶� �� ���Ǹ� ����
*/

-- not null�� ���̺� ���� ����������δ� �����Ҽ� ����. (�÷������θ� ����)
create table temp(
name varchar2(10),
constraint C_name1 not null(name)
);                              --�Ұ���--

select * from OTHER_CONSTRAINT;
