--  �����ȣ, �����, ������ ����ڿ��� �Է¹޾�
-- ��, ������ 5000 �̻��̸�  cp_emp3���̺�
-- �߰��ϰ� 5000 ���϶�� cp_emp2���̺�  �߰��ϴ� PL/SQL �ۼ�
-- cp_emp3 ���̺� �߰��Ǵ� ����� �μ���ȣ�� 10���μ���
-- �߰��ϼ���.

set verify off
set serveroutput on
 		accept empno prompt ' �����ȣ�� ?'
 		accept ename prompt '  ����� ?'
 		accept sal prompt ' ������?'

declare
empno cp_emp3.empno%type;
ename cp_emp3.ename%type;
sal number;

 begin
 	empno:=&empno;
 	ename:= '&ename';
 	sal := &sal;

 	if sal>5000 then
 	insert into cp_emp3(empno,ename,sal,deptno) values(empno,ename,sal,10);
 	 dbms_output.put_line('������ 5000 �̻��̸�  cp_emp3���̺� �߰�');

 	else
 	insert into cp_emp3(empno,ename,sal) values(empno,ename,sal);
 	   dbms_output.put_line('������ 5000���� �̹Ƿ� cp_emp2�� �߰� �Ǿ����ϴ�');
 	    end if;

commit;





end;
/


select * from cp_emp2;
