/*����
1. ���� ���� �Է¹޾�  car_model ���̺���                                           --Ŀ���ۼ�, 
  ���,����,�ɼ�,�Է��� ��ȸ.
���
 xxxx�� �˻� ���
------------------------------------------------------
���    ����   �Է���             �ɼ�
-----------------------------------------------------
2010   1,990 ��-��-�� �б�    ó�� ,������ 

-----------------------------------------------------
�˻� ��� [ x ] �� 


���� 2�ڸ��� ��ȸ,
 ������asfasdfsaddf�������� �����Ͽ� ��ȸ 
(Ŀ��, ���ڵ�, ���̺��� ��� ����Ͽ� ���)
*/

set verify off
set serveroutput on
         
 accept model prompt ' �� : '
                                        
declare
     cursor cur_car is 
     select CAR_YEAR, to_char(PRICE,'9,999'), substr(car_option,1,instr(CAR_OPTION,',')-1),
     to_char(HIREDATE,'mm-dd-yy q')
     from CAR_MODEL
     where  model = '&model'
      order by price ;
      
     type rec_car is record(car_year car_model.car_year%type, price varchar2(600), CAR_OPTION varchar(4000),hiredate 
     varchar2(15));
     
     type tab_car is table of rec_car index by binary_integer;
     
     arr_car  tab_car ;
     car_data  rec_car;
     i number:= 0;        
      
begin

	if cur_car%isopen then
		close cur_car;
	end if; 
	open cur_car;
	
loop
fetch cur_car into car_data;
	
	exit when cur_car%notfound;
i := i+1;
arr_car(i):=car_data;
end loop; 
if i !=0 then   
dbms_output.put_line('&model'||'�� �˻� ���');
dbms_output.put_line( '�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�');
dbms_output.put_line( '���    ����   �Է���             �ɼ�');    
dbms_output.put_line( '�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�');
	for idx in 1..arr_car.count loop
		dbms_output.put_line(arr_car(idx).car_year||' '||arr_car(idx).price ||' '|| arr_car(idx).hiredate||' '||arr_car(idx).car_option );
	end loop;  
	dbms_output.put_line( '�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�');
	dbms_output.put_line('�˻� ��� [ '||i||' ] �� ');
else
 	dbms_output.put_line('&model'||'�˻� ��� ����');
 	
end if;

      close cur_car;

                       



end;
/
