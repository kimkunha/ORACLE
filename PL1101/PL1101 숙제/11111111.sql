

-- 이름 나이를 입력 받아 fef_tab 테이블을 참조하여 생성한
-- 변수(record 변수) 에 값을 입력한 후 아래와 같이 출력하는
-- PL/SQL를 생성하세요.

-- 출력) 이름 : xxx님 나이 : xx살 
--  			(작년나이 xx살, 내년나이 : xx살)  


			
set serveroutput on
set verify off

declare
                Kh1 ruf_tab%rowtype;
                




begin
          




end;
/





















     




--정답지--

set serveroutput on 
set verify off                                      --set vertify off 로 하면 직접 치는것.
accept name prompt '이름입력 : '
accept age prompt '나이입력 : '



declare
      -- 각각 쓸거면 이런식으로 사용 name ref_tab.name%type
      input_data ref_Tab%rowtype;
begin
     input_data.name := '&name';
     input_data.age := &age;        
     
     
         --(작년나이 xx살, 내년나이 : xx살)  
     dbms_output.put_line('이름 : '||input_data.name||'님 나이 : '||
    									input_data.age||'살');   
     dbms_output.put_line('작년 나이 '||(input_data.age-1)||
     									'살, 내년나이 : '||(input_data.age+1)||'살');

end;
/


   






