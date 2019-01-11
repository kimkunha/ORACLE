-- �����ȣ, �����, ����, ����(job)�� �Է¹޾� test_proc ���̺�
-- �߰��ϴ� procedure
--  1. �����ȣ�� 1 ~ 9999 ������ ���� �Է� �Ǿ�� �Ѵ�. 
--  2. ������ 2500 ~ 8000 ���̸� �ԷµǾ�� �Ѵ�.
-- 		���࿡ 2500 ���϶�� 2500���� 8000�̻� �̶�� 8000 ���� �����Ͽ� �߰��Ѵ� .  
-- ������� �����ΰ�� ù�ڸ� �빮�ڷ� �����Ͽ� �߰�
-- ������ ���, ����, �븮, ����, ����, ����, �̻簡 �ԷµǾ������� �߰��Ѵ�
-- �ߺ��� �����ȣ�� �ԷµǸ� ���ܷ� ó���Ѵ�.
create or replace procedure insert_test_proc(
			empno number, ename varchar2, sal number,
			job varchar2, msg out varchar2, row_cnt out number)			
is
			temp_sal number := sal;	

begin    
	row_cnt := 0;
	    -- 1.
			if empno between 1 and 9999 then     
		-- 2.	
				if temp_sal < 2500 then
				    temp_sal := 2500;
					end if;						 
				
				if temp_sal > 8000 then
					temp_sal := 8000;
					end if;
		--3, 4			
				if job in ('���', '����', '�븮', '����', '����', '����', '�̻�') then
					insert into test_proc(empno, ename, hiredate, sal, job)
					values (empno, initcap(ename),sysdate,temp_sal,job);
					
				row_cnt :=sql%rowcount;
				
				commit;
				
				msg := empno||'�� ��� ������ �߰��Ǿ����ϴ�.';	
				
				else
				      msg := job||' �� �Է°����� ������ �ƴմϴ�.' ;
				end if;	
			
				else
					msg := empno||'�����ȣ�� 1 ~ 9999 ���̸� �Է°���';
				end if;         
	
	exception
	when	dup_val_on_index then
		msg := empno||'�� �����ȣ�� �̹� �����մϴ�.';
	when others then
		--msg := '���ܹ߻� : '||sqlerrm||' / '||sqlcode;				
			if sqlcode =-12899 then
				msg :=ename||'����	�ѱ� 3�� ���� 10�� �� �ʰ� �Ͽ����ϴ�.';
			end if;
end;
/
