set serveroutput on
set verify off 
accept name prompt ' ���� �̸���: '
accept age prompt '�����Է� : '
accept sal prompt '���� ������ : '

declare
       kkhh emp%rowtype;
       job varchar2(10);
        birth number;
         age number;
         
begin
    kkhh.ename:='&name';
    kkhh.sal :=&sal;
         job:='ss'; 
         age :=&age; 
      
    
    dbms_output.put_line('���̸��� '||kkhh.ename||'�̸� �� ������'||KKHH.sal||'���̸�
     ������ '||job||'�Դϴ�');
        
       birth :=to_Char(sysdate,'yyyy') -age +1;
          dbms_output.put_line(age||'�� �¾��'||birth||'���');

end;
/
