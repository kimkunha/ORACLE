--  �����ȣ, �����, ������ ����ڿ��� �Է¹޾� cp_emp2���̺�
-- �߰��ϴ� PL/SQL �ۼ�
-- ��, ������ 5000 �̻� �ԷµǸ� 9000���� �����Ͽ� �߰�
-- �Ի����� �߰��Ǵ� ������ ��¥�� �߰� �Ѵ�.

set verify off
set serveroutput on

accept empno prompt ' �����ȣ : '
accept ename prompt ' ����� : '
accept sal prompt ' ���� : '

declare
	empno cp_emp2.empno%type;
	ename cp_emp2.ename%type;
	sal number;
begin    

    empno :=&empno;
    ename := '&ename';
    sal := &sal;
    
    if sal>5000 then
    sal :=9000;
    end if;
    
    insert into cp_emp2(empno,ename,sal,hiredate)
    values(empno,ename,sal,sysdate);
    commit;
    
    
     
 


end;
/