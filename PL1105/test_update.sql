-- PL/SQL 에서 update 사용
set serveroutput on

declare
	   cnt number;
begin
  
        update  cp_emp2
        set        sal=5000
        where    empno=7566;
       
       --암시적(묵시적) 커서 sql를 사용하여 변경한 행의 수를 얻는다.                                     
        cnt := sql%rowcount;
        -- 변경된 사원이 1명일때만 transcation를 완료하고 그렇지 않다면
        --작업을 취소    
        if cnt =1 then
	        dbms_output.put_line(cnt||'건 변경');
	        commit;
        else
            dbms_output.put_line('조회된 사원이 여러명이거나 없으므로  변경작업을 취소합니다.');
            rollback;
            end if;
            

--변수명과 컬럼명이 같으면 아무일도 안일어난다.


end;
/
 