-- ���� IF ( else ~ IF)
-- ������ �Է¹޾� ������ 0���� ���� ��� '0���� �۾� ����' 
-- 100���� ū ��� '100���� Ŀ�� ����' / �׷��� ���� ��� '����'

--PL/SQL �ۼ�
set serveroutput on
set verify off

accept score prompt '�����Է� :'

declare
	score number := &score;
	
begin
         dbms_output.put(score);

		if score < 0 then
		   dbms_output.put_line('���� 0���� �۾Ƽ� ����');
		elsif score > 100 then
		   dbms_output.put_line('���� 100���� Ŀ�� ����');
		else
		   dbms_output.put_line('���� �Է� ���� o(^^O)(O^^)o');
		end if; 




end;
/
