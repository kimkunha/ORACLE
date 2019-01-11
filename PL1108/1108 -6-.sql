

-- sys_refcursor의 사용
 var cur_dept refcursor;

 -- sys_refcursor 를 저장
 exec		select_all_dept(:cur_dept);

 -- 출력
 print cur_dept;
