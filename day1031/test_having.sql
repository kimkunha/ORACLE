-- group by having 절
-- having : 그룹으로 묶일 조건
-- 사원수가 4명 이상인 부서의 부서번호, 사원수, 연봉합, 최고연봉
-- 을 조회

select deptno, count(deptno), sum(sal),max(Sal)
from emp
group by deptno
having count(deptno)>4;

-- replace : 값을 치환
select   replace('오늘은 목요일 입니다.','오늘은', '내일은')
from dual;

select   replace('정택성,이재현,이재찬,김희철','이재찬','인천시의 자랑 이재찬' )
from dual;

select   replace('내일은 수요일 입니다.','내일은', '오늘은')
from dual;


