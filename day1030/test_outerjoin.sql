-- outer join : ��� ���� ���̺��� ���ڵ尡 �����ص� ��ȸ
-- ��� �μ��� �μ���ȣ, �μ���, �����ȣ, �����, �Ի��� ��ȸ

--ANSI ) ���� ������ : left�� right�� ����Ҷ� ���ڵ尡 �ִ� �� ���̺� ����
-- ���ڵ��� ������ �� �𸥴ٸ� full outer join�� �Ͽ�  ó��
select      d.deptno, d.dname, e.empno, e.ename, e.hiredate
from    dept   d
left outer join      emp   e
on         e.deptno = d.deptno;

select      d.deptno, e.deptno,d.dname, e.empno, e.ename, e.hiredate
from   			dept d   left join       emp e
on         e.deptno = d.deptno;

-- ���� ���ʱ������� left �������̸� right

select      d.deptno, e.deptno,d.dname, e.empno, e.ename, e.hiredate
from   					emp e
full outer join       dept d
on         e.deptno = d.deptno;


-------------------------------------------------------------------------

-- oracle : �������ǿ� ���ڵ尡 ���� �ʿ� (+)�� ���δ�.

 select      		d.deptno, e.deptno,d.dname, e.empno, e.ename, e.hiredate
from   					emp e   ,dept d
where				(e.deptno(+) = d.deptno);      --oracle join�� full outer join �ȵ�--



-- �����簡 '����', '���'�� ��� ������ ������, ������, �𵨸�, ����
-- ����, �ɼ��� ��ȸ�ϼ���

select  cc.country, cc.MAKER, cma.MODEL , cmo.car_year, cmo.price,
			cmo.car_option
from     CAR_COUNTRY cc, CAR_MAKER cma, CAR_MODEL   cmo
where (cma.maker=cc.maker and cmo.model(+)=cma.model)
and cma.maker in('����','���');


-- �𵨸��� 'K5', 'k7', '�ҳ�Ÿ', '�ƹ���','Cclass', 'A6' �� ��� ������
-- ������, ������, �𵨸�, ����, ������ ��ȸ
-- ��, ������ ������������ �����Ͽ� ��ȸ�Ұ�, ������ ���ٸ�
-- ������ ������������ �����Ұ�

--ANSI
/*select    cc. COUNTRY, cc. MAKER, cmo. MODEL , cmo.MODEL ,
             cmo.CAR_YEAR
from  	 car_model    cmo
join		  car_maker   cma
on            cmo.

              CAR_COUNTRY   cc*/



----------------------------------------------------------------------

--   self join

-- ������̺��� scott�� ������� ������ �۰� �޴� �����
-- �����ȣ, �����, �Ի���, ����

select           e1.empno, e1.ename, e1.sal, e1. hiredate
from	    		emp e1,  emp e2
where           (e1. sal < e2. sal) and e2. ename='SCOTT';

select from



