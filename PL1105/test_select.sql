--cp_emp2���� �����ȣ�� 7521�� ����� �����, �Ի���, ������
-- ��ȸ�Ͽ� ����ϴ� PL/SQL �ۼ�    -7521�� ������ 7566 ��-

set serveroutput on  

declare
        ename cp_emp2.ename%type;
        input_Date varchar2(10);
        sal cp_emp2.sal%type;
begin
       select  ename,to_Char(hiredate,'yyyy-mm-dd') hiredate ,sal 
       into      ename, input_Date, sal
       from		cp_emp2
       where     empno=7566;
        
       dbms_output.put_line('��ȸ��� : '||ename||' / '||input_date||' / '||sal||' /'
       ||sql%rowcount);

       exception
       when others then
       dbms_output.put_line('�����߻�');

end;
/
