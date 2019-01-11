-- tiggering event 비교
create or replace trigger event_compare
after insert or update or delete on trigger1
for each row    
-- trigger 안에서 변수를 작성하려면 declare 를 사용해야 한다.
--declare
--	num number;
begin

    if inserting then
    	--trigger2테이블에 이름, 나이 1살 더해서 추가
		--dbms_output.put_line('추가 작업 감시');    
		insert into trigger2(name,age)
		values(:new.name, :new.age+1);     
		-- commit;  trigger에서는 transaction 명령을 사용할수 없다
    end if;


    if updating then         
    	
		--dbms_output.put_line('변경 작업 감시');    
    --trigger1 테이블에서  변경작업이 발생하면
    --trigger2 테이블에 이전이름과 나이를 추가  
		insert into trigger2(name,age)
		values(:old.name, :old.age);
    end if;
            
    
    if deleting then
		--dbms_output.put_line('삭제 작업 감시'); 
		-- trigger1테이블에서 삭제작업 발생하면 trigger2테이블에서
		--같은 이름의 모든 레코드를 삭제 
		delete from trigger2
		where name =:old.name;
		  
		
    end if;





end;     
/







/*
-- cp_emp테이블에 레코드가 추가 되면
-- cp_emp2 테이블에 사원번호, 사원명,부서번호, 직무, 연봉을 추가 하는 trigger
-- 부서번호는 emp테이블의 사원번호가 7788인 사원과 동일한 번호로 추가
-- 연봉이 2000이하가 추가되면 cp_emp3 테이블에는 연봉에 500을
--더하여 추가하는 trigger 작성
*/


