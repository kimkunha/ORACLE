-- transaction 취소
-- savepointf를 설정하여 특정지점까지 작업 취소
-- transaction이 여러개의 쿼리로 이루어진 경우 savepoint사용한다.

savepoint insert_a;
insert into class4_info(num,name,email)
values(21,'테스트','test@test.com');


savepoint insert_b;
insert into class4_info(num,name,email)
values(22,'테스트','test@test.com');


savepoint update_c;
update class4_info
set name='연습3'
where num=22'


savepoint delete_4;
delete from class4_info
where num=22;


-- rollback to delete_d;
-- rollback to updaate_c;


