

-- �̸� ���̸� �Է� �޾� fef_tab ���̺��� �����Ͽ� ������
-- ����(record ����) �� ���� �Է��� �� �Ʒ��� ���� ����ϴ�
-- PL/SQL�� �����ϼ���.

-- ���) �̸� : xxx�� ���� : xx�� 
--  			(�۳⳪�� xx��, ���⳪�� : xx��)  


			
set serveroutput on
set verify off

declare
                Kh1 ruf_tab%rowtype;
                




begin
          




end;
/





















     




--������--

set serveroutput on 
set verify off                                      --set vertify off �� �ϸ� ���� ġ�°�.
accept name prompt '�̸��Է� : '
accept age prompt '�����Է� : '



declare
      -- ���� ���Ÿ� �̷������� ��� name ref_tab.name%type
      input_data ref_Tab%rowtype;
begin
     input_data.name := '&name';
     input_data.age := &age;        
     
     
         --(�۳⳪�� xx��, ���⳪�� : xx��)  
     dbms_output.put_line('�̸� : '||input_data.name||'�� ���� : '||
    									input_data.age||'��');   
     dbms_output.put_line('�۳� ���� '||(input_data.age-1)||
     									'��, ���⳪�� : '||(input_data.age+1)||'��');

end;
/


   






