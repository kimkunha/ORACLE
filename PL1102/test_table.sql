-- table : �ε����� ������,  ���������� ���� �����ϰ� ����ϴ� ��������
set serveroutput on

declare
   -- 1. ���̺� �������� ����( ���̺��� ���� ���������� ��������)
     type num_tab is table of number index by binary_integer;
     type varchar2_Tab is table of varchar2(60) index by binary_integer;
   -- 2. ������ ���̺������������� ���̺� ���� ����
   	age_arr num_tab;
          --������ ���� X
 	name_arr varchar2_tab;

 	total_age number;
 	i number;
begin
    -- 3. �� �ֱ� : �ε��� ���
    dbms_output.put_line('table���� �� �߰� �� ���� ����'||age_arr.count);
    age_arr(1):=20;
	age_arr(2):=25;
	age_arr(3):=27;
	age_arr(4):=26;
    dbms_output.put_line('table���� �� �߰� �� ���� ����'||age_arr.count);

    total_age :=0;
    For i in 1 .. age_arr.count loop
     	dbms_output.put_line('age_arr('||i||') = '||age_arr(i));
     	total_age := total_age+age_arr(i);
    end loop;
	dbms_output.put_line('�� ���� : '||total_age);
	dbms_output.put_line('��� ���� : '||
	trunc(total_age/age_arr.count,1));

    name_arr(1) := '���ü�';
    name_arr(2) := '������';
    name_arr(3) := '������';
    name_arr(4) := '������';
    name_arr(5) := '����ö';

    i:=1;
    while   i <= name_arr.count loop
    	if name_arr(i) ='������' then
    		dbms_output.put_line( '����');
    	end if;
   			dbms_output.put_line( name_arr(i) );
   			i:= i+1;
    end loop;

end;
/