-- pl/sql ���� DML ���
set serveroutput on
declare



begin
	insert into CP_EMP3(empno, ename, deptno, job, sal)
		values(3456,'���ڽ�',10,'�����',7000);
                                                                              
		  -- commit�� ���ϰ� ġ�� ���ڵ尡 ���� �÷��� ���� �ʴ´�.
		  -- �÷� ���� �� ���ڵ�� ������ commitģ  ���ڵ忡 ���� ����.
		
		-- ������ ���� �� ��� : �Ͻ���(������) Ŀ�� ���
		-- SQL(�Ͻ��� Ŀ��)      --����? ����Ѱ� ������
	      -- insert �� �߰� ���� �ƴϸ� ���ܰ� �߻��ϰ� �ǹǷ� ���� �Ͻ��� Ŀ����
	      -- ����Ͽ� �߰��� ���� ���� ��� ���� �ʿ䰡 ����.
			commit;
		dbms_output.put_line(sql%rowcount );

	exception
	when others then
	dbms_output.put_line('���� �߻�');

end;
/
