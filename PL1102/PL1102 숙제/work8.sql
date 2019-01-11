--1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
--   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������ 
--   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� ��4Ű�θ���
--  100���� ��� ���ΰ��ȴ�.  
--  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
--  1, ������, ����� ������ ���ﵿ, 5Ű��, ����
--  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
--  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
--  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
--  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ���� 
--���
--   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, �⺻���, �ѿ�� 
set serveroutput on

declare
	type class4_record is record(num number,name varchar2(30),addr varchar(300),km number, sudan varchar(15));
	type class4_table is table of class4_record index by binary_integer;
     class4_tab class4_table;
     price number:=0;
     sumprice number:=0;
     j number :=0;
begin
    	class4_tab(1).num := 1;
    	class4_tab(1).name := '������';
    	class4_tab(1).addr := '����� ������ ���ﵿ';
    	class4_tab(1).km := 5;
    	class4_tab(1).sudan := '����';
    	
    	class4_tab(2).num := 2;
    	class4_tab(2).name := '����ö';
    	class4_tab(2).addr := '��õ�� ������ ������';
    	class4_tab(2).km := 20;
    	class4_tab(2).sudan := '����ö';
    	
    	class4_tab(3).num := 3;
    	class4_tab(3).name := '������';
    	class4_tab(3).addr := '��õ�� ���� ����';
    	class4_tab(3).km := 16;
    	class4_tab(3).sudan := '����ö';
    	
    	class4_tab(4).num := 4;
    	class4_tab(4).name := '�ڿ���';
    	class4_tab(4).addr := '����� ���Ǳ� ��õ��';
    	class4_tab(4).km := 10;
    	class4_tab(4).sudan := '����ö';
    	
    	class4_tab(5).num := 5;
    	class4_tab(5).name := '���ü�';
    	class4_tab(5).addr := '����� ���빮�� ���빮��';
    	class4_tab(5).km := 8;
    	class4_tab(5).sudan := '����';
    	
    	dbms_output.put_line('��ȣ, �̸�,               �ּ�,          �Ÿ�,      �������,  �⺻���, �ѿ�� ');
    	for i in 1 .. class4_tab.count loop
    			if class4_tab(i).km <= 10 then 
    			     if class4_tab(i).sudan ='����' then 
    			     	price := 1200;
    		     		sumprice := price;	
    		     	elsif class4_tab(i).sudan ='����ö' then
    		     		price := 1250;
    			     	sumprice := price;		
    		     	end if;
    		     	
    		     elsif  class4_tab(i).km between 14 and 17 then
    		          if class4_tab(i).sudan ='����' then 
    			     	price := 1200;
    		     		sumprice := price+100;	
    		     	elsif class4_tab(i).sudan ='����ö' then
    		     		price := 1250;
    			     	sumprice := price+100;		
    		     	end if;
    		     elsif  class4_tab(i).km between 17 and 21 then
    		          if class4_tab(i).sudan ='����' then 
    			     	price := 1200;
    		     		sumprice := price+200;	
    		     	elsif class4_tab(i).sudan ='����ö' then
    		     		price := 1250;
    			     	sumprice := price+200;		
    		     	end if;
    		     
    		     end if;
    		     dbms_output.put_line(class4_tab(i).num ||'     '|| class4_tab(i).name ||'    '|| class4_tab(i).addr || 
    		     				'    '||class4_tab(i).km||'km       '|| class4_tab(i).sudan||'       '||price||'       '||sumprice);	 
    		 	
    	end loop;

end;
/

