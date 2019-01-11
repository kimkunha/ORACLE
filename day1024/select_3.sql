-- 정렬
-- 사원테이블에서 사원번호, 사원명 ,연봉, 입사일 조회
-- 단 , 연봉은 오름차순으로 정렬하여 출력할것
-- 연봉이 같다면 입사일의 내림차순으로 정렬하여 출력

select         empno,ename,sal, hiredate,
from      emp
order by   sal, hiredate desc ;

select * from emp;

-- 사원테이블에서 매니저번호, 사원번호, 사원명, 연봉을 조회하세요
--단 매니저 번호의 내림차순으로 정렬할되 매니저 번호가 같다면
--사원명의 오름차순으로 정렬

select       empno, ename, sal
from           emp
order by         mgr desc, ename;


create table test_orderby(
num varchar2(10)
);
  insert into test_orderby(num) values('1000');
insert into test_orderby(num) values('1');
  insert into test_orderby(num) values('204');
    insert into test_orderby(num) values('21');
      insert into test_orderby(num) values('191');
        insert into test_orderby(num) values('300');
  insert into test_orderby(num) values('20001');
  commit;
select * from test_orderby;


--번호 오름차순 정렬  : 문자열의 정렬은 자릿수의 정렬이다. 
-- 문자열이 숫자형태의 값을 가지면 자릿수의 정렬을 한다

select         num
from     test_orderby
order by      num asc;     



