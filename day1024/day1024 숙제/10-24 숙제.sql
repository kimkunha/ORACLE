select *
from emp;
--1��
select   deptno, sal, empno, ename, hiredate
from      emp
where  sal between 1000 and 3000 and
 deptno !=10;

-- 2��
select     comm, empno, ename
,sal,sal+comm total, sal/12   money
from     emp;

--3��
select empno||'��'||ename||'�����'||hiredate||'��
�Ի� �ϼ̰� ������$'||sal||'�Դϴ�' input
from emp
where deptno =10 or deptno = 30;

--4��
select    empno,ename, hiredate, sal, job
, deptno
from emp
where sal<3000
order by sal asc,ename desc;

--5��
select * from test_like;
insert into test_like(num,name,loc,highschool)
values(7,'����������','����� ���۱� �󵵵�','�����');
insert into test_like(num,name,loc,highschool)
values(8,'���븸','����� ���빮�� ���빮1��','��Ÿ��');
insert into test_like(num,name,loc,highschool)
values(9,'���¼�','����� ���빮�� ���빮2��','�����');
delete from test_like
where num=7;
commit;
delete from test_like
where num=7;

--6��
select  '��ȣ: '||num||' �̸�: '||name||' �ּ�: '||loc||' �б�: '||highschool
from   test_like
where loc like '�����%';

--7��
select EMPNO, ENAME, SAL, HIREDATE, DEPTNO, JOB
from  EMP
 where ename like '____' or sal>=3000
 order by ename;

--8��
select    distinct   HIGHSCHOOL
from  TEST_LIKE
order by HIGHSCHOOL asc;

select      HIGHSCHOOL
from  TEST_LIKE
group by HIGHSCHOOL
order by HIGHSCHOOL asc ;

--9��
select  EMPNO, ENAME, HIREDATE, SAL ,sal*1.07 rainen
from  EMP;


--10��
select ENAME, EMPNO, HIREDATE, SAL
from emp
where   ename like '_____' and   ename like '__A%'
order by sal ;

--11��
select             ENAME, SAL, JOB, MGR, HIREDATE
from emp
where ename like 'A%' and sal>=1600;
select * from EMP
