--  �Ű����� ���� �Լ� :  �������� ����Ͽ� 10�ڸ���
--  1�� �����ϴ� ���������� ���ڿ��� ��ȯ�ϴ� �Լ�
-- ���������� ������ 'ITEM_0001'
create or replace function item_num
return char
is
	temp_num char(10);
	seq_num number;
	--
begin
-- 1��° ���
--	select	seq_item.nextval
--	into		seq_num
--	from	dual;
-- 2��° ��� (�� ��õ)
	seq_num := seq_item.nextval;
	                
	temp_num := concat('item_',lpad(Seq_num,5,0));
	
	return temp_num;
	

end;
/
