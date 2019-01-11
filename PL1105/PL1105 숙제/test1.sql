--  사원번호, 사원명, 연봉을 사용자에게 입력받아 cp_emp2테이블에
-- 추가하는 PL/SQL 작성
-- 단, 연봉이 5000 이상 입력되면 9000으로 변경하여 추가
-- 입사일은 추가되는 시점의 날짜로 추가 한다.

set verify off
set serveroutput on

accept empno prompt ' 사원번호 : '
accept ename prompt ' 사원명 : '
accept sal prompt ' 연봉 : '

declare
	empno cp_emp2.empno%type;
	ename cp_emp2.ename%type;
	sal number;
begin    

    empno :=&empno;
    ename := '&ename';
    sal := &sal;
    
    if sal>5000 then
    sal :=9000;
    end if;
    
    insert into cp_emp2(empno,ename,sal,hiredate)
    values(empno,ename,sal,sysdate);
    commit;
    
    
     
 


end;
/