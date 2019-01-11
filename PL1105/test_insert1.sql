--  사원번호, 사원명, 연봉을 사용자에게 입력받아 cp_emp2테이블에
-- 추가하는 PL/SQL 작성
-- 단, 연봉이 5000 이상 입력되면 9000으로 변경하여 추가
-- 입사일은 추가되는 시점의 날짜로 추가 한다.

set verify off
set serveroutput on

accept empno prompt '사원번호 : '
accept ename prompt '사원명 : '
accept sal prompt ' 연봉 : '


declare
    empno cp_emp2.empno%type;
    ename cp_emp2.ename%type;
    sal number := &sal;
begin
          empno := &empno;
          ename := '&ename';

          if sal > 9000 then
          	 sal := 9000;
          end if;
		 -- 값을 제어한 후에 SQL문을 수행한다.
--쿼리시작
		insert  into cp_emp2(empno, ename, hiredate, sal)
		values(empno,ename,sysdate,sal);
--empno,ename은 변수에 들어가서 컬럼명으로하면됨
         commit;
         dbms_output.put_line(empno||'번 사원의 연봉을 '||
         sal||'로 입력 하였습니다.');
--insert는 성공이거나 예외

end;
/

