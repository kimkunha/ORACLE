-- update subquery : 다른 테이블의 값을 참조하여 현재 테이블의
-- 값을 변경할때

-- 단수행
-- cp_emp3테이블에서 사원번호가 '1111'인 사원의 연봉을
-- emp테이블의 사원번호가 '7788'인 사원의 연봉으로 변경.
update cp_emp3
set sal=(select sal from emp where empno=7788)
where empno=1111;

-- 단수행 서브쿼리에 복수행이 발생하면 error
update cp_emp3
set sal=(select sal from emp)
where empno=1111;

-- 컬럼을 여러개 조회하면 Error
update cp_emp3
set sal=(select sal,dptno from emp where empno=7788)
where empno=1111;

-- 복수행 서브쿼리는 in를 사용하여 where절에 사용
insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222,'테스트',30,'SALESMAN',2000);
commit;
-- cp_emp3테이블에서  emp테이블의 부서번호가 30번인 모든사원
--들의 사원번호가 같은 사원의 연봉을 '1000'으로 변경

-- 푸는방법 : 먼저 emp테이블의 30번인 모든사원의 사원번호
--select empno from EMP where deptno=30;  을구한다
--
update 		cp_emp3
set 			sal = 1000
where   	empno in (select empno from EMP where deptno=30);


---------------------------------------------------------------------------

-- delete subquery

--------------------------------------------------------------------------------
-- 다른 테이블의 값을 참조하여 현재 테이블 레코드 삭제
-- 단수행
update cp_emp3
set ename = '블랑카'
where empno =7698;
commit;

-- cp_emp3 테이블에서 사원정보를 삭제
-- 삭제조건 : emp테이블의 사원명이 'blake'인 사원의 사원번호
-- 같은 사원을 cp_emp3테이블에서 삭제

delete from 	cp_emp3
where 			empno=(select empno from emp where ename='BLAKE');

-- 복수행 :
-- cp_emp3테이블에서  emp테이블의 부서번호가 30번인 모든사원
--들의 사원번호와 같은 사원을 삭제
delete from	 cp_emp3
where 			empno in (select empno from emp where deptno=30);



select * from CP_EMP3
