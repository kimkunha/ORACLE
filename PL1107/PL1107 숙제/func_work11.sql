/*1. �Ի�⵵�� �Է¹޾� �ټӳ���� 10�� �̻��̸� '���ټ�'
  �׷��� ������ '�ܱ�ټ�'�̶�� �޼����� ��ȯ�ϴ� �Լ� �ۼ�.
*/
--create or replace function  func_date(hiredate date)return varchar2
--is
--	c_result varchar2(12) := '�ܱ�ټ�'; 
--	c_sysdate varchar2(4):= to_char(sysdate,'yyyy');
--	c_hiredate varchar2(4) := to_char(hiredate,'yyyy');
--begin
--   if c_sysdate-c_hiredate >=10 then
--    	c_result := '���ټ�'; 
--   end if; 
--   return c_result;
--end;
--/

/*
2.  �ֹι�ȣ�� �Է¹޾� ������ ��ȯ�ϴ� �Լ� �ۼ�     (���ڸ� Ȧ��, ���ڸ� ¦��)
*/
--create or replace function  func_gender(ssn varchar2)
--return varchar2
--is
--	g_result varchar2(6); 
--	ssn_8 char(1);
--begin
--		  ssn_8 := substr (ssn,8,1);
--          if check_ssn(ssn) = 'success' then
--          		if ssn_8  in( 1,3,5,7,9)  then
--          			g_result := '����';
--          		else
--          			g_result :='����';
--          		end if;
--          end if;
--
--   return g_result;
--end;
--/


/*
3. �ֹι�ȣ�� �Է¹޾� ��������� ��ȯ�ϴ� �Լ� �ۼ�
   ���������  880101-1xx1111 ���� xx ���ڸ� �̰�      
   �Ʒ��� ǥ�� ����. 
  	����� : 00~08
	�λ�� : 09~12
	��õ�� : 13~15
	��⵵ : 16~25
	������ : 26~34
	��û�� : 35~47
	���� : 48~66
	��� : 67~92
	���ֵ� : 93~95
 */
create or replace function  func_born(ssn varchar2)
return varchar2
is
	b_result char(9); 
	ssn_910 char(2);
begin
    ssn_910 := substr (ssn,9,2);
          if check_ssn(ssn) = 'success' then
          		if ssn_910  between 0 and 08  then
          			b_result := '�����';
         		elsif ssn_910 between 9 and 12 then
         			b_result := '�λ��'; 
         		elsif ssn_910 between 13 and 15 then
         			b_result := '��õ��'; 
         		elsif ssn_910 between 16 and 25 then
         			b_result := '��⵵';
         		elsif ssn_910 between 26 and 34 then
         			b_result := '������'; 
         		elsif ssn_910 between 35 and 47 then
         			b_result := '��û��';  
         		elsif ssn_910 between 48 and 66 then
         			b_result := '����'; 
         		elsif ssn_910 between 67 and 92 then
         			b_result := '���';
         		elsif ssn_910 between 93 and 95 then
         			b_result := '���ֵ�';  			
          		end if;
         end if;

   return b_result;
end;
/
   

 
