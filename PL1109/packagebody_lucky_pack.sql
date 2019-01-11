-- 행운의 수 1 ~ 45 중 하나 얻는 함수
-- 귀인얻기 프로시저
create or replace package body lucky_pack
as
	-----lucky_num 시작 -----
	function lucky_num return number
	is
	begin
	  	return trunc(dbms_random.value(1,46));     
	end lucky_num;
	-----lucky_num 끝 -----
	
	
	-----lucky_name 시작 -----
	procedure lucky_name(name out varchar2)
	is   
		type name_tab is table of varchar2(30)
			index by binary_integer;

		name_arr name_tab;
									
		temp_num number;
	begin
		name_arr(1):='공선의';
		name_arr(2):='이봉현';
		name_arr(3):='백인재';
		name_arr(4):='김정윤';
		name_arr(5):='박소영';
		name_arr(6):='최혜원';
		name_arr(7):='이재찬';
		
			temp_num := trunc(dbms_random.value(1,name_arr.count+1));						
	        
		name := name_arr( temp_num);
	end lucky_name;
	-----lucky_name 끝 -----        
	
	    -----  create_ssn 시작 -----  
		procedure create_ssn(birth varchar2, gender varchar2,
		name varchar2, ssn out char)     
		is
		--주민번호를 저장할   테이블
			type ssn_tab is table of number(1)
				index by binary_integer;
			
			ssn_arr ssn_tab;	
			gender_num number :=2;
			temp_num number := 0;
			flag_num number :=2; 
			temp_ssn varchar2(5); 
			
			ssn_value varchar2(14);
		begin                  
			-- 입력받은 생년월일을 ssn_tab추가
			for i in 1 .. length(birth) loop
				ssn_arr(i) := substr(birth,i,1);
			end loop;                                
			
			-- 성별 채우기 1       
			if gender ='남자' then  
				gender_num := 1;
			end if;  
			

			
			ssn_arr(7) := gender_num;
			
			--나머지 번째 방 값을 채운다.
			--880101123456x
			for i in 8 .. 12 loop
				ssn_arr(i) := trunc(dbms_random.value(0,10),0);
			end loop;   
			
			-- 생성된 주민번호를 가지고 끝자리를 채우기 위한 연산
			for i in 1 .. ssn_arr.count loop
			   temp_num := temp_num + ssn_arr(i)* flag_num;
			   
			   flag_num := flag_num+1;
			   
			   if flag_num = 10 then
			   	flag_num :=2;
			   	end if;
			end loop;  
			
			--채워진값으로 끝 자리를 설정
			ssn_arr(13) := mod(11-mod(temp_num,11),10);
			
			ssn_value := birth||'-'||gender_num||ssn_arr(8)|| ssn_arr(9)||
			ssn_arr(10)||ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
		 
		    -- 생선된 주민번호를 class4_info에 추가
		    insert into class4_info(name,ssn)
		    values(name,ssn_value);
		    
		    ssn := ssn_value;
	
		    commit;
				
		end		create_ssn;
	        -----  create_ssn 끝 ----- 
	        
	        
	        
end lucky_pack;
	