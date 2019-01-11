/*
3. �Ʒ��� �����͸� ó���ϴ�  PL/SQL�ۼ�
    "�̸�, �ֹι�ȣ, ����, ����"�� ������ �� �ִ� ���̺���
    �����ϰ� �Ʒ��� �����͸� ä���.
   ������, 880101-1234567  ��         2018 - 20+�ֹι�ȣ +1   to_char(concat('20',substr(znum,1,2))) substr(znum,8,1);  ���糯¥-����+1=�������
   ����= ���糯¥-�������+1
   ����ö, 890101-1234567   ��
   ������, 011231-3234567    ��
   �ڿ���, 920101-2234567     ��
   ���ü�, 020420-4234567   	��
   ���� �����͸� ����Ͽ� 
   ��ȣ,�ֹι�ȣ,����, ������ �����ִ�  PL/SQL�� �ۼ��ϼ���.
*/

set serveroutput on

     
     

declare
	type class4_record is record(name varchar2(30),znum varchar2(14));
	type class4_table is table of class4_record index by binary_integer;
     class4_tab class4_table;
     age number;
     gender varchar2(6);
begin
    class4_tab(1).name := '������';
    class4_tab(1).znum :='880101-1234567';
    
    
    class4_tab(2).name := '����ö';
    class4_tab(2).znum :='890101-1234567';
    
    
    class4_tab(3).name := '������';
    class4_tab(3).znum :='011231-3234567';
    
    
    class4_tab(1).name := '�ڿ���';
    class4_tab(1).znum :='920101-2234567';
    
    
    class4_tab(4).name := '���ü�';
    class4_tab(4).znum :='020420-4234567'; 
    
    dbms_output.put_line('��ȣ   ,    �ֹι�ȣ   ,      ����   ,����   ');
    for i in 1 .. class4_tab.count loop
    
       if substr(class4_tab(i).znum,8,1) in('3','4') then
       	age := to_char(sysdate,'yy')-to_char(substr(class4_tab(i).znum,1,2));
       else 
       	age := to_char(sysdate,'yy')-to_char(substr(class4_tab(i).znum,1,2))+101;
       end if;
       if substr(class4_tab(i).znum,8,1) in('1','3') then
        	gender:= '����';	
       else
          gender:= '����';	
       end if;
       	dbms_output.put_line(class4_tab(i).name||'     '||class4_tab(i).znum||'     '||age||'     '||gender);	
    end loop;
end;
/