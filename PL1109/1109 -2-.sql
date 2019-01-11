select   utc.constraint_name,   utc. column_name,
           (select distinct data_type from user_tab_columns
           	where user_tab_columns.column_name
           		=utc. column_name and table_name='EMP') data_type
		from user_constraints uc, user_cons_columns utc
		where (uc.constraint_name=utc.constraint_name 	) and
   			 utc.table_name ='EMP'      ;

select distinct data_type from user_tab_columns
           	where table_name='EMP'     ;

           	select  data_type from user_tab_columns
           	where user_tab_columns.column_name
           		='DEPTNO' and  table_name='EMP' ;
