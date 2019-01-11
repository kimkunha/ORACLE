select *
from emp;
--1번
select   deptno, sal, empno, ename, hiredate
from      emp
where  sal between 1000 and 3000 and
 deptno !=10;

-- 2번
select     comm, empno, ename
,sal,sal+comm total, sal/12   money
from     emp;

--3번
select empno||'번'||ename||'사원님'||hiredate||'에
입사 하셨고 연봉은$'||sal||'입니다' input
from emp
where deptno =10 or deptno = 30;

--4번
select    empno,ename, hiredate, sal, job
, deptno
from emp
where sal<3000
order by sal asc,ename desc;

--5번
select * from test_like;
insert into test_like(num,name,loc,highschool)
values(7,'기임저엉은','서울시 동작구 상도동','정기고');
insert into test_like(num,name,loc,highschool)
values(8,'정대만','서울시 동대문구 동대문1동','썸타고');
insert into test_like(num,name,loc,highschool)
values(9,'송태섭','서울시 동대문구 동대문2동','정기고');
delete from test_like
where num=7;
commit;
delete from test_like
where num=7;

--6번
select  '번호: '||num||' 이름: '||name||' 주소: '||loc||' 학교: '||highschool
from   test_like
where loc like '서울시%';

--7번
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from  EMP
 where ename like '____' or sal>=3000
 order by ename;

--8번
select    distinct   HIGHSCHOOL
from  TEST_LIKE
order by HIGHSCHOOL asc;

select      HIGHSCHOOL
from  TEST_LIKE
group by HIGHSCHOOL
order by HIGHSCHOOL asc ;

--9번
select  EMPNO, ENAME, HIREDATE, SAL ,sal*1.07 rainen
from  EMP;


--10번
select ENAME, EMPNO, HIREDATE, SAL
from emp
where   ename like '_____' and   ename like '__A%'
order by sal ;

--11번
select             ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600;
select * from EMP
