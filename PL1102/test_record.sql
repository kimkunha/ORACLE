-- record : ����ϰ� ���� ���������� ���� �ϳ��� ������������ ����ϴ� ��
set serveroutput on

declare
   -- 1. record ���� : ���ڵ忡 ���Ե� ���� ����
   type score_record is record (num number(4),
   												name varchar2(30), oracle_score number(3),
   												java_score number(3));
  
   -- �����ȣ, �����, �Ի��� �� ������ �� �ִ� Record ����      (�̹����� �����ؼ�)
   type emp_record is record( empno emp.empno%type,
  											ename emp.ename%type,
  											sal emp.sal%type,
  											input_date emp.hiredate%type);
  
  
  -- 2. Reocord�� ���� ����
   	jaehyun_score score_record;
    emp1 emp_record;
    emp2 emp_record;
begin                                              --���ڵ�� �ε����� ���� �ʴ´�
  -- 3. �� �Ҵ�.
  		jaehyun_score.num :=1;
  		jaehyun_score.name :='������';
  		jaehyun_score.oracle_score :=97;
  		jaehyun_score.java_score:=90;

			




  -- 4. �� ���
  dbms_output.put_line('��ȣ : '|| jaehyun_score.num||'�̸� : '||
  										jaehyun_score.name||', ����Ŭ ���� : '||
  										jaehyun_score.oracle_score||', �ڹ� ����: '||
  										jaehyun_score.java_score||', ���� : '|| 
  										(jaehyun_score.oracle_score+jaehyun_score.java_score));


          emp1.empno := 1111;
          emp1.ename := '������';
          emp1.sal := 2700;
          emp1.input_date := sysdate;
          

			emp2.empno := 2111;
			emp2.ename := '����ö';
			emp2.sal := 3500;
			emp2.input_date := '2018-12-12';
			
     dbms_output.put_line('��� : ' ||emp1.empno||', ����� : '||
     												emp1.ename||', ���� : '||emp1.sal||', �Ի��� : '||
     												to_char(emp1.input_date,'yyyy-mm-dd'));
     												
dbms_output.put_line('��� : ' ||emp1.empno||', ����� : '||
     												emp1.ename||', ���� : '||emp1.sal||', �Ի��� : '||
     												to_char(emp1.input_date,'yyyy-mm-dd'));
     												
dbms_output.put_line(' ������ : '||abs(emp1.sal - emp2.sal)
								||', �Ի� ���� �� : '||months_between(emp2.input_date,emp1.input_date));     												



end;
/