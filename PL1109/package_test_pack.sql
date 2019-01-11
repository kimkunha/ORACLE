-- 패키지 헤더 : 패키지에 들어갈 함수, 프로시저의 목록정의( 업무구현 X)
create or replace package test_pack
as
	function get_name(name varchar2)return varchar2;  
	procedure get_age(birth_year in number,age out number); 
		procedure constraints_search
		( tname varchar2, tab_info out sys_refcursor)  ;
end;
/
