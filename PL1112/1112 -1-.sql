

desc student;

desc subject;



-- TEST, STUDENT,  SUBJECT

INSERT INTO subject(sub_Code,title,info)
values('O_000001', '����Ŭ','��뷮 Database�� �����ϴ� ���α׷�');
INSERT INTO subject(sub_Code,title,info)
values('J_000001', '�ڹ�','�Ϻ��� OOP���');
commit;
select * from SUBJECT;


INSERT INTO subject(sub_Code,title)
values('A0','');     -- ���� Ȯ��-


insert into student(stu_num,name,age,address,email)
values('S_00000001','������',27,'�����','Lee@test.com');


insert into test(test_num,sub_code,stu_num)
values(3,'J_000001','S_00000001');

select * from test;


commit;

select * from TEST;
select * from SUBJECT;
select * from STUDENT;





insert into user_info(id,pw,user_name,language,addr)
values('testo','aass','kim','c','��� û�ֽ� ���ŵ�');

select * from user_info;

insert into board(board_num,board_name,contents,view_count,id)
values(20,'kim','asdsdf',155,'testo');


select * from board;



insert into seat(seat_uk_num,seat_num)
values(122,140);

select * from seat;



insert into reserve ( reserve_uk_num,id,seat_uk_num)
values(200,'test',150);


select * from reserve;


