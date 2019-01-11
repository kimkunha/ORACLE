set serveroutput on


declare

begin
           for i in 1 .. 10 loop
       		 dbms_output.put_line('i = '|| i+1);
        end loop; 



end;
/
