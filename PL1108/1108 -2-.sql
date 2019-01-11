select * from user_procedures;
-- 외부 변수 선언
var msg varchar2(300);
var cnt number;

-- 프로시저 실행
execute update_test_proc(1112,'주임',3000,:cnt,:msg);
-- 처리 결과 출력
print msg;
prin cnt;


-- 제약사항 2 : 직급이 사원, 주임, 대리, 과장, 차장, 부장, 이사, 상무, 전무, 대표이사 가 입력되었을때만 변경 한다.
execute update_test_proc(1112,'선임',3100,:cnt,:msg);
-- 처리 결과 출력
print msg;
prin cnt;


-- 제약사항 3 : 연봉계산
execute update_test_proc(1114,'주임',2490,:cnt,:msg);
-- 처리 결과 출력
print msg;
prin cnt;


select * from test_proc;

