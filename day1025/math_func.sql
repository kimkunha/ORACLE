--수학함수
select     sin(25),cos(25),tan(25)
from   dual;


--절대값 : abs(값)
select  abs(25),abs(-25)
from  dual;


--반올림 : round(값, 자릿수)
select       round(777.775,2) , round(777.777,-1)
from  dual;


--절삭 : trunc(값, 자릿수)
select      trunc(777.777,2)  , trunc(777.777,-2)
from dual;


--올림 : ceil(값)
select       ceil(10.166) , ceil(10.0001)
from   dual;


-- 내림 : floor(값)
select        floor(10.9), floor(10.9879789)
from   dual;


--사원테이블에서 사원번호, 사원명, 입사일, 연봉, 세금을 조회하세요
-- 단,세금은 연봉의 3.3%계산하고 원단위를 절삭하여 출력해보세요.

select		EMPNO, ENAME, HIREDATE, SAL,
				trunc(SAL *0.033,-1) tax
from	EMP;


select      trunc(26.4,-1)
from  dual;
