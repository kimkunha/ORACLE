--���� ������ for �� ����Ͽ� Ǯ��
/*
����
1. ���� ���� �Է¹޾�  car_model ���̺���
 ������, ������,  ���,����,�ɼ�,�Է��� ��ȸ.
���
 xxxx�� �˻� ���
------------------------------------------------------
���    ����   �Է���             �ɼ�
-----------------------------------------------------
2010   1,990 ��-��-�� �б�    ó�� ,������

-----------------------------------------------------
�˻� ��� [ x ] ��


���� 2�ڸ��� ��ȸ,
������ �������� �����Ͽ� ��ȸ
(Ŀ��, ���ڵ�, ���̺��� ��� ����Ͽ� ���)
*/


set verify off
set serveroutput on

           accept model prompt ' �𵨸� : '

declare
		-- 1. ��ȸ�� ���� �����ϰ� ����ϱ� ���� record type ����
		type rec_car is record (country car_country.country%type,
								maker car_country.maker%type,
								car_year car_model.car_year%type,
								price car_model.price%type,
								car_option car_model.car_option%type,
								hiredate car_model.hiredate%type);
		 -- 2. ����� record��	������������ table ����
		 type tab_car is table of rec_car index by binary_integer;
		 -- 3.����� table�� ���� ����\
		 arr_car tab_car;

		 -- 4. ó�� ,������ ����ϱ� ���� �ɼ��� �����ϴ� ����
		  car_option car_model.car_option%type;

		 -- 5. ��ü �˻� ����� �����ϱ� ���� ����
            search_cnt number :=0;
          -- 7. �ε����� �����ϱ� ���� ����
          i number :=0;
begin

         dbms_output.put_line('--------------------------------------------------');
         dbms_output.put_line('������ ������	 ��� ����  �Է���  	 �ɼ�');
         dbms_output.put_line('--------------------------------------------------');

				--6. �˻��� ����� table�� ���� ( �ڵ�и�) - ����� ���̺� ����
               for	temp in
                (
                  select    cc.country, cc.maker, cmo.car_year, cmo.price,
                  				cmo.car_option, cmo.hiredate
                  from      car_country cc , car_maker cma, car_model cmo
                  where     (cma.maker = cc.maker and cmo.model=cma.model)
                  				and cmo.model ='&model'
                  order by	cmo.price

                 )
                 
               loop
               i := i+1;

               arr_car(i) := temp;

               end loop;
				search_cnt := i;
                -- ������ �����͸� ����Ͽ� ��� ������ ���������Ѵ�.

                for i in 1 .. arr_car.count loop
                       car_option :=  arr_car(i).car_option;  
                       
                       if instr(car_option,',') >0 then
                        car_option:= substr(car_option,1,instr(car_option,',')-1); 
                        end if;   
                
                dbms_output.put_line( arr_car(i).country||'  '||arr_car(i).maker||'  '||
                						arr_car(i).car_year||'  '||
                						to_char(arr_car(i).price,'9,999')||'  '||
                						to_char(arr_car(i).hiredate,'mm-dd-yy q')||'  '||arr_car(i).car_option);



                 end loop; 
                 dbms_output.put_line('-----------------------------');
                 dbms_output.put_line(' �˻� ���['||search_cnt||']��');
end;
/













