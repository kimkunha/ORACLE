

-- sys_refcursor�� ���
 var cur_dept refcursor;

 -- sys_refcursor �� ����
 exec		select_all_dept(:cur_dept);

 -- ���
 print cur_dept;
