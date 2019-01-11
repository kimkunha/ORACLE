-- outer join : 어느 한쪽 테이블에만 레코드가 존재해도 조회
-- 모든 부서의 부서번호, 부서명, 사원번호, 사원명, 입사일 조회

--ANSI ) 사용시 주의점 : left나 right를 사용할때 레코드가 있는 쪽 테이블 지정
-- 레코드의 구조를 잘 모른다면 full outer join을 하여  처리
select      d.deptno, d.dname, e.empno, e.ename, e.hiredate
from    dept   d
left outer join      emp   e
on         e.deptno = d.deptno;

select      d.deptno, e.deptno,d.dname, e.empno, e.ename, e.hiredate
from   			dept d   left join       emp e
on         e.deptno = d.deptno;

-- 조인 왼쪽기준으로 left 오른쪽이면 right

select      d.deptno, e.deptno,d.dname, e.empno, e.ename, e.hiredate
from   					emp e
full outer join       dept d
on         e.deptno = d.deptno;


-------------------------------------------------------------------------

-- oracle : 조인조건에 레코드가 없는 쪽에 (+)를 붙인다.

 select      		d.deptno, e.deptno,d.dname, e.empno, e.ename, e.hiredate
from   					emp e   ,dept d
where				(e.deptno(+) = d.deptno);      --oracle join은 full outer join 안됨--



-- 제조사가 '현대', '기아'인 모든 차량의 제조국, 제조사, 모델명, 연식
-- 가격, 옵션을 조회하세요

select  cc.country, cc.MAKER, cma.MODEL , cmo.car_year, cmo.price,
			cmo.car_option
from     CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL   cmo
where (cma.maker=cc.maker and cmo.model(+)=cma.model)
and cma.maker in('현대','기아');


-- 모델명이 'K5', 'k7', '소나타', '아반테','Cclass', 'A6' 인 모든 차량의
-- 제조국, 제조사, 모델명, 연식, 가격을 조회
-- 단, 가격의 내림차순으로 정렬하여 조회할것, 가격이 같다면
-- 연식의 내림차순으로 정렬할것

--ANSI
/*select    cc. COUNTRY, cc. MAKER, cmo. MODEL , cmo.MODEL ,
             cmo.CAR_YEAR
from  	 car_model    cmo
join		  car_maker   cma
on            cmo.

              CAR_COUNTRY   cc*/



----------------------------------------------------------------------

--   self join

-- 사원테이블에서 scott인 사원보다 연봉을 작게 받는 사원의
-- 사원번호, 사원명, 입사일, 연봉

select           e1.empno, e1.ename, e1.sal, e1. hiredate
from	    		emp e1,  emp e2
where           (e1. sal < e2. sal) and e2. ename='SCOTT';

select from



