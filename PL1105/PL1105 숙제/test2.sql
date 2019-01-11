--  사원번호, 사원명, 연봉을 사용자에게 입력받아
-- 단, 연봉이 5000 이상이면  cp_emp3테이블에
-- 추가하고 5000 이하라면 cp_emp2테이블에  추가하는 PL/SQL 작성
-- cp_emp3 테이블에 추가되는 사원의 부서번호는 10번부서로
-- 추가하세요.

set verify off
set serveroutput on
 		accept empno prompt ' 사원번호은 ?'
 		accept ename prompt '  사원명 ?'
 		accept sal prompt ' 연봉은?'

declare
empno cp_emp3.empno%type;
ename cp_emp3.ename%type;
sal number;

 begin
 	empno:=&empno;
 	ename:= '&ename';
 	sal := &sal;

 	if sal>5000 then
 	insert into cp_emp3(empno,ename,sal,deptno) values(empno,ename,sal,10);
 	 dbms_output.put_line('연봉이 5000 이상이면  cp_emp3테이블에 추가');

 	else
 	insert into cp_emp3(empno,ename,sal) values(empno,ename,sal);
 	   dbms_output.put_line('연봉이 5000이하 이므로 cp_emp2에 추가 되었습니다');
 	    end if;

commit;





end;
/


select * from cp_emp2;
