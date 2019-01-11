-- 컬럼을 붙여 문자열로 조회 : ||
--emp테이블에서 사원번호,사원명,직무를 조회
-- 출력형식은 : xxx(사원번호)님xx직무입니다.
-- alias를 "로 묶어서 부여하면 대소문자를 가려진 칼럼이 나온다.
select empno from emp;

select empno, ename from emp;
select ename||' (' || empno||')님'|| job||'job직무 입니다.'  out_put
from emp;


-- alias는 바로 아래 where 절에서 사용할수 없다.
select empno,ename , sal
from      emp
where          sal <3000;


--  산술 연산자  :  +, -, *, /
--  사원테이블에서 사원번호, 사원명, 연봉, 세금을 조회
--  단 세금은 연봉에 3.3%로 계산하여 출력 ,
--  사원번호는 현재번호에10을 더한 값으로 출력.
-- 계산 된 값은 컬럼명에 붙음 그래서 alias를 해서 간략하게 한다

select    empno, empno+10 new_empno, ename ,sal, sal*0.033  tax
from      emp;

-- 컬럼끼지 연산
select    empno-mgr
from emp;


-- 연산시 주의점 !   NuLL은 연산되면 결과가 null이 나온다.
-- 사원테이블에서 사원번호 ,연봉, 보너스, 총수령액을 조회
-- 단, 총 수령액은 연봉과 보너스를 합산한 금액으로 조회
-- null인 컬럼에 연산을 하기 위해서 nvl 함수를 사용.


select       empno,sal, comm, sal+nvl(comm,0) total
from         emp;


-- 나눈 나머지 : mod(컬럼명, 나눌값) 함수를 사용
--dual 테이블 : 모든 계정에서 사용할수 있는 가상테이블
--                    입력되는 값으로 컬럼을 생성하여 조회 처리한다


select '김건하' name, mod(11,3) , mod(1990,12)
from dual;
-- 0~11
-- 11: 양, 10: 말 ,9: 뱀, 8 : 용, 7 : 토끼, 6 : 호랑이, 5: 소,
-- 4 : 쥐, 3:돼지 , 2: 개, :1,닭 :0,원숭이

-- 조회하는 컬럼에 관계연산자를사용하면 errer

select       sal>300
from  emp;

--관계연산자 :  where절, having절 사용
-- >, < , >=, <= , = ,!=(< >)


--사원테이블에서 연봉이 3000보다 작은 사원의 사원번호, 사원명, 매니저번호,
-- 연봉, 입사일 , 부서번호 조회

-- 보고싶은 부분 까지 드래고한담에 alt + F7 눌러서 볼수 있다.


select    empno, ename, mgr, sal, hiredate, deptno
from emp
where sal <3000  ;


--사원테이블에서 연봉이 3000초과한 사원의 사원번호,
-- 사원명, 매니저번호, 연봉, 입사일, 부서번호 조희

select        empno, ename, mgr, sal, hiredate, deptno
from       emp
where         sal>=3000;


-- 사원테이블에서 부서번호가 '30'번인 사원들의
-- 사원번호, 사원명, 직무, 입사일, 조회

select       empno, ename, job, hiredate, deptno
from        emp
where            deptno=30;


-- 사원 테이블에서 부서번호가 '20' 번이 아닌 사원들의
-- 사원번호, 부서번호, 사원명, 직무를 조회
-- 주석걸기 컨트롤 + - 버튼   반대로 취소는 컨트롤+ 쉬프트 +-

select  empno,deptno,ename,job
from         emp
where       deptno !=20;

--사원테이블에서 보너스가 없는 사원의 사원번호, 사원명, 연봉
--보너스를 조회   (null 은 관계연산자로 비교할수 없다.)
-- null이 있을경우 = 가 불가(관계연산자로 비교 불가)여서
-- is를 사용, 반대로 할경우 is not으로 검색 (is null, is not null)

select     ename,sal,empno, comm
from  emp
where comm is  null;

--논리연산자는 and, or, not(혼자 사용불가)
-- 논리연산자 : and (모든 비교조건이 맞는 레코드를 조회),
-- or (비교조건에 해당하는 모든 레코드를 조회), not

--사원 테이블에서 사원번호가 7369이면서 직무가 'clerk'인
-- 사원의 사원번호, 사원명, 직무, 입사일, 연봉을 조회

select     empno,ename, job, hiredate, sal
from  emp
where      empno=7369 and job='CLERK';

-- 레코드에 들어있는 값에 대해서는 대소문자 가려야 한다. 안맞을경우 조회 안됨


--사원테이블에서 연봉이 1500이상 3000이하인  사원들의
-- 사원번호, 사원명, 직무, 입사일 , 연봉 조회
-- 범위를 검색조건으로 사용할 때에는 between 을 사용할수 있다.
-- 문법) 컬럼명 between 작은값 and 큰값 ;(중요)

select       empno,ename,job,hiredate,sal
from         emp
--where             sal>=1500 and sal<=3000;
where sal between 1500 and 3000;


--사원 테이블에서 7902,7839,7566 매니저의 관리를 받는  사원의
-- 사원번호, 사원명, 매니저 번호, 연봉, 입사일을 조회
-- or 는 in으로 바꿔 사용할수 있다.
-- 사용법 : 컬럼명 in (값.....)
-- in은 포함하는 , not in 은 포함하지 않음

select     empno,ename, mgr, sal, hiredate
from  emp
--where mgr=7902 or mgr=7839  or mgr=7566;
where mgr not in(7902,7839,7566);



