-- 조회 : 직급에 대한 사원수, 연봉합 조회
var  sal number;

exec select_test_proc_cnt('김대리', :msg, :cnt, :sal );
print msg;
print cnt;
print sal;


select * from test_proc;
