-- 최소 0번 수행, 최대 조건까지 반복수행 while
set serveroutput on
declare
	--LOOP와 마찬가지로 변수가 있어야됨--
	i number;

begin
    -- 1에서 부터 10까지 1씩 증가하여 값을 출력 while
         i :=1; 
         -- 조건식
         while i <=10 loop       -- i < 11도 가능
         -- 반복수행 문장
            dbms_output.put_line( i );
         -- 증가식, 감소식 - 조건에 도달하여 반복을 멈추기 위해
         i := i+1;
         end loop;
         
              dbms_output.put_line('....................................................................');
              
      -- 0 ~ 100사이의 홀수만 출력하는 while
      i:=1;
      while i < 101 loop                    --2가지 방법 if문 사용과    i:=i+2; 써서 만들수 있다
      	--if mod(i,2) =1 then
      dbms_output.put_line(i);
      --end if;
      -- i :=i+1; 
      i:=i+2;
      end loop; 


end;
/