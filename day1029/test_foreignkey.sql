-- �ܷ�Ű : �ٸ����̺�(�θ�)�� �����θ� ���� �߰��ؾ� �Ҷ�.
-- null, �ߺ����� ����Ѵ�.


-- �÷����� ������� : foreign key�� ������� �ʴ´�.
-- table_primary ���̺��� id���� �����Ͽ� �����͸� �߰�
-- �ϴ� foreign key ����
-- �ڽ� ���̺��� �÷����� ���� �ʿ�� ����, ���������� ũ�⸸ �����ָ� �ȴ�.
create table column_foreign(
					f_id varchar2(20) constraint fk_f_id references  table_primary(id),
					tel varchar2(13), adress varchar2(400)
					);


-- �߰�����
-- �θ����̺� �����ϴ� ������ �߰�
insert into column_foreign(f_id, tel, adress)
values('kim','010-6784-8457','sm');

insert into column_foreign(f_id, tel, adress)
values('test','010-6784-8457','����� ������ �ѵ�����');

--���� ���̵�� ���� �߰��� �� �ִ�.
insert into column_foreign(f_id, tel, adress)
values('kim','010-6784-8457','jyp');

-- null ���

insert into column_foreign( tel, adress)
values('010-6784-8457','�̽�ƽ');

-- �θ����̺� ���� ���� �߰��ϸ� ERROR �߻�
insert into column_foreign(f_id, tel, adress)
values('kim1','010-6784-8457','jyp');   -- �θ�Ű 'kim'�� �ִµ� 'kim1'�� ��� ERROR


--�θ����̺��� �����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ�
-- �������� �ʴ´�.
insert into  table_primary(name, id, passwd)
values('��ȣ��', 'kang', '1234');
commit;

-- kang �����ϴ� ���ڵ尡 �������� �����Ƿ� ���� ����
delete from      TABLE_PRIMARY where id='kang';

-- kim�̳� test�� �����ϴ� ���ڵ尡 �����ϹǷ� �����Ұ�
delete from      TABLE_PRIMARY where id='kim';
delete from      TABLE_PRIMARY where id='test';

-- on delete cascade�� �������� �ʾ��� ����
-- �����ϴ� �ڽķ��ڵ带 ��� �����ϰ�
-- �θ��ڵ带 �����ϸ� �ȴ�.
delete from column_foreign where f_id ='kim';
delete from table_primary where id='kim';
commit;
select * from COLUMN_FOREIGN ;
select * from TABLE_PRIMARY;

-- ���̺� ���� �������
create table table_foreign (
					id varchar2(20),
					java_score number(3),
					oracle_score number(3),
					constraint fk_table_id foreign key(id) references
					table_primary(id)
);

--�θ����̺� �����ϴ� ������ �߰�  -����-
insert into table_foreign(id,java_score,oracle_score)
values('kim',97,78);     --�ߺ���� , ����̵� ����-
commit;

-- �����ϴ� �ڽ� ���ڵ尡 �����Ѵٸ� �θ����̺��� �ٷ� ���� �Ұ�
delete from table_primary
where id='kim';     --�ڽķ��ڵ� ����� ���� ����--

insert into table_primary(name,id,passwd)
values('���߱�','song','1234');

insert into table_primary(name,id,passwd)
values('����','gong','1234');
commit;

-- �θ��ڵ带 �����ϸ� �����ϴ� ��� �ڽ� ���ڵ带
-- �����ϰ� �θ��ڵ带 �����ϴ� On delete casccade ���
create table test_cascade(
 					id varchar2(20),
 					addr varchar2(100),
 					constraint fk_test_id foreign key(id)
 					references table_primary(id)
 					on delete cascade
 					);

insert into test_cascade(id,addr)
                  values('song','������ ���ﵿ');
insert into test_cascade(id,addr)
                  values('gong','������ ���ﵿ');
commit;
select * from TEST_CASCADE;
-- on delete cascade�� �����Ǹ� �θ��ڵ尡 �����Ǹ�
-- �ڽ� ���ڵ嵵 �Բ� �����ȴ�.
delete from table_primary where id='song';
delete from table_primary where id='gong';
-- on delete cascade�� ������ ���� ���̺��� �����ϴ�
-- ���ڵ�� ���� ���� �ʴ´�.
delete from table_primary where id='kim';

select *from user_indexes;
