select * from cp_emp3;

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1112,'이재찬',10,'대리',3500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1113,'이재현',20,'차장',7500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1114,'이호정',20,'알바',1500);
 commit;

insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222,'텍스트',20,'saleman',2000);

-- emp : 미국본사, cp_emp3 : 한국지사

-- 미국본사와 한국지사의 연봉이 2000이하인 사원급여를
-- 올려주고 싶어 2000이하인 사원의 사원번호, 사원명, 연봉, 직무
-- 를 조회
-- union : 중복데이터가 조회되지 않는다.
-- union all : 중복데이터가 조회된다.
select*from emp;

select 		empno, ename, sal, job
from         emp
where 		sal<=2000
union  all
select    	empno, ename, sal, job
from         cp_emp3
where       sal <= 2000;           -- 가운데 union를 넣으면 결과가 같이 합산되어 나옴--


-- 컬럼의 갯수가 일치하지 않거나 데이터형이 일치하지 않으면 ERROR발생

select 		empno, ename, sal, job
from         emp                                          --위의 컬럼이 4개인데
where 		sal<=2000                                 -- 아래 컬럼은 3개 라서 ERROR발생한다.
union  all
select    	empno, ename, sal
from         cp_emp3
where       sal <= 2000;


-- 컬럼의 데의터형이 일치하지 않는 경우

select 		empno, ename, sal, job          -- 컬럼의 데이터형이 같은자리에 옴겨도 에러  안남
from         emp                                        -- 하지만  데이형이 다른 자리로 옮길경우 에러
where 		sal<=2000
union  all                                                -- 여기서의 에러는 위에 sal은 number형인데
select    	 sal,job,  ename,empno          -- enaeme은 varchar2라서 에러 발생
from         cp_emp3                                 -- 대응하는 식과 같은 데이터 유형이여하 한다 --
where       sal <= 2000;


------------------------------------------------------------------------------

---   intersect :
-- 미국본사의 사원정보와 한국지사의 사원정보중 일치하는 정보만 조회



select 		empno, ename, sal, job
from         emp
where 		sal<=2000

intersect

select    	empno, ename, sal, job
from         cp_emp3
where       sal <= 2000;

---------------------------------------------------------------------------

-- minus : 상위 select에서 조회된 결과를 하위 select에서 조회된
--              결과에서 뺀 나머지 를 조회한다


select 		empno, ename, sal, job
from         emp               --14개--


minus

select    	empno, ename, sal, job
from         cp_emp3
where       sal <= 2000;


select * from CP_EMP3;


update car_model
set        car_img='qm5_001.jpg'
where	car_img='qm5_001.jpg, qm5_002jpg';



update car_model
set        car_img='qm5_003.jpg'
where	car_img='qm5_003.jpg, qm5_004jpg';



update car_model
set        car_img='qm5_005.jpg'
where	car_img='qm5_005.jpg, qm5_006jpg';


commit;
-- cp_emp3 에 emp테이블의 30번 부서 사원정보를 모두 추가
insert into cp_emp3(empno, ename, deptno, job, sal)      -- subquery 복습하기- --
(select empno, ename, deptno, job, sal  from emp
where deptno='30');
commit;











