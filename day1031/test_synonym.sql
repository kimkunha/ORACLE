-- synonym 생성 테이블 보기
select *from user_synonyms;

-- synonym 생성
create synonym   tmp2 for table_multi_primary2;  --권한없음--
                                                                                --tmp1안돼서 2로 사용-
-- 도스창에서 관리자 계정(sysdba)에서 입력--재로그인 해야됨--
--grant create synonym to scott;--

-- synonym 사용하여 DML 가능
select * from TMP2;
insert into tmp2(item_num, item, item_info)
values('ITEM_0003','바나나','뒤에오는 라이더라 밟으면 미끄러짐');

--시노님 삭제
drop synonym tmp1;


select * from user_synonyms;

select * from user_constraints;



