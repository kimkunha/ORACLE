-- synonym ���� ���̺� ����
select *from user_synonyms;

-- synonym ����
create synonym   tmp2 for table_multi_primary2;  --���Ѿ���--
                                                                                --tmp1�ȵż� 2�� ���-
-- ����â���� ������ ����(sysdba)���� �Է�--��α��� �ؾߵ�--
--grant create synonym to scott;--

-- synonym ����Ͽ� DML ����
select * from TMP2;
insert into tmp2(item_num, item, item_info)
values('ITEM_0003','�ٳ���','�ڿ����� ���̴��� ������ �̲�����');

--�ó�� ����
drop synonym tmp1;


select * from user_synonyms;

select * from user_constraints;



