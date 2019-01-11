--���� .

/*1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������ 
   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� ��4Ű�θ���
  100���� ��� �� �ΰ��ȴ�.  
  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
  ������. 
 1, ������, ����� ������ ���ﵿ, 5Ű��, ����
  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ����

   ���
   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, �⺻���, �ѿ��    
*/

set serveroutput on

declare
type metro_record is record( num number,name varchar2(30), ssn varchar2(90),
												km number(3), metro varchar2(10));
												
   type metro_table is table of metro_record index by binary_integer;      

             bus_table metro_table;

begin   
           bus_table(1).num :=1;
           bus_table(1).name :='������';
           bus_table(1).ssn := '����� ������ ���ﵿ';
           bus_table(1).km := 5;
           bus_table(1).metro :='����';
                                 
           bus_table(2).num :=2;
           bus_table(2).name :='����ö';
           bus_table(2).ssn := '��õ�� ������ ������';
           bus_table(2).km := 20;
           bus_table(2).metro :='����ö';
                                  
           bus_table(3).num :=3;
           bus_table(3).name :='������';
           bus_table(3).ssn := '��õ�� ���� ����';
           bus_table(3).km := 16;
           bus_table(3).metro :='����ö';
                                            
           bus_table(4).num :=4;
           bus_table(4).name :='�ڿ���';
           bus_table(4).ssn := '����� ���Ǳ� ��õ��';
           bus_table(4).km := 10;
           bus_table(4).metro :='����ö';
                                                             
           bus_table(5).num :=5;
           bus_table(5).name :='���ü�';
           bus_table(5).ssn := '����� ���빮�� ���빮��';
           bus_table(5).km := 8;
           bus_table(5).metro :='����';

  
  
  
  
  dbms_output.put_line('��ȣ  �̸�   �ּ�  �Ÿ�   �������  �⺻���   �ѿ��');
  dbms_output.put_line('===========================================================');



	for i in 1 .. bus_table.count loop
			
	
	      dbms_output.put_line(bus_table(i).num||'     '||
    	bus_table(i).name||'     '||bus_table(i).ssn||'     '||
    	bus_table(i).km||'     '||bus_table(i).metro);   
    	end loop;
    
	
	