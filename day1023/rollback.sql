-- transaction ���
-- savepointf�� �����Ͽ� Ư���������� �۾� ���
-- transaction�� �������� ������ �̷���� ��� savepoint����Ѵ�.

savepoint insert_a;
insert into class4_info(num,name,email)
values(21,'�׽�Ʈ','test@test.com');


savepoint insert_b;
insert into class4_info(num,name,email)
values(22,'�׽�Ʈ','test@test.com');


savepoint update_c;
update class4_info
set name='����3'
where num=22'


savepoint delete_4;
delete from class4_info
where num=22;


-- rollback to delete_d;
-- rollback to updaate_c;


