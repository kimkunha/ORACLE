----1.  class4 �������� �л����� �������� ���ϴ�  PL/SQL�� ����
--   �ϰ����Ѵ�.  ���߱������ ����� �Ʒ��� ������
--   [���� : 1200��,  ����ö :1250��] , 10Ű�θ� �ʰ��ϸ� ��4Ű�θ���
--  100���� ��� �� �ΰ��ȴ�.
--  �� ������ �̿��Ͽ� �Ʒ� �л����� �����͸� ó���ϼ���
--  ������.
-- 1, ������, ����� ������ ���ﵿ, 5Ű��, ����
--  2, ����ö, ��õ�� ������ ������, 20Ű��, ����ö
--  3, ������, ��õ�� ���� ����, 16Ű��, ����ö
--  4, �ڿ���, ����� ���Ǳ� ��õ��, 10Ű��, ����ö
--  5, ���ü�, ����� ���빮�� ���빮��, 8Ű��, ����
--
--   ���
--   ��ȣ, �̸�,  �ּ�, �Ÿ�, �������, �⺻���, �ѿ��
set serveroutput on


declare
type stu_record is record(
   num number,
   name varchar2(30),
   addr varchar2(35),
   km number,
   traffic varchar2(9)
   );
   type stu_table is table of stu_record index by binary_integer;
   class4_tab stu_table;

   traf number;
   addtax number;



begin
   class4_tab(1).num := 1;
   class4_tab(1).name := '������';
   class4_tab(1).addr := '����� ������ ���ﵿ';
   class4_tab(1).km := 5;
   class4_tab(1).traffic := '����';

   class4_tab(2).num := 2;
   class4_tab(2).name := '����ö';
   class4_tab(2).addr := '��õ�� ������ ������';
   class4_tab(2).km := 20;
   class4_tab(2).traffic := '����ö';

   class4_tab(3).num := 3;
   class4_tab(3).name := '������';
   class4_tab(3).addr := '��õ�� ���� ����';
   class4_tab(3).km := 16;
   class4_tab(3).traffic := '����ö';

   class4_tab(4).num := 4;
   class4_tab(4).name := '�ڿ���';
   class4_tab(4).addr := '����� ���Ǳ� ��õ��';
   class4_tab(4).km := 10;
   class4_tab(4).traffic := '����ö';

   class4_tab(5).num := 5;
   class4_tab(5).name := '���ü�';
   class4_tab(5).addr := '����� ���빮�� ���빮��';
   class4_tab(5).km := 8;
   class4_tab(5).traffic := '����';

traf := 0;
addtax := 0;
for i in 1 .. class4_tab.count loop
if class4_tab(i).traffic = '����' then traf :=1200;
elsif class4_tab(i).traffic = '����ö' then traf :=1250; end if;   


if class4_tab(i).km > 10 then
addtax :=substr(((class4_tab(i).km - 10) / 4), 1, 1) * 100;
end if;                       
        
dbms_output.put_line(class4_tab(i).num||',  '||class4_tab(i).name||',  '||class4_tab(i).addr||',    '||
class4_tab(i).km||',  '||class4_tab(i).traffic||'  '||to_char(traf,'999,999')||'  '||to_char(traf+addtax, '999,999'));
addtax := 0;
end loop; 
end;  
/


