-- �ܺΰ� �Է� �ޱ�
set serveroutput on
set verify off

accept name prompt '�̸��Է� : '
accept age prompt '�����Է� : '

declare
		name varchar2(90);
		age number;
		birth number;
		
begin
		-- �Էµ� ���� ������ �Ҵ�
		-- �Է� ���� ���ڿ���  ��쿡�� '�� ��� ����Ѵ�.
  				name :='&name';           -- ���ڿ��̶�' '����
                age :=&age;          --���ڶ� ' ' �����ʿ����.
               

         dbms_output.put_line('�̸� : '||name||'�� ���̴� '||
         age||'���Դϴ�.');


          -- �¾�� ��� : xx�� �¾�� xxxx���
          birth :=to_Char(sysdate,'yyyy') -age +1;
          dbms_output.put_line(age||'�� �¾��'||birth||'���');
         
         /*
            -- ���ڿ��� ������ �ȵȴ�.
           birth :=to_Char(sysdate,'yyyy') -age +1;
         dbms_output.put_line(age||'�� �¾��'||
        to_Char(sysdate,'yyyy') -age +1||'���');        --�̷��Դ� ���ȵ�--
*/
                                  
                                                            
         /*   
          -- || ���̿�  �ִ� ���� ���� ��ų���� || ���� ���� ����ǵ��� ( ) ���δ�.       -�̷��Դ� ����--                                  
         birth :=to_Char(sysdate,'yyyy') -age +1;
          dbms_output.put_line(age||'�� �¾��'||
          (to_Char(sysdate,'yyyy') -age +1)||'���'); 
             */                                    
                                             
          --��� �����ڰ� �ƴ� �������� ����� ����� �� ����.
          -- dbms_output.put_line(age >10);


end;                                                        
/
