----1.  class4 강의장의 학생들의 교통요금을 구하는  PL/SQL을 제작
--   하고자한다.  대중교통수단 요금은 아래와 같으며
--   [버스 : 1200원,  지하철 :1250원] , 10키로를 초과하면 매4키로마다
--  100원의 요금 더 부과된다.
--  이 정보를 이용하여 아래 학생들의 데이터를 처리하세요
--  데이터.
-- 1, 김정운, 서울시 강남구 역삼동, 5키로, 버스
--  2, 김희철, 인천시 남동구 구월동, 20키로, 지하철
--  3, 이재찬, 인천시 부평구 부평동, 16키로, 지하철
--  4, 박영민, 서울시 관악구 봉천동, 10키로, 지하철
--  5, 정택성, 서울시 동대문구 동대문동, 8키로, 버스
--
--   출력
--   번호, 이름,  주소, 거리, 교통수단, 기본요금, 총요금
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
   class4_tab(1).name := '김정운';
   class4_tab(1).addr := '서울시 강남구 역삼동';
   class4_tab(1).km := 5;
   class4_tab(1).traffic := '버스';

   class4_tab(2).num := 2;
   class4_tab(2).name := '김희철';
   class4_tab(2).addr := '인천시 남동구 구월동';
   class4_tab(2).km := 20;
   class4_tab(2).traffic := '지하철';

   class4_tab(3).num := 3;
   class4_tab(3).name := '이재찬';
   class4_tab(3).addr := '인천시 부평구 부평동';
   class4_tab(3).km := 16;
   class4_tab(3).traffic := '지하철';

   class4_tab(4).num := 4;
   class4_tab(4).name := '박영민';
   class4_tab(4).addr := '서울시 관악구 봉천동';
   class4_tab(4).km := 10;
   class4_tab(4).traffic := '지하철';

   class4_tab(5).num := 5;
   class4_tab(5).name := '정택성';
   class4_tab(5).addr := '서울시 동대문구 동대문동';
   class4_tab(5).km := 8;
   class4_tab(5).traffic := '버스';

traf := 0;
addtax := 0;
for i in 1 .. class4_tab.count loop
if class4_tab(i).traffic = '버스' then traf :=1200;
elsif class4_tab(i).traffic = '지하철' then traf :=1250; end if;   


if class4_tab(i).km > 10 then
addtax :=substr(((class4_tab(i).km - 10) / 4), 1, 1) * 100;
end if;                       
        
dbms_output.put_line(class4_tab(i).num||',  '||class4_tab(i).name||',  '||class4_tab(i).addr||',    '||
class4_tab(i).km||',  '||class4_tab(i).traffic||'  '||to_char(traf,'999,999')||'  '||to_char(traf+addtax, '999,999'));
addtax := 0;
end loop; 
end;  
/


