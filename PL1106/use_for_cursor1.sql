-- �μ���ȣ�� �Է¹޾� �ش� �μ��� ���� 
-- �����ȣ, �����, �Ի���, ���� ��ȸ
-- �Ի���, ��-��-�� �б� ��  �������� ��ȸ                                                     cursor1�� �����ϰ� ����  for���ٰ� Ŀ�� ����
-- �μ���ȣ�� 10��, 20��, 30���� �ƴ϶��  10�� �μ��� ��ȸ�Ͽ� 
-- ��� �� ��.
																


set verify off
set  serveroutput on

accept deptno prompt ' �μ���ȣ : '       
declare
    i_deptno number:=&deptno;   
--��  where������ ������ �ϴ� �÷����� �������� �޶�ߵ�

begin

		if i_deptno not in (10,20,30) then
			i_deptno :=10;
		end if;
		
		for emp_data in
				(select empno,ename,sal,to_char(hiredate,'yyyy-mm-dd q') hiredate
				from emp
				where deptno = i_deptno)
        loop
        
        dbms_output.put_line(emp_data.empno||' / '||
        								emp_data.ename||' / '||
        								emp_data.sal||' / '||
        								emp_data.hiredate);
         end loop;

end;
/
