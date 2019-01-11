-- Ineset subquery

-- 단수행
-- cp_emp3에 아래와 같은 레코드를 추가.
-- 사원번호 : 1111, 사원명 : 김희철, 부서번호 : 10, 직무 : 사원,
-- 연봉 : emp테이블의 사원번호가 7566인 사원의 연봉과
-- 같은연봉으로 추가하세요
insert into cp_emp3( EMPNO, ENAME, DEPTNO, JOB, SAL)
values (1111,'김희철',10,'사원',
  (select sal from EMP where empno =7566));

--단일행 서브쿼리가 들어가야하는 곳에서 복수행이 사용되면 eroor
-- 여러행이 나오는경우
insert into cp_emp3( EMPNO, ENAME, DEPTNO, JOB, SAL)
values (1111,'김희철',10,'사원',
  (select sal from EMP ));

-- 컬럼하나에 값을 넣어야 하는 곳에서 컬럼 여러개가 조회되면
-- 추가하는 값의 갯수가 맞지 않으므로 eroor
insert into cp_emp3( EMPNO, ENAME, DEPTNO, JOB, SAL)
values (1111,'김희철',10,'사원',
  (select sal, DEPTNO from EMP where empno =7566));

-- 복수행(다중행) 서브쿼리
-- emp 테이블에서 부서번호가 30번인 부서의 사원번호, 사원명, 부서번호
-- 직무, 연봉을 조회하여 cp_emp3테이블에 추가
insert into cp_emp3
(select EMPNO, ENAME, DEPTNO, JOB, SAL from emp
where DEPTNO =30);

-- emp테이블의 사원번호 7566의 연봉조회
select sal from emp
where empno=7566;

-- tset용----
create table test( job varchar2(9),sal number(7,2),
					hiredate date);
alter table test add inPut_Date date;
alter table test modify hiredate varchar2(7);

-- 사원테이블에서 1980-02에 입사한 사원의 직무,연봉,
-- 입사년 -월, 입력일을 test테이블에 추가

insert into test
(select job, sum(sal),to_char(hiredate,'yyyy-mm') hiredate,sysdate
from emp
where to_char(hiredate,'yyyy-mm')='1981-02'
group by job,hiredate); --올바른 예는 아님--       

