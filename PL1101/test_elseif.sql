-- 다중 IF ( else ~ IF)
-- 점수를 입력받아 점수가 0보다 작은 경우 '0보다 작아 실패' 
-- 100보다 큰 경우 '100보다 커서 실패' / 그렇지 않은 경우 '성공'

--PL/SQL 작성
set serveroutput on
set verify off

accept score prompt '점수입력 :'

declare
	score number := &score;
	
begin
         dbms_output.put(score);

		if score < 0 then
		   dbms_output.put_line('점은 0보다 작아서 실패');
		elsif score > 100 then
		   dbms_output.put_line('점은 100보다 커서 실패');
		else
		   dbms_output.put_line('점은 입력 성공 o(^^O)(O^^)o');
		end if; 




end;
/
