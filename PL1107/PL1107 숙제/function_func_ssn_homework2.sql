--2.  �ֹι�ȣ�� �Է¹޾� ����(���� -M, ����-F)�� ��ȯ�ϴ� �Լ� �ۼ�.
--   ������ 880101-x111111 ����-Ȧ��, ���� - ¦��    
create or replace function func_ssn (ssn char) return char
is
	result_msg char(6);
	check_ssn char(1) := substr(ssn,8,1);
	
begin
			if 	   check_ssn in (1,3,5,7) then
			 result_msg := '����';        
			 elsif  check_ssn in(2,4,6,8) then
			  result_msg := '����';               
			  else 
			   result_msg := '����';
			  end if;   
			  
			return result_msg;
end;
			  