set serveroutput on
set verify off 

declare
     name varchar2(10);
     k_name emp.ename%type;
	class4 class4_info.num%type; 
	   kh_1 emp%rowtype;   
begin
        name :='������';
        dbms_output.put_line( '���� �̸���'||name||'�Դϴ�');
        name :='��Ÿ��';
        dbms_output.put_line('��� ����ī�� �縶 ����Ÿ'||name||'��');
        
        k_name :='������';
        dbms_output.put_line('���õ�' ||k_name||'����Ѵ�');   
        
        class4 := 3;
        dbms_output.put_line('������' ||class4||'�����Դϴ�');
        
                                                                      
            kh_1.empno :=3;       
            dbms_output.put_line('�⼮��ȣ'||kh_1.empno||'���Դϴ�') ;
                                                                                                            
            kh_1.ename := '�����';  
            dbms_output.put_line('�� �̸���'||Kh_1.ename||'�Դϴ�');
            
            kh_1.job :='����';
            dbms_output.put_line('�� ������ '||kh_1.job||'�Դϴ�');
            
            kh_1.hiredate :=sysdate;
            dbms_output.put_line('�� �Ի����� '||Kh_1.hiredate||'�Դϴ�');
            
            kh_1.sal :=50000;
            dbms_output.put_line('�� ������'||kh_1.sal||'�Դϴ�');                                       
                                                                                               
        
                     
            dbms_output.put_line('�⼮��ȣ'||kh_1.empno||'���Դϴ�.�� �̸���'||Kh_1.ename||
            '�̱��� �� ������ '||kh_1.job||'�̿����� �Ի����� '||to_char(Kh_1.hiredate,'yyyy-dd-mm')||'�Դϴ� ����������
            �� ������'||kh_1.sal||'�Դϴ� �ߺ�Ź �����');         
            
         
           
           
                                                                              
   
                          
        
                                 

end;
/