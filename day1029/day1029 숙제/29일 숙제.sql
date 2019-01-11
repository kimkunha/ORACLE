/*1. 아래의 조건에 맞는 테이블을 생성하고 적절한 제약사항을 부여한후
   모든 제약조건에 성공하는 경우와 각각의 경우에 따라 실패하는
   모든 쿼리문을 작성하세요.

   부서번호, 사원명, 연봉, 이메일,전화번호, 성별,주소, 입사일, 사원번호를
   저장하는 테이블을 생성.

   제약사항
   - 부서번호는 숫자 두자리 이며 dept 테이블의 deptno만 입력할 수 있다.
   - 사원명은 가변길이형이고 한글로 10글자 까지 입력가능하며,
       반드시 입력해야한다.
   - 연봉은 숫자이고 억단위의 입력이 가능하다. 입력가능 연봉은
     2400~8000까지 입력가능
   - 이메일,전화번호는 없을 수도 있지만 있다면 유일하다.   -> unique
   - 성별은 남자또는 여자만 입력가능하다.                         -> check
   - 주소는 없을 수도 있다.
   - 입사일은 날짜형식이며, 추가할 때 입사일이 null이라면
      현재 날짜가 입력되어야한다.
   - 사원번호는 숫자 4자리이며 null을 허용하지 않고 중복데이터를
     저장할수 없다.
*/

-- 모든 에러상황과 성공상황에 대해 쿼리문을 작성한 후
 -- foreign key 해당하는 제약사항을 비활성화 시킨 후 삭제를 해보세요.

create table 		work_1029  (
						deptno number(2)  constraint fk_deptno1 references dept(deptno) ,
						ename varchar2(30) not null,

						sal number(9)     constraint pk_work1029 check(sal between 2400 and 8000),

						email varchar2(30)  constraint uk_eamil2 unique,
						tel varchar2(10)        constraint uk_tell2 unique,
						gender varchar(6) constraint c_gender check(gender ='남자' or gender ='여자'),
						ssn varchar2(50) null,
						input_date date     default sysdate,
						empno char(4) constraint  pk_work10291 primary key
						);


						select * from user_constraints;
