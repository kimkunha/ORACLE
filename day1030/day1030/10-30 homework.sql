--����.
/*1. ��ⷮ�� 1500~3000 ������ ������ ������,������,�𵨸�,���,����,
    �̹���,�Է���,��ⷮ, �ɼ��� ��ȸ
   ��. ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�,
     �ɼ��� ó�� ',' ������ ��� �Ұ�. ���ݰ� ������ 3�ڸ����� ,�� �־����,
     �Է����� ��-��-�� �� �������� ��� �Ұ�.*/


select r,cc, country,maker,model,to_char(car_year,'9,999,999') car_year,to_char(price,'9,999,999') price,car_IMG,
to_char(hiredate,'mm"��"-dd"��"-yy"��"') hiredate ,substr(car_option,1,instr(car_option,',')) car_option from(select rownum r,cc, country,maker,model,car_year,price,car_IMG,
hiredate,car_option from(select   CMO.CC , CC. COUNTRY, CC.MAKER , CMO.MODEL,
                         CMO.CAR_YEAR , CMO.PRICE, CMO.CAR_IMG  , CMO.HIREDATE,
                         CMO.CAR_OPTION
from 				 CAR_COUNTRY    CC,
						CAR_MAKER 	CMA,
						CAR_MODEL        CMO
WHERE            (CC.MAKER = CMA.MAKER AND CMA.MODEL=CMO.MODEL)
AND					      CMO.CC  BETWEEN 1500 AND 3000 order by cc desc))
where r between 3 and 6;





/*2. �μ���ȣ�� 10�� 30,40���� ��� �μ��� �����ȣ,�����,�Ի���,
   ����,��������,�μ���,�μ���ȣ,��ġ, �����ȣ,�õ�, ����,��,���� �� ��ȸ.
  ��,����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
   �����ȣ�� '-' �ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü
  �Ͽ� ��� ,�Ի����� ��-��-�� ���ϱ��� ���
*/

select r,empno, ename, to_char(hiredate,'mm-dd-yyyy dy'), sal, dname, deptno, loc, sido,gugun, row_number( ) over (order by sal asc)  sal_rank,
dong,nvl(bunji,'��������')zipcode from(select rownum r, empno, ename, hiredate, sal, dname, deptno, loc, sido,gugun,
dong,bunji,zipcode from(select e.empno, e.ename, e.hiredate, e.sal, d.dname, e.deptno,
						d.loc,  z.sido, z.gugun, z.dong, z.bunji, z.zipcode
from				DEPT d, EMP e, ZIPCODE  z
where (e.deptno(+)= d.deptno and z.seq = e.empno)
and (e.deptno = 10 or e.deptno = 30 or e.deptno = 40)
              order by e.empno ))
where r between 2 and 5  ;


/*
3. /������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰�/ �ɼǿ� 'ABS','TCS'��
 �ִ� ������  ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ

  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ ����
   �Ͽ� ���, �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
   ��������� ������ Bmw, Audi �� �������� ��� .
*/
select cc.country, cma.maker,  initcap(cma.model), cmo.car_option,
			substr(cmo.car_img,1,instr(cmo.car_img,'.')-1) "�̹�����",
			substr(cmo.car_img,instr(cmo.car_img,'.')) "Ȯ����",cmo.cc
from   car_country cc, car_maker cma, car_model cmo
where   (cc.maker = cma.maker and cma.model =  cmo.model)
and  (cc.maker in ('����','���','�Ｚ','BMW','AUDI'))
and (car_option   like '%ABS%' or car_option like '%TCS%')
order by cmo.car_year desc ,  cmo.price asc;




select * from ZIPCODE;



/*
4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ �𵨸�, ������,
  ������,����,������ �Ʒ��� ���� ������ �������� ���.
  ��, ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�,
   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.
*/


select  '['||MODEL||']������ ������['|| car_year||']�̰�, ��������['||country||']�̸� ['||maker||']�簡 ������ �Դϴ�.['||to_char(price,'9,999')||',000'||'] �Դϴ�.' from(select rownum r,model, country, maker, price, car_year
from(select cmo.MODEL, cc.COUNTRY, cma.MAKER, cmo.PRICE,cmo. CAR_YEAR
from	 CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL cmo
where (cc.maker = cma.maker and cma.model =cmo.model) and cmo.model in ( 'K5','�ƹ���', '�ҷ���','A8','SM3')
order BY CMO.price ASC ))
where r between 2 AND 7;







/*
5. �����簡 '����'�� ������ ���, �𵨸�, ���ĺ� �Ѱ����� ��ȸ.*/

select
from		CAR_COUNTRY cc, CAR_MAKER  cma, CAR_MODEL cmo











/*
6. ������� 'S'�� �����ų� �̸�5���̸鼭 ����° ���ڰ� 'A'��
   �����  �����ȣ, �����, �Ի���,����,����, �Ǽ��ɾ�, �����λ��,
   �μ���ȣ,�μ���,��ġ,�����ȣ,�õ�, ����,��,���� �� ��ȸ
   ��,�Ǽ��ɾ��� ����+������+���ʽ�-����(���� 3.3) �� ���
     �����λ���� �μ���ȣ�� ���� ���� �λ�
     10- ��� 7%, 20- ��� 4%, 30- ���+���ʽ� 10%, �׿� 3%��
     ����Ͽ� 3�ڸ����� ,�� �־� ���.
     ��� ����� �ҹ��ڷ� ���.*/












