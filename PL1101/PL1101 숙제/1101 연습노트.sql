set serveroutput on
set verify off 

declare
     name varchar2(10);
     k_name emp.ename%type;
	class4 class4_info.num%type; 
	   kh_1 emp%rowtype;   
begin
        name :='김재현';
        dbms_output.put_line( '나의 이름은'||name||'입니다');
        name :='준타로';
        dbms_output.put_line('쿄모 오츠카레 사마 데시타'||name||'상');
        
        k_name :='김현식';
        dbms_output.put_line('오늘도' ||k_name||'고생한다');   
        
        class4 := 3;
        dbms_output.put_line('오늘은' ||class4||'교대입니다');
        
                                                                      
            kh_1.empno :=3;       
            dbms_output.put_line('출석번호'||kh_1.empno||'번입니다') ;
                                                                                                            
            kh_1.ename := '김건하';  
            dbms_output.put_line('제 이름은'||Kh_1.ename||'입니다');
            
            kh_1.job :='사장';
            dbms_output.put_line('제 직업은 '||kh_1.job||'입니다');
            
            kh_1.hiredate :=sysdate;
            dbms_output.put_line('제 입사일은 '||Kh_1.hiredate||'입니다');
            
            kh_1.sal :=50000;
            dbms_output.put_line('제 연봉은'||kh_1.sal||'입니다');                                       
                                                                                               
        
                     
            dbms_output.put_line('출석번호'||kh_1.empno||'번입니다.제 이름은'||Kh_1.ename||
            '이구요 제 직업은 '||kh_1.job||'이에요제 입사일은 '||to_char(Kh_1.hiredate,'yyyy-dd-mm')||'입니다 마지막으로
            제 연봉은'||kh_1.sal||'입니다 잘부탁 드려요');         
            
         
           
           
                                                                              
   
                          
        
                                 

end;
/