/*
숙제1.
제조사를 두개 입력받아 제조사에 해당하는 모든 차량의
 제조국, 제조사,모델명,년식,가격,옵션을 조회 하세요.
 출력은 가격의 오름차순으로 조회하였을 때 조회된 결과에 
   3~6번째 레코드만  출력하세요.

현대, 기아를 입력하였을 때

 출력 예
-----------------------------------------------------------------
번호 제조국  제조사  모델명  년식  가격   입력일 
-----------------------------------------------------------------
1     국산     현대    아반테  2001  3,500 mm-dd-yyyy


-----------------------------------------------------------------
검색 결과 현대 [x]대, 기아 [x]대

아반테 x대와 소렌토 x대는 검색 결과에 나온 대수만 카운트 합니다.

*/ 

set verify off
set serveroutput on
	accept maker prompt ' 제조사 : '
	accept maker prompt ' 제조사 : '
	
declare										-- 레코드 선언	
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
       dbms_output.put_line('ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ');
       dbms_output.put_line('제조국  제조사  모델명  년식  가격   입력일'); 
       
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
	
	 