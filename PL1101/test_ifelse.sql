-- �̸��� �Է¹޾� '������' �̸� '����'�� ����ϰ� �׷��� ������
-- '���' �� ����� �� �Է��� �̸��� ����ϴ� PL/SQL �ۼ�

set serveroutput on
set verify off

accept name prompt ' �̸� �Է� : '

declare
      name varchar2(30) :='&name';   
      
begin
    if name = '������' then
    dbms_output.put_line('����');
    else
	dbms_output.put_line('���'); 
	end if;
	
	dbms_output.put_line( name||'�� �ȳ��ϼ���.');
end;
/
