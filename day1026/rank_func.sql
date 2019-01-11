-- 순위 구하기
-- 전체 순위구하기
-- rank( ) over( )
-- rank( ) over( order by 컬럼명 정렬방식) - 중복번호[순위]가 발생할수 있음
-- 사원테이블에서 사원번호, 사원명, 연봉, 연봉순위 조회
-- order by는 필수
select * from EMP;
select       EMPNO, ENAME, SAL,
				rank( ) over(order by sal desc)
from			emp;


-- 사원테이블에서 사원번호, 사원명, 연봉, 연봉순위 조회
-- 단, 중복순위가 발생하지 않지 않도록 처리하여 조회 할것.
select       EMPNO, ENAME, SAL,
				row_number( ) over(order by sal desc)
from			emp;


-- 조회된 레코드를 그룹별 순위 : partition by
-- 사원테이블에서 사원번호, 사원명, 연봉,
-- 부서별 연봉순위 조회
select     	EMPNO, ENAME , SAL, DEPTNO,
				rank() over(partition by DEPTNO order by sal) sal_rank
from 		emp;


-- 부서별 연봉순위를 중복번호 없이 조회
select     	EMPNO, ENAME , SAL, DEPTNO,
				row_number() over(partition by DEPTNO order by sal) sal_rank
from 		emp;



-------------------------------------------------------

-- rollup, cube

----------------------------------------------------
-- rollup :  그룹별 소계를 얻을때 사용
-- 그룹으로 묶이는 컬럼이 하나인 경우에는 총계가 출력된다.

-- 사원테이블에서 부서별, 연봉의 합 조회하고 총계를 출력
-- rollup은 소계가 마지막에 출력된다.
select        	DEPTNO, sum(sal)
from				emp
group by		rollup(deptno);

-- cube는 소계가 먼저 출력된다.
select        	DEPTNO, sum(sal)
from				emp
group by		cube(deptno);

-- 여러컬럼이 그룹으로 묶여지면 rollup은 그룹별 소계를 마지막에
-- 출력한다.

--사원테이블에서  부서별, 직무의 연봉합, 소계, 총계 조회

select		DEPTNO, JOB, sum(sal)
from   		emp
group by 	rollup(DEPTNO, JOB)
order by 	DEPTNO;

-- 사원테이블에서  부서별, 직무의 연봉합,직무별(그룹별) 소계, 총계
-- 조회되는 레코드의 소계 조회
select		DEPTNO, JOB, sum(sal)
from   		emp
group by 	cube(DEPTNO, JOB);


select*
from user_constraints;

desc dept;


