set serveroutput on
 
declare
  num number(1);
  total number;	
begin    
			
           total:=1;
           	for idx in 1 .. 10 loop
           	    total := total*idx;
           	end loop;
           	dbms_output.put_line( total);
	
	
end;
/
	