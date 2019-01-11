-- 행운의 수 1 ~ 45 중 하나 얻는 함수
-- 귀인얻기 프로시저
create or replace package lucky_pack
as
	-- 행운의 수 1 ~ 45 중 하나 얻는 함수
	function lucky_num return number;
	--귀인 얻기 프로시저
	procedure lucky_name(name out varchar2);   
	-- 생년월일, 성별, 이름을 입력받아 주민번호를 생성하여 
	--out.parameter에 설정하고 class4_info테이블에
	-- 추가하는 procedure 작성  
	procedure create_ssn(birth varchar2, gender varchar2,
	name varchar2, ssn out char); 
									
	end;
	
