/*����
1. ��� ���̺��� �����ȣ,�����, ����, ���ʽ��� ��ȸ
   ��, ��� ��ȣ�� �������� ���� ���� �� 3~5������ ���ڵ常 ��� �ϰ�
      ������ 7�ڸ��� ���� ����ϰ� ,�� �־� ����Ѵ�.
      �ش� �ڸ��� ���� ������ 0�� ����Ѵ�.
*/

 select rownum,r,empno,ename,to_char(sal,'9,999,999')comm from(select rownum r, EMPNO, ENAME, SAL, COMM from
(select EMPNO, ENAME, SAL, COMM from emp order by empno desc))
where r between 3 and 5;

 /*
 2. class4_info ���̺��� ��ȣ, �̸� , ����, �¾ �ظ� ��ȸ �ϼ���.
   �¾ �ش� ����⵵-����+1 �� ���մϴ�.
*/

select NUM, NAME, AGE, to_number(INPUT_DATE,'yyyy')
 from CLASS4_INFO
