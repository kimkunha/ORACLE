--2.  �ֹι�ȣ�� �Է¹޾� ����(���� -M, ����-F)�� ��ȯ�ϴ� �Լ� �ۼ�.
--   ������ 880101-x111111 ����-Ȧ��, ���� - ¦��    

create or replace function func_ssn (ssn char) return varchar2
is
		result_msg char(6);
		check_ssn char(2) := subtr(ssn,8,1);
begin
        	if	check_ssn := in (1,3)
        	      result_msg := '����';
        	 else   check_ssn := in(2,4)
        	 result_msg := '����';     
           end if;
          

end;
/		