set serveroutput on

declare
--1 . �������� : ������ ��������(ũ��);'
       name varchar2(60);
--					 (���̺��� �÷���������)�� �����Ͽ� ���� ����
       e_name EMP.ename%type; -- �̰�쿡�� �÷� 1������ ���� --  �����ϴ� ���̺��� �̾����--
--���̺��� ��� �÷��� �����Ͽ� ���� ���� ( recod type)
		row_type cp_emp%rowtype; 

   


begin
--2. �� �Ҵ�
		name := 'ȫ�浿';
		dbms_output.put_line('�̸� : '||name);   
		
		name := '������';
		dbms_output.put_line('�̸� : '||name);
--3. ��� : ���, ��������, ���Ҵ�


		e_name :='������';
		dbms_output.put_line('�������� ��� : '||e_name);

		--record type ������� : ������.�÷���
		row_type.empno :=1111;                                      --row_type. ���� �÷��� �Է�
        row_type.ename :='���ü�';
        row_type.hiredate :=sysdate;
        row_type.sal :=2800;

         select*from cP_emp;
dbms_output.put_line('�����ȣ : '||row_type.empno
||',����� : '|| row_type.ename||',�Ի��� :'||
to_char(row_type.hiredate,'yyyy-mm-dd dy')
||',���� : '|| row_type.sal);
end;
/

/*    ----���漳��  ------
dbms_output.put_line('�����ȣ : '||row_type.empno
||',����� : '|| row_type.ename||',�Ի��� :'||
to_char(row_type.hiredate,'yyyy-mm-dd dy')
||',���� : '|| row_type.sal);
*/                         --�Ի����� 18/19/11 �� �����°� ������ to_Char�� ����ص� �ȴ�.




