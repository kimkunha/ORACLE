-- view를 생성할려면 관리자 계정을 가진 계정의 view
-- 생성 권한을 부여 해야한다
-- 관리자 계정이 권한 부여  (도스창 들어가서  관리자계쩡으로 접속해  'scott'에 권한 주기 하면된다

create view test_view as(select*from emp);    -- 권한없음--

grant create view to 계정명;   --도스창에서 하면됨--


-- 단순 view 생성 ( 테이블 하나로 생성된 view)

create view emp_view as (Select* from cp_emp3);

select * from user_views;

select * from emp_view;
select * from cp_emp3;          --둘다 같은 창이 나옴--

-- view DML

insert into emp_view(empno,ename,deptno,job,sal)
values(1234,'오영근','20','과장',4000);

-- update
update      emp_view
set                job='차장', sal=4100
where       empno=1234;


 --삭제
delete from  emp_view
where empno=1234;
-- 단순 view는 테이블 명령어 와 똑같이 쓴다. update, delete 똑같이 쓰듯이 씀


--view 삭제
drop view emp_view;
select * from emp_view;


-- 단순 view (하나의 테이블에 몇개의 컬럼으로 view생성)
-- cp_emp3테이블의 사원번호, 사원명, 직무, 연봉으로 view생성
create view emp_view as
		(Select empno, ename, job, sal from cp_emp3);

select * from user_views;

-- view에 포함되지 않은 컬럼은 insert를 수행하면 null이 입력된다.
insert into emp_view(empno, ename, job, sal)
values(1234,'오영근','차장',4100);
select * from emp_view;
select * from cp_emp3;  --null이 생성된것을 확인--


-- 복합 view : 테이블 여러개를 사용하여 생성한 view,
--					조회할때 함수를  사용하여 조회한 결과로 생성한 view

-- 복합 view는 insert, update, delete가 수행되지 않는다.
-- 여러개의 테이블을 모으고 단순 select를 사용하여 조회 할때.

create view car_view as
(select cma.maker, cma.model,cmo.car_year, cmo.price,
cmo.cc, cmo.car_option
from car_maker cma, car_model cmo
where cmo.model=cma.model);

select * from user_views;
-- view를 사용하면 join된 결과를 단순 쿼리로 얻을 수 있다.
select	maker, model, car_year,price, cc, car_option
from		car_view
where maker = '현대';


-- 복합 view는 insert, update, delete 할수 없다.
insert into car_view(maker,model, car_year, price,cc,car_option)
values('현대','벨로스터',2017,3000,1999,'문짝3개,abs');

-- 단순 view에 insert, update, delete 막기 view 생성시 with read only
create view read_emp as
(select * from cp_emp2) with read only;

select * from user_views;

select * from read_emp;

-- with read only 옵션을 사용한 view는 추가, 삭제, 변경을 할수 없다.
insert into read_emp(empno, ename, hiredate, sal)
values(1234,'오영근',sysdate,5000);
