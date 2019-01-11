-- 문자열 함수 사용.
--길이  : length (문자열)
select  	'oracle길이'||length('oracle')||'자',length('테스트')
from 	 dual;


--사원 테이블에서 사원명, 사원명의의 글자수를 조회
select		ename, length(ename)
from emp;


--사원테이블에서 사원명이 4자인 사원의 사원명을 조회
-- select 이외에도 where절에도 가능. 어디든지 가능
--어제 배운 where 컬럼명 like  '____'; 말고 다른방법
-- 연산으로도 조회 가능 이상, 이하

select		ename
from  		emp
where  		length(ename)=4;


--대문자 : upper
select     	upper('Test'),upper('테스트AdcdE')
from  dual;


-- 소문자 : lower
select     lower('Test')
from dual;



--사원테이블에서 사원명이 'scott'인 사원의 사원번호, 사원명
-- 입사일, 연봉을 조회하세요.
-- 2가지 방법이 있음.
select EMPNO, ENAME , HIREDATE, SAL
from     emp
--where ename = 'SCOTT';
--where  ename=upper('scott');
where    lower(ename) = 'scott';


--사원테이블에서 사원명을 모두 소문자로 조회
select	lower (ENAME)
from emp;

--인덱스 열기 : instr(문자열, 찾을 문자열)
--대문자 소문자 맞춰서해야 조회 가능
 select		instr('AbcdeF','A') ,instr('AbcdeF','F'),
 				instr('AbcdeF','c'),instr('AbcdeF','k')
 from	dual;

select * from CLASS4_INFO;
insert into class4_info(num, name, email) values(6,'테스트'
,'test@kr');
select * from CLASS4_INFO;
insert into class4_info(num, name, email) values(7,'테스트1'
,'test.kr');
commit;

--학생 테이블에서 번호,이름, 이메일,이메일의 유효성 조회
select NUM , NAME, EMAIL ,instr(email,'@'),instr(email,'.')
from          CLASS4_INFO;

--문자열 자르기 : substr(문자열,시작인덱스,자를 글자수)
-- ( 안에 있는 문자를 숫자로 생각해서 처음부터 1로 시작)
select	substr('Abcdefg',4,3),substr('Abcdefg',2,6),
			substr('Abcdefg',1)
from	dual;



--class4_info 테이블에서 번호,이름,
--email컬럼의'메일주소'만 조회 하세요.  ex)test@test.com
-- test만을 컬럼   2)도메인 주소만 조회


select       NUM, NAME, substr(email,1,instr(email,'@')-1)
from	CLASS4_INFO;

--test@sist.co.kr
--메일 주소@도메인 주소

select num, name, substr(email, 1, instr(email, '@')-1)
from class4_info;

select num, name, substr(email, instr(email, '@')+1)
from class4_info;

select instr('ABCDe', 'e')
from dual;

select * from class4_info;

--공백제거  : 앞뒤 공백 제거 trim ,  앞공백 제거 : Ltrim
-- 뒷공백 제거 : Rtrim
--어떤 문장에 반복되는 문자도 삭제 가능   (L,Rtrim은 사용안됨)
--  '-' from 이런식으로 사용
select        '['||trim('   abc    ')||']'
, '['||ltrim('   abc    ')||']'  , '['||Rtrim('   abc    ')||']'
, trim('-' from '---------oracle---------------')
from   dual;



-- 첫 글자를 대문자로 : initcap('문자열')
-- ( ) 안에서 띄워쓰기를 하면 다음단어도 역시 대문자로 나옴
select      initcap('oracle java jsp jQuery SCOTT')
from   dual;



--컬럼명에다 써도 첫글자만 대문자로 나옴
select    initcap(ename)
from      emp;




--문자열 붙이기 : concat('문자열','붙일문자열')
select       concat('abc','def'), concat(concat('abc','def'),'ghi')
from     dual;


--문자열 채우기
--    왼쪽으로 채우기 : Lpad('문자열;, '총자릿수', '채울문자열')
select          lpad('abcde',7,'$')  ,lpad('abcdefg',10,0)
from     dual;


--오른쪽으로 채우기 : Rpad('문자열;, '총자릿수', '채울문자열')
select   rpad('abcdef',10,'가')  , rpad('ABC',10,'#')
from              dual;


