-- 두수를 입력받아 나눈 값을 출력하는 PL/SQL
set verify off
set serveroutput on
      accept num1 prompt ' 수1 : '
      accept num2 prompt ' 수2 : '

declare
      result number;

begin
 		result := &num1/&num2;

 		dbms_output.put_line(&num1||' / '||&num2||' = '||result);

 		exception
-- 		when	zero_divide then
-- 		dbms_output.put_line('0으로는 나눌수 없습니다.');

        when others then
--        dbms_output.put_line('개발자가 인식하지 못한 예외'||sqlcode);

                      -- 예외가 발생했을 때 Oracle에서 제공하는 형식의 예외
                      -- 메세지를 출력 하고 싶을 때 사용자 정의 예외처리를 한다.
                      --raise_application_error(에러코드, '메세지')
                      raise_application_error(-21000,'사용자정의 예외');

end;
/


