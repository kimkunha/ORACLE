select * from cp_emp3;

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1112,'������',10,'�븮',3500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1113,'������',20,'����',7500);

insert into cp_emp3(empno, ename, deptno, job, sal)
values(1114,'��ȣ��',20,'�˹�',1500);
 commit;

insert into cp_emp3(empno, ename, deptno, job, sal)
values(2222,'�ؽ�Ʈ',20,'saleman',2000);

-- emp : �̱�����, cp_emp3 : �ѱ�����

-- �̱������ �ѱ������� ������ 2000������ ����޿���
-- �÷��ְ� �;� 2000������ ����� �����ȣ, �����, ����, ����
-- �� ��ȸ
-- union : �ߺ������Ͱ� ��ȸ���� �ʴ´�.
-- union all : �ߺ������Ͱ� ��ȸ�ȴ�.
select*from emp;

select 		empno, ename, sal, job
from         emp
where 		sal<=2000
union  all
select    	empno, ename, sal, job
from         cp_emp3
where       sal <= 2000;           -- ��� union�� ������ ����� ���� �ջ�Ǿ� ����--


-- �÷��� ������ ��ġ���� �ʰų� ���������� ��ġ���� ������ ERROR�߻�

select 		empno, ename, sal, job
from         emp                                          --���� �÷��� 4���ε�
where 		sal<=2000                                 -- �Ʒ� �÷��� 3�� �� ERROR�߻��Ѵ�.
union  all
select    	empno, ename, sal
from         cp_emp3
where       sal <= 2000;


-- �÷��� ���������� ��ġ���� �ʴ� ���

select 		empno, ename, sal, job          -- �÷��� ���������� �����ڸ��� �Ȱܵ� ����  �ȳ�
from         emp                                        -- ������  �������� �ٸ� �ڸ��� �ű��� ����
where 		sal<=2000
union  all                                                -- ���⼭�� ������ ���� sal�� number���ε�
select    	 sal,job,  ename,empno          -- enaeme�� varchar2�� ���� �߻�
from         cp_emp3                                 -- �����ϴ� �İ� ���� ������ �����̿��� �Ѵ� --
where       sal <= 2000;


------------------------------------------------------------------------------

---   intersect :
-- �̱������� ��������� �ѱ������� ��������� ��ġ�ϴ� ������ ��ȸ



select 		empno, ename, sal, job
from         emp
where 		sal<=2000

intersect

select    	empno, ename, sal, job
from         cp_emp3
where       sal <= 2000;

---------------------------------------------------------------------------

-- minus : ���� select���� ��ȸ�� ����� ���� select���� ��ȸ��
--              ������� �� ������ �� ��ȸ�Ѵ�


select 		empno, ename, sal, job
from         emp               --14��--


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
-- cp_emp3 �� emp���̺��� 30�� �μ� ��������� ��� �߰�
insert into cp_emp3(empno, ename, deptno, job, sal)      -- subquery �����ϱ�- --
(select empno, ename, deptno, job, sal  from emp
where deptno='30');
commit;











