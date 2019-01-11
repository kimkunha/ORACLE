--어제 숙제를 for 를 사용하여 풀기
/*
숙제
1. 차량 모델을 입력받아  car_model 테이블에서
 제조국, 제조사,  년식,가격,옵션,입력일 조회.
출력
 xxxx모델 검색 결과
------------------------------------------------------
년식    가격   입력일             옵션
-----------------------------------------------------
2010   1,990 월-일-년 분기    처음 ,까지만

-----------------------------------------------------
검색 대수 [ x ] 대


년은 2자리만 조회,
가격의 오름차순 정렬하여 조회
(커서, 레코드, 테이블을 모두 사용하여 출력)
*/


set verify off
set serveroutput on

           accept model prompt ' 모델명 : '

declare
		-- 1. 조회된 행을 저장하고 사용하기 위한 record type 선언
		type rec_car is record (country car_country.country%type,
								maker car_country.maker%type,
								car_year car_model.car_year%type,
								price car_model.price%type,
								car_option car_model.car_option%type,
								hiredate car_model.hiredate%type);
		 -- 2. 선언된 record로	데이터형으로 table 선언
		 type tab_car is table of rec_car index by binary_integer;
		 -- 3.선언된 table로 변수 선언\
		 arr_car tab_car;

		 -- 4. 처음 ,까지만 출력하기 위해 옵션을 저장하는 변수
		  car_option car_model.car_option%type;

		 -- 5. 전체 검색 댓수를 저장하기 위한 변수
            search_cnt number :=0;
          -- 7. 인덱스를 저장하기 위한 변수
          i number :=0;
begin

         dbms_output.put_line('--------------------------------------------------');
         dbms_output.put_line('제조국 제조사	 년식 가격  입력일  	 옵션');
         dbms_output.put_line('--------------------------------------------------');

				--6. 검색된 결과를 table에 저장 ( 코드분리) - 사용할 테이블 생성
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
                -- 생선된 데이터를 사용하여 출력 형식을 만들어출력한다.

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
                 dbms_output.put_line(' 검색 대수['||search_cnt||']대');
end;
/













