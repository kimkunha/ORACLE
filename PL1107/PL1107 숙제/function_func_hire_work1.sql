create or replace function func_hire (hiredate date) return char
is 
	result_msg char(12);
	check_year varchar2(4) :=  to_char(sysdate, 'yyyy') - to_char(hiredate, 'yyyy');
begin
	if check_year >= 10 then
		result_msg := '장기근속';	
	else 
		result_msg := '단기근속';
	end if;
	
	return result_msg;
end;
/
