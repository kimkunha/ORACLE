-- unique : ���� �������� �ְ� �ִٸ� �����ؾ��� ��.
-- �̸�, �̸���, �ּ� �����ϴ� ���̺� ����
create table column_uique(
					name varchar2(30),
					emil varchar2(50) constraint uk_email unique,
					addr varchar2(100)
						);

select * from user_constraints;

-- �߰�����
-- �����Է�
insert into column_uique(name, emil,addr)
values('������','lee@test.com','��⵵ ������ ���뱸');
commit;
-- �̸����� ���� ���(
�Է�) ���
insert into column_uique(name ,addr)
values('������','��⵵ ������ ���뱸');

insert into column_uique(name, emil,addr)
values('������1','','��⵵ ������ ���뱸');

commit;

-- �����ϴ� ���
-- ���� �̸����� �ԷµǾ��� ��
insert into column_uique(name, emil,addr)
values('�ڿ���','lee@test.com','�λ��');
--unique�� ���� ���� �ԷµǾ����ø� ERROR�� ����.
commit;

select * from COLUMN_UIQUE ;

---------------------  ���̺� ����  ----------------------------
-- ��ȣ, �̸�, ��ȭ��ȣ, ī���ȣ�� �����ϴ� ���̺��� ����
-- ��ȭ��ȣ�� ī���ȣ��  �������� �ְ�, �ִٸ� ������ ��.

create table table_unique(
					num number(5),
					name varchar2(30),
					tel varchar2(13),
					card_num char(4),
					constraint uk_tel unique(tel),
					constraint uk_Card_num unique(card_num)
					);

select * from user_constraints;
select * from user_indexes;

-- �߰� ����
-- �����Է�
insert into table_unique(num, name, tel,card_num)
values(1,'������','010-8769-6112','1234');
--��ȭ��ȣ�� ������ȣ�� �ٸ� ���
insert into table_unique(num, name, tel,card_num)
values(2,'������','010-1111-2222','1235');
--null �Է�
insert into table_unique(num, name, tel,card_num)
values(1,'��������','','');
insert into table_unique(num, name)
values(3,'������');    --�̸��� ������ ��������-

-- ����
-- ��ȭ��ȣ�� ī���ȣ�� ���� �ϳ��� ���ٸ� ����
insert into table_unique(num, name, tel,card_num)
values(4,'���ü�','010-1424-6112','1235');    --ī���ȣ�� ���Ƽ� ERROR

insert into table_unique(num, name, tel,card_num)
values(1,'������','010-8769-6112','1514');    -- tel�� �����Ƿ� EROOR

select * from TABLE_UNIQUE;








