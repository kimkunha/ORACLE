--숙제.
/*
1. 혈액형을 입력받아 혈액형별 특징을 출력 하는 PL/SQL작성.
   -혈액형은 대소문자 모두 비교 가능 해야한다.
   -'A' : 내향적이다. 조심스럽고, 세심하다
   -'B' : 자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.
   -'AB' : 합리적이다. 합리적인 반듯함을 선호하게된다.
   -'O' :  한결같은 노력과 추진력이 있다. 동료의식이 강하다
*/

set serveroutput on
set verify off

accept  blood prompt ' 혈액형 : '

declare
       blood varchar2(3) := '&blood';



begin
     if blood in ('A','a') then

     dbms_output.put_line('내향적이다. 조심스럽고, 세심하다.');

      elsif blood in ('B','b') then
              dbms_output.put_line('자기중심적이다. 규율이나 규칙, 속박을 극히 싫어한다.');
      elsif blood in ('AB','ab') then
            dbms_output.put_line  ('합리적이다. 합리적인 반듯함을 선호하게된다.');
      elsif blood in ('O','o') then
            dbms_output.put_line   ('한결같은 노력과 추진력이 있다. 동료의식이 강하다');



            end if;


end;
/







/*
2. 점수를 입력받아서
    100~90 사이면 'A'학점
     89~80 사이면 'B'
    79~70 사이면 'C'
    69~60 사이면 'D'
    그외 라면 '노력을 요함' 을 출력하는  PL/SQL을 작성하세요.


3. 이름을 입력받아 성과 이름을 출력하는  PL/SQL을 하세요.
    이름의 글자수가 3자 이하라면 '단성'으로 판단하고 4자 이상이라면
    '복성' 이라고 판단한다.
    단성- 성이 하나인 성 (예: 김,이,오,박),
    복성 - 성이 두개인성 (예 : 선우용녀, 재갈공명 등)
    출력은  성: 김  이름 : 희철


4. 교통수단을 입력받아, '택시','버스','지하철' 인 경우에만
  아래와 같은 요금으로 한달 교통비를 산정하세요.
   택시 : 3800 -
   버스 : 1200
   지하철 :1250원
 출력 : 출퇴근에 사용하는 교통수단은 'XX'이고 기본 요금: xx 원입니다.
      왕복요금은 xx원이고, 한달 20일 기준 교통비는 xx원 입니다.
    택시, 버스, 지하철이 아니라면  '대중교통이 아닙니다.' 를 출력하세요.

*/



