-- 삭제 : 존재하는 사원번호로 삭제, 존재하지 않는 사원번호
exec delete_test_proc(1111, :msg, :cnt);

print msg;
prin cnt;
