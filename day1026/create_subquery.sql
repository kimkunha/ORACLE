-- 테이블 복사 :
-- 사원테이블에서 사원번호, 사원명, 입사일, 연봉을 조회하여
-- 조회한 결과로 CP_EMP라는 테이블을 생성할 것.

create table cp_emp as
( select EMPNO, ENAME, HIREDATE, SAL from emp);

select * from CP_EMP;

alter table cp_emp modify sal number(7,2) not null;
select * from user_constraints;


-- not null 조건이 단독으로 설정되어 있다면 복사된다.

-- cp_emp테이블에서 사원번호가 7500~7599 사이에 속한
-- 사원의 사원번호, 사원명, 입사일, 연봉을 조회하여
-- cp_emp2테이블을 생성하고 입력하세요.
-- between은 무조건 작은수가 앞에 와서 조회된다.
create table 		cp_emp2 as
(select * from
where empno between 7500 and 7599);



-- 구조만 복사 (레코드를 조회하지 않고 서브쿼리를 수행)

-- 사원테이블에서 사원번호, 사원명, 부서번호, 직무, 연봉
-- 을 레코드가 조회되지 않도록 조회 할것.
-- where 절을 거짓으로 하면 레코드가 조회 안됨
select 		EMPNO, ENAME , DEPTNO, JOB, SAL
from			emp
where 		1=0;

-- 레코드가 없는 윗 테이블을 CP_EMP3로 생성
create table cp_emp3 as
(select 		EMPNO, ENAME , DEPTNO, JOB, SAL
from			emp
where 		1=0);

select * from CP_EMP3;
                                  
                                  
