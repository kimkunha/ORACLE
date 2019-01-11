print cur_dept;

-- 부서번호 입력하여 부서별 사원 정보 조회
var cur_emp refcursor;

exec select_emp(30, :cur_emp );
