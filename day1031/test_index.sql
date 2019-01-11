-- �ε��� ��ȸ
select * from user_indexes;

create table cp_zipcode as (Select * from zipcode);

select count(*) from cp_zipcode;
select count(*) from zipcode;

-- cp_zipcode ���̺��� seq�÷���  unique index ����
create unique index idx_zipcode on cp_zipcode(seq);

drop index idx_zipcode;

select*from user_indexes;

-- �ε����� ������� �ʴ� ��ȸ
select zipcode,sido,gugun,bunji,seq
from zipcode
where seq=49000;

-- �ε����� ����� ��ȸ
 select /*+ ordered index (idx_zipcode)*/zipcode,sido,gugun,bunji,seq
from cp_zipcode
where seq=49000;


 select /*+ ordered index (idx_zipcode)*/zipcode,sido,gugun,bunji,seq
from cp_zipcode
where zipcode='402-866';

-- �����ȣ�� �ߺ������� ��Ư�� ���¸� ������.
create index bit_zipcode on cp_zipcode(zipcode);
select * from user_indexes;

-- �ε����� ������� �ʴ� ��ȸ (full scan)
select zipcode,sido,gugun,bunji,seq
from zipcode
where zipcode='402-866';

select * from user_indexes;

-- �ε����� �������̺��� ����Ǹ� ��������� �������� �ʴ´�.
-- ���̺�� �ε����� �����ϰ� ���ߴ� ����
 alter index idx_zipcode rebuild;
