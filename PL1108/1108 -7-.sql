print cur_dept;

-- �μ���ȣ �Է��Ͽ� �μ��� ��� ���� ��ȸ
var cur_emp refcursor;

exec select_emp(30, :cur_emp );
