-- �ּ� 0�� ����, �ִ� ���Ǳ��� �ݺ����� while
set serveroutput on
declare
	--LOOP�� ���������� ������ �־�ߵ�--
	i number;

begin
    -- 1���� ���� 10���� 1�� �����Ͽ� ���� ��� while
         i :=1; 
         -- ���ǽ�
         while i <=10 loop       -- i < 11�� ����
         -- �ݺ����� ����
            dbms_output.put_line( i );
         -- ������, ���ҽ� - ���ǿ� �����Ͽ� �ݺ��� ���߱� ����
         i := i+1;
         end loop;
         
              dbms_output.put_line('....................................................................');
              
      -- 0 ~ 100������ Ȧ���� ����ϴ� while
      i:=1;
      while i < 101 loop                    --2���� ��� if�� ����    i:=i+2; �Ἥ ����� �ִ�
      	--if mod(i,2) =1 then
      dbms_output.put_line(i);
      --end if;
      -- i :=i+1; 
      i:=i+2;
      end loop; 


end;
/