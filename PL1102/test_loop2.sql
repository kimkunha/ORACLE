-- 1 ~ 100���� ����ϴ� loop
set serveroutput on

declare
       cnt number(3); 

begin
     
     -- �ʱⰪ
         cnt :=0;                                  			
          --1���� ���� 100���� (¦���� ���)         --������ 1�̶� �ʱⰪ2�� �Ҽ� ����
          
                                                       			--������ ���°� ������ put���� ����ϰ�
     loop   
          cnt := cnt+1;
			--if mod(cnt,2)=0 then                      -- endloop; �ؿ� dbms_output.put_line('��');
         dbms_output.put_line(cnt);  
			-- end if; 
   											 --�̷������� �޾��ָ� �ȴ�.
         cnt := cnt+1;                -- �ܼ��ϰ�   cnt := cnt+1;  �� �ѹ� �� �Ἥ �ϴ°͵� ����
         exit when cnt>100;
	end loop;							-- endloop; �ؿ� dbms_output.put_line('��');
-- dbms_output.put_line('��');   
end;
/
