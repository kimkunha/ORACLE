/*
����1.
�����縦 �ΰ� �Է¹޾� �����翡 �ش��ϴ� ��� ������
 ������, ������,�𵨸�,���,����,�ɼ��� ��ȸ �ϼ���.
 ����� ������ ������������ ��ȸ�Ͽ��� �� ��ȸ�� ����� 
   3~6��° ���ڵ常  ����ϼ���.

����, ��Ƹ� �Է��Ͽ��� ��

 ��� ��
-----------------------------------------------------------------
��ȣ ������  ������  �𵨸�  ���  ����   �Է��� 
-----------------------------------------------------------------
1     ����     ����    �ƹ���  2001  3,500 mm-dd-yyyy


-----------------------------------------------------------------
�˻� ��� ���� [x]��, ��� [x]��

�ƹ��� x��� �ҷ��� x��� �˻� ����� ���� ����� ī��Ʈ �մϴ�.

*/ 

set verify off
set serveroutput on
	accept maker prompt ' ������ : '
	accept maker prompt ' ������ : '
	
declare										-- ���ڵ� ����	
   type rec_car is record( country car_country.country%type,
   									maker carmaker.maker%type,
   									model car_model.model%type,
   									price car_model.price%type,
   									hiredate car_model.hiredate
   									);
   		
   	type rec_car is table of rec_car index by binary_integer;
   	
   	arr_car rec_car;
   									
     search_cnt number :=0;

     i number :=0;



begin
       dbms_output.put_line('�ѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤѤ�');
       dbms_output.put_line('������  ������  �𵨸�  ���  ����   �Է���'); 
       
            for	 temp in
                (
                  select    cc.country, cc.maker, cmo.model, cmo.car_year, cmo.price,
                  				cmo.hiredate
                  from      car_country cc , car_maker cma, car_model cmo
                  where     (cma.maker = cc.maker and cmo.model=cma.model)
                  				and cma.maker ='&maker'
                  order by	cmo.price

                 )
 
                loop
               i := i+1;

               arr_car(i) := temp;

               end loop;
				search_cnt := i;

                        dbms_output.put_line( arr_car(i).country||'  '||arr_car(i).maker||'  '||
                		arr_car(i).model||'  '||arr_car(i).car_year||'  '||to_char(arr_car(i).price,'9,999')||'  '||
                		o_char(arr_car(i).hiredate,'mm-dd-yy q');
                		
             




end;
/
	
	 