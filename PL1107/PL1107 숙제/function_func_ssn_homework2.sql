--2.  주민번호를 입력받아 성별(남자 -M, 여자-F)을 반환하는 함수 작성.
--   성별은 880101-x111111 남자-홀수, 여자 - 짝수    
create or replace function func_ssn (ssn char) return char
is
	result_msg char(6);
	check_ssn char(1) := substr(ssn,8,1);
	
begin
			if 	   check_ssn in (1,3,5,7) then
			 result_msg := '남자';        
			 elsif  check_ssn in(2,4,6,8) then
			  result_msg := '여자';               
			  else 
			   result_msg := '에러';
			  end if;   
			  
			return result_msg;
end;
			  