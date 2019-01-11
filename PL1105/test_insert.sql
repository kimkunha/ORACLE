-- pl/sql 에서 DML 사용
set serveroutput on
declare



begin
	insert into CP_EMP3(empno, ename, deptno, job, sal)
		values(3456,'유자슥',10,'부장님',7000);
                                                                              
		  -- commit을 않하고 치면 레코드가 값이 컬럼에 들어가지 않는다.
		  -- 컬럼 없이 들어간 레코드는 다음에 commit친  레코드에 같이 들어간다.
		
		-- 수행한 행의 수 얻기 : 암시적(묵시적) 커서 사용
		-- SQL(암시적 커서)      --숫자? 비슷한걸 보여줌
	      -- insert 는 추가 성공 아니면 예외가 발생하게 되므로 굳이 암시적 커서를
	      -- 사용하여 추가된 행의 수를 얻어 비교할 필요가 없다.
			commit;
		dbms_output.put_line(sql%rowcount );

	exception
	when others then
	dbms_output.put_line('문제 발생');

end;
/
