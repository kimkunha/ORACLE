-- PL/SQL ���� update ���
set serveroutput on

declare
	   cnt number;
begin
  
        update  cp_emp2
        set        sal=5000
        where    empno=7566;
       
       --�Ͻ���(������) Ŀ�� sql�� ����Ͽ� ������ ���� ���� ��´�.                                     
        cnt := sql%rowcount;
        -- ����� ����� 1���϶��� transcation�� �Ϸ��ϰ� �׷��� �ʴٸ�
        --�۾��� ���    
        if cnt =1 then
	        dbms_output.put_line(cnt||'�� ����');
	        commit;
        else
            dbms_output.put_line('��ȸ�� ����� �������̰ų� �����Ƿ�  �����۾��� ����մϴ�.');
            rollback;
            end if;
            

--������� �÷����� ������ �ƹ��ϵ� ���Ͼ��.


end;
/
 