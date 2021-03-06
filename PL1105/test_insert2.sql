--  사원번호, 사원명, 연봉을 사용자에게 입력받아
-- 단, 연봉이 5000 이상이면  cp_emp3테이블에
-- 추가하고 5000 이하라면 cp_emp2테이블에  추가하는 PL/SQL 작성
-- cp_emp3 테이블에 추가되는 사원의 부서번호는 10번부서로
-- 추가하세요.
set verify off
set serveroutput on

	accept empno prompt '사원번호 : '
	accept ename prompt '사원명 : '
	accept sal prompt '연봉 : '

declare
  empno cp_emp2.empno%type := &empno;
  ename cp_emp2.ename%type := '&ename';
  sal cp_emp2.sal%type := &sal;


begin

     if sal>5000 then
          insert into cp_emp3(empno,ename,deptno,sal)
          values(empno,ename,10,sal);

          dbms_output.put_line('연봉이5000이상 이므로 cp_emp3  테이블에 추가');

     else
           insert into cp_emp2(empno,ename,hiredate,sal)
          values(empno,ename,sysdate,sal);

          dbms_output.put_line('연봉이5000이하 이므로 cp_emp2  테이블에 추가');
     end if;

     commit;






end;
/
