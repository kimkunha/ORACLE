------------------------DDL for table lunch_adim ----------------------------
insert  into lunch_admin( id, pass, name)
values('admin', '1234', '������');
insert  into lunch_admin( id, pass, name)
values('lunch', '1234', '����ö');
insert  into lunch_admin( id, pass, name)
values('root', '1234', '�ڿ���');
commit;
------------------------DDL for table lunch ----------------------------
insert  into lunch(LUNCH_CODE, LUNCH_NAME, IMG, PRICE,SPEC, ID)
values(lunch_code, '��ũĥ��', 'm1_l1.gif',4500,'����� ������ ���������� ȯ���� ��������
 �پ��� ���� ������ �� �ִ� �κ� ������', 'admin');
 insert  into lunch(LUNCH_CODE, LUNCH_NAME, IMG, PRICE, SPEC, ID)
values(lunch_code, '���', 'm1_l2.gif',3800,'������ �����ϴ� ���!, SPEC
�ٻ�Ƣ�ܳ� Ƣ��ʾȿ� ������ ��⸦ ���� �����
�������� ����Ե�  ��� ������ȭ�� �κ� ������.
�ҽ����� �����ݴϴ�', 'admin');
commit;

select * from lunch;

------------------------DDL for table ordering	----------------------------
insert into ordering( ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code, 1, '������', '010-3456-4567','211.63.89.133', 'L_000001');

insert into ordering( ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code, 3, '������', '010-2412-8514','211.63.89.157', 'L_000001');

insert into ordering( ORDER_NUM, QUAN, ORDER_NAME, PHONE, IP_ADDRESS, LUNCH_CODE)
values(order_code, 1, '������', '010-1231-4231','211.63.89.135', 'L_000002');
commit;


select * from ordering;
