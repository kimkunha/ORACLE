set serveroutput on

declare
--1 . 변수선언 : 변수명 데이터형(크기);'
       name varchar2(60);
--					 (테이블의 컬럼데이터형)을 참조하여 변수 선언
       e_name EMP.ename%type; -- 이경우에는 컬럼 1가지만 참조 --  실존하는 테이블이 이어야함--
--테이블의 모든 컬럼을 참조하여 변수 선언 ( recod type)
		row_type cp_emp%rowtype; 

   


begin
--2. 값 할당
		name := '홍길동';
		dbms_output.put_line('이름 : '||name);   
		
		name := '이재찬';
		dbms_output.put_line('이름 : '||name);
--3. 사용 : 출력, 연산참여, 재할당


		e_name :='이재현';
		dbms_output.put_line('참조변수 사용 : '||e_name);

		--record type 변수사용 : 변수명.컬럼명
		row_type.empno :=1111;                                      --row_type. 쓰고 컬럼명 입력
        row_type.ename :='정택성';
        row_type.hiredate :=sysdate;
        row_type.sal :=2800;

         select*from cP_emp;
dbms_output.put_line('사원번호 : '||row_type.empno
||',사원명 : '|| row_type.ename||',입사일 :'||
to_char(row_type.hiredate,'yyyy-mm-dd dy')
||',연봉 : '|| row_type.sal);
end;
/

/*    ----보충설명  ------
dbms_output.put_line('사원번호 : '||row_type.empno
||',사원명 : '|| row_type.ename||',입사일 :'||
to_char(row_type.hiredate,'yyyy-mm-dd dy')
||',연봉 : '|| row_type.sal);
*/                         --입사일이 18/19/11 로 나오는게 싫으면 to_Char를 사용해도 된다.




