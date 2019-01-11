--null 변환
--레코드를 추가할때 컬럼을 명시하지 않으면 null이 입력
-- char,varchar2인경우  : 컬럼을 명시하지 않거나, "인경우
-- number,date : 컬럼을 명시하지 않은 경우 ,
select * from emp ;


--사원테이블에서 사원명, 연봉, 보너스 조회
-- 단 , 보너스가 없는 사원들은 100으로 출력
-- nvl(comm,100)  <-- 이렇게 함     숫자에 문자열로 하면 괜찮,
-- nvl(comm,100원)  이렇게는 안됨  형식이 넘버형이라 그렇슴
select 	 ename, sal, nvl(comm,100)
from      emp;

-- 우편번호테이블에서 입력한 동의 우편번호, 시도, 구군, 동, 번지
-- 조회, 번지가 없다면 '번지없음'으로 출력

select  		lower(ZIPCODE), SIDO, GUGUN, DONG,
				nvl(BUNJI,'번지없음')
from   		zipcode
where   	dong like '역삼1동%';


--class4_info테이블에서 번호, 이름, 입력일 조회
--단, 입력일이 없다면 현재날짜를 출력하세요.


select  NUM, NAME ,nvl(INPUT_DATE,sysdate)
from    CLASS4_INFO;


