-- �ڵ带 ������ �ݺ� ��������ִ� loop ���
set serveroutput on 

declare
           i number;
           x number;
begin
                

		i:=1;  x:=1;							--���ѷ����� ���� ��¾��Ѵ�. ���� ���� �Ⱥ��̴°� ��--	
		loop   
	--	 exit when (i=10);  ������ ���� �־ ����ϴ�--
		dbms_output.put_line('������ �ݿ����� '||i); 
		dbms_output.put_line('������ ������� �κ�'||x); 
		i := i+1;
		x := x+1; 
		 exit when (i=100);   --if�� ���� �� ������ ����--
--		 if i=10 then
--		exit; 
--		end if;
		end loop;
	dbms_output.put_line('������ �p');
end;
/


