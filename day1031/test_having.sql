-- group by having ��
-- having : �׷����� ���� ����
-- ������� 4�� �̻��� �μ��� �μ���ȣ, �����, ������, �ְ���
-- �� ��ȸ

select deptno, count(deptno), sum(sal),max(Sal)
from emp
group by deptno
having count(deptno)>4;

-- replace : ���� ġȯ
select   replace('������ ����� �Դϴ�.','������', '������')
from dual;

select   replace('���ü�,������,������,����ö','������','��õ���� �ڶ� ������' )
from dual;

select   replace('������ ������ �Դϴ�.','������', '������')
from dual;


