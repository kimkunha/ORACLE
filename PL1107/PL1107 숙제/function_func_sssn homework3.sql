/*
3. 주민번호를 입력받아 출생지역을 반환하는 함수 작성
   출생지역은  880101-1xx1111 에서 xx 두자리 이고
   아래의 표와 같다.
  	서울시 : 00~08
	부산시 : 09~12
	인천시 : 13~15
	경기도 : 16~25
	강원도 : 26~34
	충청도 : 35~47
	전라도 : 48~66
	경상도 : 67~92
	제주도 : 93~95
*/


create or replace function   func_sssn(ssn char)return char
is

		check_ssn number(2) := substr(ssn,9,2);
		result_msg char(9);

begin
		if   check_ssn between 0 and 8 then
		       result_msg :='서울시';
		elsif   check_ssn between 09 and 12 then
		       result_msg :='부산시';  
		       	elsif   check_ssn between 13 and 15    then
		       result_msg :='인천시';     
		       	elsif   check_ssn between 16 and 25  then
		       result_msg :='경기도';     
		       	elsif   check_ssn between 26 and 34    then
		       result_msg :='강원도';     
		       	elsif   check_ssn between 35 and 47   then
		       result_msg :='충청도';     
		       	elsif   check_ssn between 48 and 66   then
		       result_msg :='전라도';     
		       elsif   check_ssn between 67 and 92   then
		       result_msg :='경상도';           
		       else
		       result_msg := '제주도';   
		       end if;                      
		       
		       return result_msg;

end;
/
		       
		
		          