-- FOR : 시작과 끝을 한눈에 알수있고 1씩 증가 하는 반복문
set serveroutput on

				-- for문에서는--
declare   -- 변수를 안만들어도 괜찮다 --
		-- i number;
       	num number(1);
       	total number; 
		msg varchar2(100);
begin
  
      for i in 1 .. 10 loop
       		 dbms_output.put_line('i = ' ||i);
      end loop;
        --FOR의 index를 저장하는 변수는 declare 에서 선언된 변수를
        -- 사용하지 않는다.
        --dbms_output.put_line('for 종료후 i' ||i);
 dbms_output.put_line('=========================================');
		-- 1~9까지 1씩 증가하는 for를 작성하여 출력  */
       num:=2;
         for i in 1 .. 15 loop                                                --  더하기는 괄호 치면 된다..
         	dbms_output.put_line(num||' * '||i||' ='||(num - i));
           	end loop;

 							-- 1~ 100까지의 합  출력 : 5050 (누적합)
							-- 1+2+3+4+5...+ 00

          total:=0;
           	for idx in 1 .. 10 loop                            
           	    total := total*idx;
           	end loop;
           	dbms_output.put_line('1~100까지의 합'|| total);

 
      	dbms_output.put_line('.............................................');
       -- 바깥 for의 인덱스는 단 을 사용.
           	for i in 2 .. 9 loop
           	 dbms_output.put_line(i||'단 시작');
           	 -- 안쪽 for
           	 for j in 1 .. 9 loop
           	     dbms_output.put_line(i||'*'||'='||i*j);
           	     end loop;

           	 dbms_output.put_line(i||'단 끝');
           	end loop;
               dbms_output.put_line('.............................................');      
               
      
               msg := '오늘은 금요일 입니다 .';
                   --for를 사용하여 글자 한자씩 잘라내서 출력
                   for i in 1 ..  length(msg) loop
                   dbms_output.put_line(substr(msg,i,1));
                   end loop;     
                   
          dbms_output.put_line('.............................................');             
                        
    
          msg := '오늘은 금요일 입니다. 수고여';
                   -- for를 사용하여 글자 한자씩 잘라내서 출력  
                   -- reverse를 사용하면 반복되는 인덱스를 거꾸로 사용한다.
                   for i in reverse 1 ..  length(msg) loop
                   dbms_output.put_line(substr(msg,i,1));
                   end loop;     
                                
                   
                   
*/

end;
/


