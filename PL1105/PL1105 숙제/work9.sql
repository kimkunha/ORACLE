--����
--1.���� ���� �Է¹޾� car_model ���̺��� ���, ����, �ɼ�,�Է��� ��ȸ.
--���
-- xxxx�� �˻� ���
-- -----------------------------------------
-- ���    ����    �Է���            �ɼ�
-- -----------------------------------------
-- 2010  1.990  ��-��-�� �б�   ó�� , ������
-- 
---------------------------------------------
--�˻� ��� [x]��
--
-- 
--���� 2�ڸ��� ��ȸ,
--������ �������� �����Ͽ� ��ȸ
--(Ŀ��, ���ڵ�� ���̺��� ��� ����Ͽ� ���)   

set serveroutput on
set verify off
	accept model prompt '��:  ';
declare
	cursor cur_car is
		select car_year, to_char(price,'9,999') , to_char(hiredate,'mm-dd-yy q') , substr(car_option,1,instr(car_option,',')-1)
		from car_model
		where model='&model'
		order by price;
	type rec_car is record(car_year car_model.car_year%type, price varchar2(10) ,hiredate varchar2(20),car_option car_model.car_option%type );     
     type tab_car is table of rec_car index by binary_integer;
     arr_car tab_car;
     car_data rec_car;
     i number :=0;
begin 
	if cur_car%isopen then
		close cur_car ;
	end if;
	open cur_car;
	
	loop
		fetch cur_car into car_data;
		
		exit when cur_car%notfound;
		i:=i+1;
		arr_car(i):=car_data;
	end loop;
     if i!=0 then 
     	dbms_output.put_line('&model'|| '�� �˻� ���');
     	dbms_output.put_line('-------------------------------------------');
     	dbms_output.put_line(' ���    ����   �Է���    �ɼ�'); 
     	dbms_output.put_line('-------------------------------------------'); 
     	for idx in 1..arr_car.count loop 
     	dbms_output.put_line(arr_car(idx).car_year||' '||arr_car(idx).price||' '||arr_car(idx).hiredate||' '||arr_car(idx).car_option);
     	end loop;
          dbms_output.put_line('-------------------------------------------'); 
          dbms_output.put_line('�˻� ��� ['|| cur_car%rowcount||' ]��');
	else
		dbms_output.put_line('-------------------------------------------'); 
		dbms_output.put_line('&model'|| '�� �˻������ �����ϴ�');
	end if;
          close cur_car;


end;
/