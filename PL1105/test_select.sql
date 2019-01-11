--cp_emp2에서 사원번호가 7521인 사원의 사원명, 입사일, 연봉을
-- 조회하여 출력하는 PL/SQL 작성    -7521이 없으니 7566 함-

set serveroutput on  

declare
        ename cp_emp2.ename%type;
        input_Date varchar2(10);
        sal cp_emp2.sal%type;
begin
       select  ename,to_Char(hiredate,'yyyy-mm-dd') hiredate ,sal 
       into      ename, input_Date, sal
       from		cp_emp2
       where     empno=7566;
        
       dbms_output.put_line('조회결과 : '||ename||' / '||input_date||' / '||sal||' /'
       ||sql%rowcount);

       exception
       when others then
       dbms_output.put_line('문제발생');

end;
/
