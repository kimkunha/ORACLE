--변환함수
--문자열이 아닌 값(숫자, 날짜)을 문자열로 변환
-- 숫자 -> 지정한 자리에, 나   '.'을 출력
select		to_char(20181025,'0,000,000,000'),
				to_char(20181025,'9,999,999,999')
from			dual;


select		to_char(2018.1025,'999,999.999')
from			dual;


--사원테이블에서 사원번호, 사원명, 입사일, 연봉조회
-- 단, 연봉은 데이터가 있는 것까지만 , 를 넣어 출력
select		EMPNO, ENAME, HIREDATE,
				to_char(sal,'9,999,999')
from    		emp;



--to_Char함수로 변환되는 결과는 문자열이므로 사칙연산이 불가능하다.
--문자열은 사칙연산이 가능하지 않다. 괄호안에서는 가능.
select			to_char(sal+100,'9,999,999')  sal
from             emp;



--날짜  --> 문자열변환
-- mm과 dd는 무조건 2개 사용
select		to_char(sysdate,'yyyy-mm-dd am hh(hh24):mi:ss day dy  ')
from    		dual;




--pattern에 특수문자가 아닌 문자열을 사용할때는 "로 묶는다.
select      to_char(sysdate,'yyyy"년"mm"월"dd"일"')
from 		dual;



--pattern을 너무 길게사용하면  error  앵간하면 에러 안남.

select 		to_char(sysdate,'yyyy"년"')
from 		dual;



--사원테이블에서 사원번호, 사원명, 입사일을 조회
--단, 입사일은 '년-월-일 -요일' 의 형식으로 출력

select		empno, ename,
to_char  	(hiredate,'yyyy-mm-dd day hh24 : mi : ss')
from  		emp;



--***사원테이블에서 입사년도가 '1981년인 사원들의 사원번호, 사원명
-- 입사일 , 연봉을 조회 ***
-- 날짜하고 숫자는 비교 안됨. 날짜는 날짜끼리는 가능
-- 같은 형 으로  바꿔서 해주는 것이 좋음
select		EMPNO, ENAME, HIREDATE, SAL
from			emp
where		to_char(HIREDATE,'yyyy')='1981';



select * from CLASS4_INFO;

--현재날짜가 아닌  날짜를 추가할때
--날짜형식의 문자열을 추가하면 된다.
insert into
class4_info(num,name,input_Date) values(8,'양세찬','2018-10-21');
insert into
class4_info(num,name,input_Date)values (9,to_date('2018-10-21','yyyy-mm-dd'))'양세형','2018-10-22');


select to_char(input_date,'yyyy-mm')
from class4_info


--to_char는 날짜나 숫자를 입력받아야 한다.(함수의 값(인자)는
-- 데이터형을 구분한다.
--select      to_char('2018-10-25','mm') error
select   to_char(to_date('2018-10-25','yyyy-mm-dd')'mm')
from 	dual;


--숫자변환 : to_number('숫자형식의 문자열')
select		'25'-'10', to_number('25') -to_number('10')
from 		dual;


--------------------------------------------------------

--  조건함수 : decoda(갑, 비교값, 출력값,비교값,출력값,...비교값이 없을때 출력갑)

------------------------ ---------------------------------
-- 사원테이블에서 사원번호, 사원명, 연봉, 부서명
-- 단 부서명은 아래의 표에 해당하는 부서명으로 출력합니다.
-- 10- 개발부, 20- 유지보수부, 30-품질보증부 그외는  탁구부로 출력


select       empno,ename, sal, deptno,
decode		(deptno,10,'개발부',20,'유지보수부',
				30,'품징보증','탁구부')dname
from  		emp;



--사원번호, 사원명, 보너스,부서번호, 인센티브 조회
--단, 인센티브는 부서별로 아래의 표와 같이 차등지급
--10 -년봉의 20%, 20 - 연봉의 50%,   30  - 연봉 30% 그 외 연봉 5%

select		EMPNO, ENAME, SAL  , DEPTNO,
decode		(DEPTNO,10,sal*0.2,20, sal*0.5,30,sal*0.3,
				sal*0.1) incen
from 		emp;


--case
--사원번호, 사원명, 연봉 ,부서번호, 인센티브 조회
--단, 인센티브는 부서별로 아래의 표와 같이 차등지급
--10 -년봉의 20%, 20 - 연봉의 50%,   30  - 연봉 30% 그 외 연봉 5%
select		EMPNO, ENAME, SAL, DEPTNO,
                case deptno when 10 then '개발부'
									when  20  then '유지보수부'
									when 30 then '품질보증부'
									else '탁구부'
									end     dname
from emp;



select		EMPNO, ENAME, COMM, DEPTNO,
				CASE DEPTNO WHEN 10 THEN SAL+nvl(comm,0)+5sal*0.2
										WHEN 20 THEN SAL+nvl(comm,0)+5sal*0.5
                           				WHEN 30 THEN SAL+nvl(comm,0)+5sal*0.3
										END   INCEN
from emp;




select  			EMPNO, ENAME, COMM, DEPTNO,
				CASE DEPTNO WHEN 10 THEN SAL*0.2
				END   INCEN
from emp;

--------------------------------------------

select   	EMPNO, ENAME, COMM, DEPTNO,
decode		(deptno,10,sal*0.2)   insen
from 		emp;

--사원 테이블에서 사원번호, 사원명, 직무를 조회
-- 단, 직무의 첫 글자가  'C'-파리목숨, 'S' - 돈벌어다 주는 사람
--'M'-감시인 ,'A'- 살펴보는 사람, 'P' - 두목님
-- 대소문자 맞춰서 쓸것.     
                               

select	 	empno, ENAME, JOB,
				decode(substr(job,1,1),'C','소모품',
				'S','돈 벌어다 주는 사람','M','감시인',
				'A','살펴보는사람','두목님')
from emp;



