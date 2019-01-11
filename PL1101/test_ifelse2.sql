-- 고객등급, 상품명, 가격을 입력 받아 처리하는 PL/SQL 작성
-- 출력은 고객등급이 '특별 OR 일반' 인 경우에만 연산을 수행
-- 특별고객은 상품할인을 상품가에 50% 일반고객은 상품할인을 
-- 상품가의 30%로 계산하여 출력

set verify off
set serveroutput on

accept grade prompt '고객등급 : '
accept item_name prompt '상품명 : '
accept price prompt '가격 : '
 
declare
	grade varchar2(30) := '&grade';
	item_name varchar2(60) :='&item_name';
	price number := &price;
    sale number :=0.3;
	
begin 
      if	grade in ('특별', '일반')  then               -- 여기서 단일 iF조건을 받음
      
      if grade = '특별' then                                      --여기서 IF ELSE를 받음
      sale := 0.5;
      
      else
      sale :=0.3;
      
  end if;    																			--  단일 IF 조건을 END IF
              dbms_output.put_line(grade||'고객님 구매하신 상품'||
      			item_name||'이고 정상가'||price||'원 이며 할인가'||
      			(price-price*sale));                                       
      																
    
    end if;                                                        -- IF ELSE 조건을 END IF
      
 																		
      
end;                                     
/      
 
 
