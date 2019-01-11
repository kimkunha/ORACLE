-- 인덱스 조회
select * from user_indexes;

create table cp_zipcode as (Select * from zipcode);

select count(*) from cp_zipcode;
select count(*) from zipcode;

-- cp_zipcode 테이블의 seq컬럼에  unique index 설정
create unique index idx_zipcode on cp_zipcode(seq);

drop index idx_zipcode;

select*from user_indexes;

-- 인덱스를 사용하지 않는 조회
select zipcode,sido,gugun,bunji,seq
from zipcode
where seq=49000;

-- 인덱스를 사용한 조회
 select /*+ ordered index (idx_zipcode)*/zipcode,sido,gugun,bunji,seq
from cp_zipcode
where seq=49000;


 select /*+ ordered index (idx_zipcode)*/zipcode,sido,gugun,bunji,seq
from cp_zipcode
where zipcode='402-866';

-- 우편번호는 중복되지만 독특한 형태를 가진다.
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;

-- 인덱스를 사용하지 않는 조회 (full scan)
select zipcode,sido,gugun,bunji,seq
from zipcode
where zipcode='402-866';

select * from user_indexes;

-- 인덱스는 실제테이블이 변경되면 변경사항을 적용하지 않는다.
-- 테이블과 인덱스를 동일하게 맞추는 쿼리
 alter index idx_zipcode rebuild;
