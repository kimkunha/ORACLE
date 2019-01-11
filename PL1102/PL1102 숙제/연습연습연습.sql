--숙제 .

/*1.  class4 강의장의 학생들의 교통요금을 구하는  PL/SQL을 제작
   하고자한다.  대중교통수단 요금은 아래와 같으며 
   [버스 : 1200원,  지하철 :1250원] , 10키로를 초과하면 매4키로마다
  100원의 요금 더 부과된다.  
  이 정보를 이용하여 아래 학생들의 데이터를 처리하세요
  데이터. 
 1, 김정운, 서울시 강남구 역삼동, 5키로, 버스
  2, 김희철, 인천시 남동구 구월동, 20키로, 지하철
  3, 이재찬, 인천시 부평구 부평동, 16키로, 지하철
  4, 박영민, 서울시 관악구 봉천동, 10키로, 지하철
  5, 정택성, 서울시 동대문구 동대문동, 8키로, 버스

   출력
   번호, 이름,  주소, 거리, 교통수단, 기본요금, 총요금    
*/

set serveroutput on

declare
type metro_record is record( num number,name varchar2(30), ssn varchar2(90),
												km number(3), metro varchar2(10));
												
   type metro_table is table of metro_record index by binary_integer;      

             bus_table metro_table;

begin   
           bus_table(1).num :=1;
           bus_table(1).name :='김정운';
           bus_table(1).ssn := '서울시 강남구 역삼동';
           bus_table(1).km := 5;
           bus_table(1).metro :='버스';
                                 
           bus_table(2).num :=2;
           bus_table(2).name :='김희철';
           bus_table(2).ssn := '인천시 남동구 구월동';
           bus_table(2).km := 20;
           bus_table(2).metro :='지하철';
                                  
           bus_table(3).num :=3;
           bus_table(3).name :='이재찬';
           bus_table(3).ssn := '인천시 부평구 부평동';
           bus_table(3).km := 16;
           bus_table(3).metro :='지하철';
                                            
           bus_table(4).num :=4;
           bus_table(4).name :='박영민';
           bus_table(4).ssn := '서울시 관악구 봉천동';
           bus_table(4).km := 10;
           bus_table(4).metro :='지하철';
                                                             
           bus_table(5).num :=5;
           bus_table(5).name :='정택성';
           bus_table(5).ssn := '서울시 동대문구 동대문동';
           bus_table(5).km := 8;
           bus_table(5).metro :='버스';

  
  
  
  
  dbms_output.put_line('번호  이름   주소  거리   교통수단  기본요금   총요금');
  dbms_output.put_line('===========================================================');



	for i in 1 .. bus_table.count loop
			
	
	      dbms_output.put_line(bus_table(i).num||'     '||
    	bus_table(i).name||'     '||bus_table(i).ssn||'     '||
    	bus_table(i).km||'     '||bus_table(i).metro);   
    	end loop;
    
	
	