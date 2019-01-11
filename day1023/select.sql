-- 특정 테이블의 원하는 컬럼에 모든 레코드를 조회
-- class4_info 테이블에서 이름, 번호, 나이 조회
/*
select name, num,ag
from class4_info;
*/

-- 조회하는 컬럼에 *을 사용하면 모든 컬럼을 조회
/*
select *
from class4_info;
*/


-- 컬럼크기 변경
-- 0 : 데이터가 없다면 0을 채워서 출력
column num format 0000




-- 문자열은 "a글자수를 설정"

col name format 999
col eye format 0.000
col email format a10

-- 9 : 데이터가 존재하는것만 출력
column age format 999

select *
from class4_info;