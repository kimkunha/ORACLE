--숙제.
/*1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
    이미지,입력일,배기량, 옵션을 조회
   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
     입력일은 월-일-년 의 형식으로 출력 할것.*/


select r,cc, country,maker,model,to_char(car_year,'9,999,999') car_year,to_char(price,'9,999,999') price,car_IMG,
to_char(hiredate,'mm"월"-dd"일"-yy"년"') hiredate ,substr(car_option,1,instr(car_option,',')) car_option from(select rownum r,cc, country,maker,model,car_year,price,car_IMG,
hiredate,car_option from(select   CMO.CC , CC. COUNTRY, CC.MAKER , CMO.MODEL,
                         CMO.CAR_YEAR , CMO.PRICE, CMO.CAR_IMG  , CMO.HIREDATE,
                         CMO.CAR_OPTION
from 				 CAR_COUNTRY    CC,
						CAR_MAKER 	CMA,
						CAR_MODEL        CMO
WHERE            (CC.MAKER = CMA.MAKER AND CMA.MODEL=CMO.MODEL)
AND					      CMO.CC  BETWEEN 1500 AND 3000 order by cc desc))
where r between 3 and 6;





/*2. 부서번호가 10과 30,40번인 모든 부서의 사원번호,사원명,입사일,
   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
  하여 출력 ,입사일은 월-일-년 요일까지 출력
*/

select r,empno, ename, to_char(hiredate,'mm-dd-yyyy dy'), sal, dname, deptno, loc, sido,gugun, row_number( ) over (order by sal asc)  sal_rank,
dong,nvl(bunji,'번지없음')zipcode from(select rownum r, empno, ename, hiredate, sal, dname, deptno, loc, sido,gugun,
dong,bunji,zipcode from(select e.empno, e.ename, e.hiredate, e.sal, d.dname, e.deptno,
						d.loc,  z.sido, z.gugun, z.dong, z.bunji, z.zipcode
from				DEPT d, EMP e, ZIPCODE  z
where (e.deptno(+)= d.deptno and z.seq = e.empno)
and (e.deptno = 10 or e.deptno = 30 or e.deptno = 40)
              order by e.empno ))
where r between 2 and 5  ;


/*
3. /차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고/ 옵션에 'ABS','TCS'가
 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회

  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
*/
select cc.country, cma.maker,  initcap(cma.model), cmo.car_option,
			substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) "이미지명",
			substr(cmo.car_img,instr(cmo.car_img,'.')) "확장자",cmo.cc
from   car_country cc, car_maker cma, car_model cmo
where   (cc.maker = cma.maker and cma.model =  cmo.model)
and  (cc.maker in ('현대','기아','삼성','BMW','AUDI'))
and (car_option   like '%ABS%' or car_option like '%TCS%')
order by cmo.car_year desc ,  cmo.price asc;




select * from ZIPCODE;



/*
4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 모델명, 제조국,
  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
  단, 출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며,
   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.
*/


select  '['||MODEL||']차량의 연식은['|| car_year||']이고, 제조국은['||country||']이며 ['||maker||']사가 제조사 입니다.['||to_char(price,'9,999')||',000'||'] 입니다.' from(select rownum r,model, country, maker, price, car_year
from(select cmo.MODEL, cc.COUNTRY, cma.MAKER, cmo.PRICE,cmo. CAR_YEAR
from	 CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where (cc.maker = cma.maker and cma.model =cmo.model) and cmo.model in ( 'K5','아반테', '소렌토','A8','SM3')
order BY CMO.price ASC ))
where r between 2 AND 7;







/*
5. 제조사가 '현대'인 차량의 년식, 모델명, 연식별 총가격을 조회.*/

select
from		CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo











/*
6. 사원명이 'S'로 끝나거나 이름5자이면서 세번째 글자가 'A'인
   사원의  사원번호, 사원명, 입사일,연봉,세금, 실수령액, 연봉인상액,
   부서번호,부서명,위치,우편번호,시도, 구군,동,번지 를 조회
   단,실수령액은 연봉+퇴직금+보너스-세금(연봉 3.3) 로 계산
     연봉인상액은 부서번호에 따라 차등 인상
     10- 년봉 7%, 20- 년봉 4%, 30- 년봉+보너스 10%, 그외 3%로
     계산하여 3자리마다 ,를 넣어 출력.
     모든 영어는 소문자로 출력.*/












