select * from user_procedures;
-- �ܺ� ���� ����
var msg varchar2(300);
var cnt number;

-- ���ν��� ����
execute update_test_proc(1112,'����',3000,:cnt,:msg);
-- ó�� ��� ���
print msg;
prin cnt;


-- ������� 2 : ������ ���, ����, �븮, ����, ����, ����, �̻�, ��, ����, ��ǥ�̻� �� �ԷµǾ������� ���� �Ѵ�.
execute update_test_proc(1112,'����',3100,:cnt,:msg);
-- ó�� ��� ���
print msg;
prin cnt;


-- ������� 3 : �������
execute update_test_proc(1114,'����',2490,:cnt,:msg);
-- ó�� ��� ���
print msg;
prin cnt;


select * from test_proc;

