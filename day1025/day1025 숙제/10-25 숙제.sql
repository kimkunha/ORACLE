--숙제
/*
1. 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,
   입사일을 조회하세요.
 단, 연봉의 오름차순으로 정렬하되, 연봉이 같다면 사원번호의
    내림차순으로 정렬하세요.
    입사일은 월-일-년의 형식으로 출력하세요.
    연봉은 3자리마다 ,를 넣어 출력하세요.
*/

select 		EMPNO, ENAME, JOB, MGR, SAL,
				HIREDATE, to_char(hiredate,'mm-dd-yy') junban,
				to_char(sal,'9,999,999') nenbou
from			emp
order by 	sal asc,  EMPNO desc;

/*
2. 사원테이블에서 3,4분기에 입사한 사원들의  부서별 연봉합,
    연봉평균, 최고연봉, 최저연봉, 사원수를 조회하여 아래와 같이 출력하세요.
    출력예 )  10번부서 사원수는 [x]명, 연봉평균 : [xx],
	   최고연봉 [xx], 최저연봉[xx]
*/

select      DEPTNO||'['번부서']'||count(*)||trunc(avg(sal))||max(sal)||min(sal)
from			emp
where		to_char(hiredate,'q') in(3,4)
group by   DEPTNO;
/*
3. TEST_ORDERBY테이블에서 번호를 출력하세요.
   단, 출력되는 번호는  S_0000000001 형식으로
   10자리의 숫자가 되어야하며, 10자리가 되지 않는 숫자는
  앞에 0을 붙여 10자리로 만들고 'S_' 를 붙여 출력한다.
*/

select	lpad(lpad(NUM,10,'0')
from     TEST_ORDERBY;





