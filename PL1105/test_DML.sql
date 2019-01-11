set verify off
set serveroutput on
accept empno  prompt '사원번호  ' 
accept ename  prompt ' 사원명 '
accept deptno  prompt ' 부서번호 '
accept job  prompt ' 직무  '

declare         
empno cp_emp3.empno%type :=&empno;
ename cp_emp3.ename%type :='&ename';
deptno cp_emp3.deptno%type :=&deptno;
job cp_emp3.job%type :='&job'; 

sal cp_emp.sal%type;   

select_empno cp_emp.empno%type :=7788;
begin

if deptno =10 then
select_empno :=7566;
elsif deptno =20 then
select_empno :=7698;
elsif deptno = 20 then                             
select_empno :=7782;

end if;

select sal
into sal
from emp
where empno=select_empno;
                                                     
insert into cp_emp3(empno, ename, deptno, job,sal)
values (empno, ename, deptno , job, sal);


dbms_output.put_line(empno||'번 사원 정보 를 추가하였습니다');

commit;

end;
/



