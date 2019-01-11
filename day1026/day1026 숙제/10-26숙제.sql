/*숙제
1. 사원 테이블에서 사원번호,사원명, 연봉, 보너스를 조회
   단, 사원 번호를 내림차순 정렬 했을 때 3~5사이의 레코드만 출력 하고
      연봉은 7자리로 맞춰 출력하고 ,를 넣어 출력한다.
      해당 자리에 값이 없으면 0을 출력한다.
*/

 select rownum,r,empno,ename,to_char(sal,'9,999,999')comm from(select rownum r, EMPNO, ENAME, SAL, COMM from
(select EMPNO, ENAME, SAL, COMM from emp order by empno desc))
where r between 3 and 5;

 /*
 2. class4_info 테이블에서 번호, 이름 , 나이, 태어난 해를 조회 하세요.
   태어난 해는 현재년도-나이+1 로 구합니다.
*/

select NUM, NAME, AGE, to_number(INPUT_DATE,'yyyy')
 from CLASS4_INFO
