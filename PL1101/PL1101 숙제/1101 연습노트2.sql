set serveroutput on
set verify off 
accept name prompt ' 너의 이름은: '
accept age prompt '나이입력 : '
accept sal prompt '너의 연봉은 : '

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
      
    
    dbms_output.put_line('제이름은 '||kkhh.ename||'이며 제 연봉은'||KKHH.sal||'원이며
     직업은 '||job||'입니다');
        
       birth :=to_Char(sysdate,'yyyy') -age +1;
          dbms_output.put_line(age||'살 태어난해'||birth||'년생');

end;
/
