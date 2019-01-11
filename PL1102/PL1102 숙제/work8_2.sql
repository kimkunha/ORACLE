/*
 ���� 2.   
  �л����� ������ ó���ϴ� PL/SQL�ۼ�.
   ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� �� ������ ���ִ� record��
  ����� �Ʒ��� �����͸� �Է��� �� 
  �ݺ����� ����Ͽ�  ����,����� ó���ϴ� PL/SQL �ۼ�   
 1, ������, 80,81
  2, ����ö, 94,80
  3, ������, 97,96
  4, �ڿ���, 86,92
  5, ���ü�, 76,99

 ��� 
   ��ȣ, �̸�, ����Ŭ����,�ڹ�����,����,��� 
  .
  .
  .
  �ڹ��ְ����� [xx] ����Ŭ �ְ����� [xxx]

*/  
set serveroutput on

declare
	type class4_record is record(num number(4),name varchar2(30), 
	oracle_score number(4),java_score number(4));
	type class4_table is table of class4_record index by binary_integer;
     class4_tab class4_table;
     total_score number :=0;
     n_total_score number:=0;
    
begin
    	class4_tab(1).num := 1;
    	class4_tab(1).name := '������';
     class4_tab(1).oracle_score := 80;
    	class4_tab(1).java_score := 81;
    	
    	class4_tab(2).num := 2;
    	class4_tab(2).name := '����ö';
     class4_tab(2).oracle_score := 94;
    	class4_tab(2).java_score := 80;
    	
    	class4_tab(3).num := 3;
    	class4_tab(3).name := '������';
     class4_tab(3).oracle_score := 97;
    	class4_tab(3).java_score := 96;
    	
    	class4_tab(4).num := 4;
    	class4_tab(4).name := '�ڿ���';
     class4_tab(4).oracle_score := 86;
    	class4_tab(4).java_score := 92;

     class4_tab(5).num := 5;
    	class4_tab(5).name := '���ü�';
     class4_tab(5).oracle_score := 76;
    	class4_tab(5).java_score := 99;
    	
    	dbms_output.put_line('��ȣ     �̸�       ����Ŭ����    �ڹ�����    ����      ���');
  	dbms_output.put_line('=========================================================='); 
  	
  	for i in 1 .. class4_tab.count loop
  		n_total_score:=0;
  		n_total_score:=class4_tab(i).java_score+class4_tab(i).oracle_score;
  		dbms_output.put_line(class4_tab(i).num||'        '||class4_tab(i).name||'          '
  						||class4_tab(i).oracle_score||'          '||class4_tab(i).java_score||'          '
  						||n_total_score||'          '||n_total_score/2);
  		 total_score := total_score+n_total_score;
  	end loop;
  	dbms_output.put_line('=========================================================='); 
  	dbms_output.put_line(' ����['|| total_score||'],���['||total_score/class4_tab.count||']');
end;
/

    	