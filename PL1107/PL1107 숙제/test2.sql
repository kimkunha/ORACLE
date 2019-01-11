--2.  주민번호를 입력받아 성별(남자 -M, 여자-F)을 반환하는 함수 작성.
--   성별은 880101-x111111 남자-홀수, 여자 - 짝수    

create or replace function func_ssn (ssn char) return varchar2
is
		result_msg char(6);
		check_ssn char(2) := subtr(ssn,8,1);
begin
        	if	check_ssn := in (1,3)
        	      result_msg := '남자';
        	 else   check_ssn := in(2,4)
        	 result_msg := '여자';     
           end if;
          

end;
/		