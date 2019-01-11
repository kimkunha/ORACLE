-- ����� �� 1 ~ 45 �� �ϳ� ��� �Լ�
-- ���ξ�� ���ν���
create or replace package body lucky_pack
as
	-----lucky_num ���� -----
	function lucky_num return number
	is
	begin
	  	return trunc(dbms_random.value(1,46));     
	end lucky_num;
	-----lucky_num �� -----
	
	
	-----lucky_name ���� -----
	procedure lucky_name(name out varchar2)
	is   
		type name_tab is table of varchar2(30)
			index by binary_integer;

		name_arr name_tab;
									
		temp_num number;
	begin
		name_arr(1):='������';
		name_arr(2):='�̺���';
		name_arr(3):='������';
		name_arr(4):='������';
		name_arr(5):='�ڼҿ�';
		name_arr(6):='������';
		name_arr(7):='������';
		
			temp_num := trunc(dbms_random.value(1,name_arr.count+1));						
	        
		name := name_arr( temp_num);
	end lucky_name;
	-----lucky_name �� -----        
	
	    -----  create_ssn ���� -----  
		procedure create_ssn(birth varchar2, gender varchar2,
		name varchar2, ssn out char)     
		is
		--�ֹι�ȣ�� ������   ���̺�
			type ssn_tab is table of number(1)
				index by binary_integer;
			
			ssn_arr ssn_tab;	
			gender_num number :=2;
			temp_num number := 0;
			flag_num number :=2; 
			temp_ssn varchar2(5); 
			
			ssn_value varchar2(14);
		begin                  
			-- �Է¹��� ��������� ssn_tab�߰�
			for i in 1 .. length(birth) loop
				ssn_arr(i) := substr(birth,i,1);
			end loop;                                
			
			-- ���� ä��� 1       
			if gender ='����' then  
				gender_num := 1;
			end if;  
			

			
			ssn_arr(7) := gender_num;
			
			--������ ��° �� ���� ä���.
			--880101123456x
			for i in 8 .. 12 loop
				ssn_arr(i) := trunc(dbms_random.value(0,10),0);
			end loop;   
			
			-- ������ �ֹι�ȣ�� ������ ���ڸ��� ä��� ���� ����
			for i in 1 .. ssn_arr.count loop
			   temp_num := temp_num + ssn_arr(i)* flag_num;
			   
			   flag_num := flag_num+1;
			   
			   if flag_num = 10 then
			   	flag_num :=2;
			   	end if;
			end loop;  
			
			--ä���������� �� �ڸ��� ����
			ssn_arr(13) := mod(11-mod(temp_num,11),10);
			
			ssn_value := birth||'-'||gender_num||ssn_arr(8)|| ssn_arr(9)||
			ssn_arr(10)||ssn_arr(11)||ssn_arr(12)||ssn_arr(13);
		 
		    -- ������ �ֹι�ȣ�� class4_info�� �߰�
		    insert into class4_info(name,ssn)
		    values(name,ssn_value);
		    
		    ssn := ssn_value;
	
		    commit;
				
		end		create_ssn;
	        -----  create_ssn �� ----- 
	        
	        
	        
end lucky_pack;
	