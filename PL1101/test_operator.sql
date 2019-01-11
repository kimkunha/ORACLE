-- 외부값 입력 받기
set serveroutput on
set verify off

accept name prompt '이름입력 : '
accept age prompt '나이입력 : '

declare
		name varchar2(90);
		age number;
		birth number;
		
begin
		-- 입력된 값을 변수에 할당
		-- 입력 값이 문자열인  경우에는 '로 묶어서 사용한다.
  				name :='&name';           -- 문자열이라' '해줌
                age :=&age;          --숫자라 ' ' 묶을필요없다.
               

         dbms_output.put_line('이름 : '||name||'님 나이는 '||
         age||'살입니다.');


          -- 태어난해 출력 : xx살 태어난해 xxxx년생
          birth :=to_Char(sysdate,'yyyy') -age +1;
          dbms_output.put_line(age||'살 태어난해'||birth||'년생');
         
         /*
            -- 문자열은 연산이 안된다.
           birth :=to_Char(sysdate,'yyyy') -age +1;
         dbms_output.put_line(age||'살 태어난해'||
        to_Char(sysdate,'yyyy') -age +1||'년생');        --이렇게는 사용안됨--
*/
                                  
                                                            
         /*   
          -- || 사이에  있는 값을 연산 시킬려면 || 보다 먼저 수행되도록 ( ) 붙인다.       -이렇게는 가능--                                  
         birth :=to_Char(sysdate,'yyyy') -age +1;
          dbms_output.put_line(age||'살 태어난해'||
          (to_Char(sysdate,'yyyy') -age +1)||'년생'); 
             */                                    
                                             
          --산술 연산자가 아닌 연산자의 결과를 출력할 수 없다.
          -- dbms_output.put_line(age >10);


end;                                                        
/
