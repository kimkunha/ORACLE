-- ����� �� 1 ~ 45 �� �ϳ� ��� �Լ�
-- ���ξ�� ���ν���
create or replace package lucky_pack
as
	-- ����� �� 1 ~ 45 �� �ϳ� ��� �Լ�
	function lucky_num return number;
	--���� ��� ���ν���
	procedure lucky_name(name out varchar2);   
	-- �������, ����, �̸��� �Է¹޾� �ֹι�ȣ�� �����Ͽ� 
	--out.parameter�� �����ϰ� class4_info���̺�
	-- �߰��ϴ� procedure �ۼ�  
	procedure create_ssn(birth varchar2, gender varchar2,
	name varchar2, ssn out char); 
									
	end;
	
