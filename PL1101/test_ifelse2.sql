-- �����, ��ǰ��, ������ �Է� �޾� ó���ϴ� PL/SQL �ۼ�
-- ����� ������� 'Ư�� OR �Ϲ�' �� ��쿡�� ������ ����
-- Ư������ ��ǰ������ ��ǰ���� 50% �Ϲݰ��� ��ǰ������ 
-- ��ǰ���� 30%�� ����Ͽ� ���

set verify off
set serveroutput on

accept grade prompt '����� : '
accept item_name prompt '��ǰ�� : '
accept price prompt '���� : '
 
declare
	grade varchar2(30) := '&grade';
	item_name varchar2(60) :='&item_name';
	price number := &price;
    sale number :=0.3;
	
begin 
      if	grade in ('Ư��', '�Ϲ�')  then               -- ���⼭ ���� iF������ ����
      
      if grade = 'Ư��' then                                      --���⼭ IF ELSE�� ����
      sale := 0.5;
      
      else
      sale :=0.3;
      
  end if;    																			--  ���� IF ������ END IF
              dbms_output.put_line(grade||'���� �����Ͻ� ��ǰ'||
      			item_name||'�̰� ����'||price||'�� �̸� ���ΰ�'||
      			(price-price*sale));                                       
      																
    
    end if;                                                        -- IF ELSE ������ END IF
      
 																		
      
end;                                     
/      
 
 
