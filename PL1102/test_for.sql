-- FOR : ���۰� ���� �Ѵ��� �˼��ְ� 1�� ���� �ϴ� �ݺ���
set serveroutput on

				-- for��������--
declare   -- ������ �ȸ��� ������ --
		-- i number;
       	num number(1);
       	total number; 
		msg varchar2(100);
begin
  
      for i in 1 .. 10 loop
       		 dbms_output.put_line('i = ' ||i);
      end loop;
        --FOR�� index�� �����ϴ� ������ declare ���� ����� ������
        -- ������� �ʴ´�.
        --dbms_output.put_line('for ������ i' ||i);
 dbms_output.put_line('=========================================');
		-- 1~9���� 1�� �����ϴ� for�� �ۼ��Ͽ� ���  */
       num:=2;
         for i in 1 .. 15 loop                                                --  ���ϱ�� ��ȣ ġ�� �ȴ�..
         	dbms_output.put_line(num||' * '||i||' ='||(num - i));
           	end loop;

 							-- 1~ 100������ ��  ��� : 5050 (������)
							-- 1+2+3+4+5...+ 00

          total:=0;
           	for idx in 1 .. 10 loop                            
           	    total := total*idx;
           	end loop;
           	dbms_output.put_line('1~100������ ��'|| total);

 
      	dbms_output.put_line('.............................................');
       -- �ٱ� for�� �ε����� �� �� ���.
           	for i in 2 .. 9 loop
           	 dbms_output.put_line(i||'�� ����');
           	 -- ���� for
           	 for j in 1 .. 9 loop
           	     dbms_output.put_line(i||'*'||'='||i*j);
           	     end loop;

           	 dbms_output.put_line(i||'�� ��');
           	end loop;
               dbms_output.put_line('.............................................');      
               
      
               msg := '������ �ݿ��� �Դϴ� .';
                   --for�� ����Ͽ� ���� ���ھ� �߶󳻼� ���
                   for i in 1 ..  length(msg) loop
                   dbms_output.put_line(substr(msg,i,1));
                   end loop;     
                   
          dbms_output.put_line('.............................................');             
                        
    
          msg := '������ �ݿ��� �Դϴ�. ����';
                   -- for�� ����Ͽ� ���� ���ھ� �߶󳻼� ���  
                   -- reverse�� ����ϸ� �ݺ��Ǵ� �ε����� �Ųٷ� ����Ѵ�.
                   for i in reverse 1 ..  length(msg) loop
                   dbms_output.put_line(substr(msg,i,1));
                   end loop;     
                                
                   
                   
*/

end;
/


