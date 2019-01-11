-- inner join : 서로 다른 테이블에 같은 값이 있는 경우에만 조회     *--이문제에선 emp테블의 deptno,
                                                                                      --*dept 의  deptno를 조인하여                                                                                    -- 만들어야함
-- 사원번호, 사원명, 부서번호, 부서명, 위치, 연봉 조회                   *--만들어야함

-- 양쪽테이블의 모두 다 있는 컬럼으로 조인조건을 가져야 함

-- ANSI
select          	empno,ename,deptno,dname, loc, sal     -- 이리하면 열의정리가 애매함
from				emp                                                         -- 아래와 같이 변경 할수 있음.
inner join     dept
on     			deptno=deptno;

----------------------------------------------------------------------


select          	empno, ename, dept.deptno, dname, loc, sal
from				emp                                           -- 1) 그냥 deptno로 하면 열이 애매해서
inner join     dept                                          --    테이블명.컬럼으로 해줘야 조회 가능
on     			emp.deptno= dept.deptno;

select * from DEPT ;
--------------------------------------------------------------------------

select          	empno, ename, d.deptno,dname, loc, sal
from				emp  e                                         -- 2)  from emp를 e로 alias하고
inner join     dept  d                                        --      inner join의  dept를  d로 alias하여
on     			e.deptno=d.deptno;                     --    간략하게 할수있다. (위의 컬럼도 바꿔줘야함)

------------------------------------------------------------------
select          	e.empno, e.ename, d.deptno,d.dname, d.loc, e.sal
from				  dept  d                                       --     컬럼명에도 alias된 것을 달아주면 알아보기
inner join       emp  e                                        --     쉽다
on     			d.deptno= e.deptno;                     --

------------------------------------------------------------------------------

--- oracle

select          	e.empno, e.ename, d.deptno,d.dname, d.loc, e.sal
from				emp e, dept d;         ``--이렇게 발생하면 쓸수 있는 데이터가 아님 (파티션 프러덕트)


--이렇게 해야됨--
select          	e.empno, e.ename, d.deptno,d.dname, d.loc, e.sal
from				emp e, dept d
where  			e.deptno = d.deptno;

select * from EMP;
select * from DEPT;

--------    내가 해본것
--alter table   car_country add constraint  primary key pk_car_country(country)


--alter table car_maker add constraint FK_maker references car_country(country)


---------------  정답
-- 제조국에서 테이블에 pk설정
alter table   car_country add constraint   pk_car_country
primary key(maker);

select * from car_country;

-- 제조사 테이블에 fk설정
alter table car_maker add constraint FK_maker
foreign key(maker) references car_country(maker);

select * from car_country;

--제조사 테이블에 pk설정
alter table   car_maker add constraint   pk_maker
primary key(model);

-- 모델 테이블은 FK설정
alter table car_model add constraint FK_model
foreign key(model) references car_maker(model);


select * from user_constraints;

------------------------------------------------------------------------

-- 모델명이 '아반테' , '소나타', 'A8'인 차량의 제조국, 제조사, 모델명, 연식, 가격, 이미지 조회
-- ANSI
select         cc. country,cc. maker,cma. model, cmo.car_year,
 				cmo. price, cmo. car_img
from         	car_country     cc
inner join    	car_maker			cma
on                  cma.maker=cc.maker
inner join		car_model     cmo
on                cmo. model= cma.model
where          cmo.model in ('아반테' , '소나타', 'A8');




--ORACLE
select         cc. country,cc. maker,cma. model, cmo.car_year,
 				cmo. price, cmo. car_img
from         	car_country     cc, car_maker cma, car_model cmo
where 			(cma.maker=cc.maker and cma.model=cma.model)
and				cmo.model in  ('아반테' , '소나타', 'A8');

-- 사원번호, 사원명, 연봉, 입사일, 부서번호, 부서명, 위치, 우편번호,
-- 시도, 구군, 동, 번지를 조회하세요.
-- 사원테이블의 사원번호와 우편번호 테이블의 seq 를 조인조건으로 사용하세요.
      select * from user_constraints;
--ansi

--반복연습--

select           e.EMPNO, e.ENAME, e.SAL, e.HIREDATE, e.DEPTNO,d.LOC , z.SEQ,
					 z.SIDO, z.GUGUN, z. DONG
from	  			emp  	e
inner join 		dept 		d
on               e.deptno=d.deptno
inner join		zipcode   z
on 			z. seq = e.empno
where 	z.seq in (e.empno);




--orcle
select           e.EMPNO, e.ENAME, e.SAL, e.HIREDATE, e.DEPTNO,d.LOC , z.SEQ,
					 z.SIDO, z.GUGUN, z. DONG
from	  			emp  	e   ,    dept 		d    ,  zipcode   z
where 		 ( 	  e.deptno=d.deptno and z. seq = e.empno) and z.seq in(e.empno);
