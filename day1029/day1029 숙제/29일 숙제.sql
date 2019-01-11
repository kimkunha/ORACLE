/*1. �Ʒ��� ���ǿ� �´� ���̺��� �����ϰ� ������ ��������� �ο�����
   ��� �������ǿ� �����ϴ� ���� ������ ��쿡 ���� �����ϴ�
   ��� �������� �ۼ��ϼ���.

   �μ���ȣ, �����, ����, �̸���,��ȭ��ȣ, ����,�ּ�, �Ի���, �����ȣ��
   �����ϴ� ���̺��� ����.

   �������
   - �μ���ȣ�� ���� ���ڸ� �̸� dept ���̺��� deptno�� �Է��� �� �ִ�.
   - ������� �����������̰� �ѱ۷� 10���� ���� �Է°����ϸ�,
       �ݵ�� �Է��ؾ��Ѵ�.
   - ������ �����̰� ������� �Է��� �����ϴ�. �Է°��� ������
     2400~8000���� �Է°���
   - �̸���,��ȭ��ȣ�� ���� ���� ������ �ִٸ� �����ϴ�.   -> unique
   - ������ ���ڶǴ� ���ڸ� �Է°����ϴ�.                         -> check
   - �ּҴ� ���� ���� �ִ�.
   - �Ի����� ��¥�����̸�, �߰��� �� �Ի����� null�̶��
      ���� ��¥�� �ԷµǾ���Ѵ�.
   - �����ȣ�� ���� 4�ڸ��̸� null�� ������� �ʰ� �ߺ������͸�
     �����Ҽ� ����.
*/

-- ��� ������Ȳ�� ������Ȳ�� ���� �������� �ۼ��� ��
 -- foreign key �ش��ϴ� ��������� ��Ȱ��ȭ ��Ų �� ������ �غ�����.

create table 		work_1029  (
						deptno number(2)  constraint fk_deptno1 references dept(deptno) ,
						ename varchar2(30) not null,

						sal number(9)     constraint pk_work1029 check(sal between 2400 and 8000),

						email varchar2(30)  constraint uk_eamil2 unique,
						tel varchar2(10)        constraint uk_tell2 unique,
						gender varchar(6) constraint c_gender check(gender ='����' or gender ='����'),
						ssn varchar2(50) null,
						input_date date     default sysdate,
						empno char(4) constraint  pk_work10291 primary key
						);


						select * from user_constraints;
