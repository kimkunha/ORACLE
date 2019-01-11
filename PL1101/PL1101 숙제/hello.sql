-- set serveroutput on은 무조건 써야 출력이 됨
set serveroutput on
declare
       -- 변수선언

begin
		-- 코드 작성 
		-- Put_line은 출력후 줄을 변경
		dbms_output.put_line('안녕 PL/SQL');
		dbms_output.put_line('오늘은 목요일 '); 
		-- Put은 출력후 줄 변경을 하지 않는다. 
		dbms_output.put('내일은 금요일 ');                                  
		-- Put으로만 출력이 종료되면 출력내용이 출력되지 않는다. 그 아랫 문장이 _line으로 종료되면
		dbms_output.put_line('모레는 퇼');      -- 줄이 바뀌지 않은채 출력이 안된 문장과 같이 출력된다.    		
end;
/                 

-- 참고내용--
-- 먼저 도스창 들어가서 스캇 계정 접속--
-- 도스창에서 @치고 파일 붙여 넣어서 엔터 치면 위에 쓴 '안녕' 이 나온다.
-- set serveroutput on  이것이 없으면  도스창에 '안녕'이 안나온다.
-- /도 안넣으면 안나온다 하지만 도스창에 / 치면 그대로 '안녕'이 나온다.
-- Put 이렇게만 끝나면 도스창에 안나온다.