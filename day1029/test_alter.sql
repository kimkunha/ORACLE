-- alter
-- alter는 상당히 많은 일을 할수 있다.

-- 계정 잠그기 : 관리자만 가능
alter user scott account lock;
-- 계정 : system,  비번 : managerum

--계정 열기
alter user scott account unlock;

-- 비번 변경
alter user scott identified by tiger;


-- 테이블 생성
                                     -- 테이블명,  컬럼명 오타를 바로잡기--
create table		test_atler(
         				num number,
         				neam varchar2(30),
         				addr number
         				);

-- 테이블명 변경  :    test_atler   ->   test_alter  로변경
alter table test_atler rename to test_alter;

--컬럼명 변경    :  neam   ->   name 로 변경
alter table test_alter rename column neam to name;


-- 컬럼의 데이터형 변경 :  레코드가 없으므로 데이터형까지 변경
-- addr의 number데이터형을 varchar2(100)으로 변경
alter table test_alter modify addr varchar(100) not null;

insert into test_alter(num,name,addr)
values(1,'테스트','서울시 강남구');
commit;
-- 데이터형을 변경 할 때에는 레코드가 비어 있어야한다.
alter table test_alter modify addr number;
-- 레코드가 존재 할때는 동일 데이터에서 크기만 변경가능
alter table test_alter modify addr varchar(200);

-- 컬럼 추가 : 추가되는 컬럼은 가장 마지막에 추가된다.
--                레코드가 존재하지 않으면 모든 제약사항을 부여할수 있다.

alter table test_alter add id varchar2(16);

-- 컬럼삭제
alter table test_alter drop column addr;

-- 제약사항 추가
-- 레코드의 구성이 제약사항을 만족하고 있는지부터 판단.

update test_alter
set id='test'
where num=1;


alter table test_alter add constraint pk_test_aler
primary key(id);

select * from user_constraints
where table_name='test_alter';

--제약사항 비활성화 : 제약조건이 동작하지 않는다.
alter table test_alter disable constraint pk_test_alter;

insert into test_alter(num,name,id) values(2,'이재찬','test');
select * from test_alter;
-- 제약사항 활성화 : 레코드의 구성에 따라 다르다.
delete from test_alter where num=2;
alter table test_alter enable constraint pk_test_alter;

--제약사항 삭제
alter table test_alter drop constraint pk_test_alter;
