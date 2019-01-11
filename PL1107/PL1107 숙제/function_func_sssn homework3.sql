/*
3. �ֹι�ȣ�� �Է¹޾� ��������� ��ȯ�ϴ� �Լ� �ۼ�
   ���������  880101-1xx1111 ���� xx ���ڸ� �̰�
   �Ʒ��� ǥ�� ����.
  	����� : 00~08
	�λ�� : 09~12
	��õ�� : 13~15
	��⵵ : 16~25
	������ : 26~34
	��û�� : 35~47
	���� : 48~66
	��� : 67~92
	���ֵ� : 93~95
*/


create or replace function   func_sssn(ssn char)return char
is

		check_ssn number(2) := substr(ssn,9,2);
		result_msg char(9);

begin
		if   check_ssn between 0 and 8 then
		       result_msg :='�����';
		elsif   check_ssn between 09 and 12 then
		       result_msg :='�λ��';  
		       	elsif   check_ssn between 13 and 15    then
		       result_msg :='��õ��';     
		       	elsif   check_ssn between 16 and 25  then
		       result_msg :='��⵵';     
		       	elsif   check_ssn between 26 and 34    then
		       result_msg :='������';     
		       	elsif   check_ssn between 35 and 47   then
		       result_msg :='��û��';     
		       	elsif   check_ssn between 48 and 66   then
		       result_msg :='����';     
		       elsif   check_ssn between 67 and 92   then
		       result_msg :='���';           
		       else
		       result_msg := '���ֵ�';   
		       end if;                      
		       
		       return result_msg;

end;
/
		       
		
		          