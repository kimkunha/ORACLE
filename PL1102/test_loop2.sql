-- 1 ~ 100까지 출력하는 loop
set serveroutput on

declare
       cnt number(3); 

begin
     
     -- 초기값
         cnt :=0;                                  			
          --1에서 부터 100까지 (짝수만 출력)         --시작이 1이라 초기값2로 할수 없음
          
                                                       			--종으로 나는게 싫으면 put으로 출력하고
     loop   
          cnt := cnt+1;
			--if mod(cnt,2)=0 then                      -- endloop; 밑에 dbms_output.put_line('끝');
         dbms_output.put_line(cnt);  
			-- end if; 
   											 --이런식으로 달아주면 된다.
         cnt := cnt+1;                -- 단순하게   cnt := cnt+1;  을 한번 더 써서 하는것도 가능
         exit when cnt>100;
	end loop;							-- endloop; 밑에 dbms_output.put_line('끝');
-- dbms_output.put_line('끝');   
end;
/
