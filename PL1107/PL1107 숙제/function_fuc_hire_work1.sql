--1. �Ի�⵵�� �Է¹޾� �ټӳ���� 10�� �̻��̸� '���ټ�'
--  �׷��� ������ '�ܱ�ټ�'�̶�� �޼����� ��ȯ�ϴ� �Լ� �ۼ�.
create or replace function fuc_hire (hiredate date)  return char
is
			result_msg char(12);
			check_year varchar2(4) := to_char(sysdate,'yyyy') - to_char(hiredate,'yyyy');
			
begin
          if check_year >= 10   then 
               result_msg := '���ټ�';
          else
              result_msg:='�ܱ�ټ�';
          end if;

       return result_msg;

end;
/
