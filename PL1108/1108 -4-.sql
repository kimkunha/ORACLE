-- ��ȸ : ���޿� ���� �����, ������ ��ȸ
var  sal number;

exec select_test_proc_cnt('��븮', :msg, :cnt, :sal );
print msg;
print cnt;
print sal;


select * from test_proc;
