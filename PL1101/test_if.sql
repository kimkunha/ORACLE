-- ���� IF : ���ǿ� �´� ��쿡�� �ڵ带 �����ؾ� �Ҷ�.
-- �̸��� �Է¹޾� �̸��� '������'�̶�� �̸� ��� ����
-- '��õ�� �ڶ�' �� ����� ��. �ٸ� �̸��� �̸��� ���

set serveroutput
set verify off

accept 	name	prompt'�̸� �Է� : '
declare
        --name varchar2(30)  --�̷��� �ص��� ���� ����
			name	TABLE_PRIMARY.name%type := '&name';

begin

					if name = '������' then
				    dbms_output.put('��õ���� �ڶ�');
				    end if;

          		dbms_output.put_line(name||'�� �ȳ��ϼ���?');


end;
/
