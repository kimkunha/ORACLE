-- selcet가 여러행을 조회하거나, 한행을 조회할때 예외처리
-- 사원번호를 입력받아  cp_emp3테이블에서 해당 사원의
-- 사원명, 부서번호, 직무, 연봉 조회 PL/SQL
set verify off
set serveroutput on
		accept empno prompt ' 사원번호 : '
		     
declare
        i_empno number := &empno;
        
        type rec_emp is record(
        ename cp_emp3.ename%type,
        deptno cp_emp3.deptno%type,
        job cp_emp3.job%type,
        sal cp_emp3.sal%type        
        );
        
        	emp_data	rec_emp;
begin
      select	ename,deptno,job,sal
      into		emp_data 
      from 	cp_emp3
      where  empno=i_empno;
      
      	dbms_output.put_line(emp_data.ename||'  '||
      	emp_data.deptno||'  '||emp_data.job||'  '||
      	emp_data.sal);
      	
      
      exception
       when others then 
      -- 모든 예외를 다 처리할 수 있다
      -- 최상위 예외이기 때문에 exception에서 가장 먼저 정의하게 되면
      -- 하위 예외처리 객체가 예외를 처리하기 전에 others가 처리하게 된다.   가장마지막에 정의하거나 하나만 할떄 사용
--      dbms_output.put_line(i_empno||'인식하지 못한 예외');
--      dbms_output.put_line(sqlerrm);
--      dbms_output.put_line(sqlcode);
           if sqlcode = 100 then
           dbms_output.put_line('사원정보가 조회되지 않습니다.');
           end if;
			
			if sqlcode = -1422 then
           dbms_output.put_line('사원번호로 여러명의 사원의 사원이 조회 됩니다.');
           end if;
--      when too_many_rows then
--      dbms_output.put_line(i_empno||'번 사원이 한건 이상 존재합니다.');
--      
--      when no_data_found then
--      dbms_output.put_line(i_empno||'번 사원이 존재하지 않습니다.');
--      
--     




end;
/