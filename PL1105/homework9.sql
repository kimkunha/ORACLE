/*숙제
1. 차량 모델을 입력받아  car_model 테이블에서                                           --커서작성, 
  년식,가격,옵션,입력일 조회.
출력
 xxxx모델 검색 결과
------------------------------------------------------
년식    가격   입력일             옵션
-----------------------------------------------------
2010   1,990 월-일-년 분기    처음 ,까지만 

-----------------------------------------------------
검색 대수 [ x ] 대 


년은 2자리만 조회,
 가격의asfasdfsaddf오름차순 정렬하여 조회 
(커서, 레코드, 테이블을 모두 사용하여 출력)
*/

set verify off
set serveroutput on
         
 accept model prompt ' 모델 : '
                                        
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
dbms_output.put_line('&model'||'모델 검색 결과');
dbms_output.put_line( 'ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
dbms_output.put_line( '년식    가격   입력일             옵션');    
dbms_output.put_line( 'ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
	for idx in 1..arr_car.count loop
		dbms_output.put_line(arr_car(idx).car_year||' '||arr_car(idx).price ||' '|| arr_car(idx).hiredate||' '||arr_car(idx).car_option );
	end loop;  
	dbms_output.put_line( 'ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
	dbms_output.put_line('검색 대수 [ '||i||' ] 대 ');
else
 	dbms_output.put_line('&model'||'검색 결과 없음');
 	
end if;

      close cur_car;

                       



end;
/
