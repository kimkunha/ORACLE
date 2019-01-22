--�ֹ���ȣ, ���ö��ڵ�, ���ö��̸�, �ֹ��ڸ�, ����, ����, �ֹ���, ����ó, ip, ���ۻ���
select o.order_num, l.lunch_code, l.lunch_name, o.order_name, o.quan,
		l.price, to_char(o.order_date,'yyyy-mm-dd hh:mm:ss') order_date,
		o.phone, o.ip_address,o.status
from  lunch l, ordering o
where o.lunch_code = l.lunch_code
		and to_char(order_date, 'yyyy-mm-dd') = to_char(sysdate,'yyyy-mm-dd')
		and to_char(order_date,'hh24') <= 13;
order by o.order_num asc;
