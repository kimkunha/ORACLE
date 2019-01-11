-- 집계함수 - 컬럼의  값을 하나로 만들어 반환하는 함수들.
-- count : nul이아닌 컬럼을 갯수를 셀때

--사원테이블의 레코드 수 ( 사원수)  ,보너스를 수령하는 사원수
--보너스를 수령하지 않는 사원수, 매니저가 있는 사원수
select		count(empno), count( comm),
				count(empno)-count(comm),count(mgr)
from			emp;


select count(ename)
from emp;
--연봉 합,보너스의 합, 총 인건비의 총합
select		sum(sal),sum(comm),sum(sal)+sum(comm)
from			emp;

--연봉평균, 보너스 평균
select    	trunc(avg(sal)),avg(comm)
from 		emp;

--최고연봉액 ,최저 연봉액, 최고연봉액과 최저연봉액의 차

select		max(sal),min(sal), max(sal)-min(sal)
from			emp;

--**where절 에서는 집계함수를 사용할 수 없다..!!!(주의)
--ex)사원테이블에서 평균연봉보다 많이 수령하는 사원번호,
-- 사원명, 연봉, 입사일을 조회
select		empno, ename, sal, hiredate
from		 	emp;
where		sal>avg(sal);               --불가능--

-- 집계함수는 Gruop by 와 같이 사용하면 그룹별 집계를 조회한다.
--부서번호, 부서별 인원수, 부서별 연봉 합, 연봉평균 ,최고 연봉액
-- 최저 연봉액
select      	deptno, count(empno), sum(sal),
				trunc( avg(sal),2), max(sal), min(sal)
from  		emp
group by 	deptno
order by 	deptno;

--사원테이블에서 매니저별 관리인원수, 최고연봉과 최저연봉,
-- 최고 연봉과 최저연봉의 차이
select       	MGR , count(mgr), max(Sal),min(sal),
					max(sal)-min(sal)
from				emp
where			mgr is not null
group by 	  	mgr
order by		mgr;

--날짜함수
--날짜에 +를 사용하면 일 을 더한다.
select     	sysdate+5
from 		dual;

select		add_months(sysdate,5)
from 		dual;

select    	months_between('2019-12-25',sysdate)
from 		dual;

