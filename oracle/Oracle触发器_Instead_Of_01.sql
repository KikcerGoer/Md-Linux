/*
 ��ͼֻ�ܹ�ʹ��instead of
 �Ը��ƶ������ ����һ�в��� ��Ҫʹ��instead of ������

 */
 
 -- ����һ����ͼ
create or replace view stuinfo
as
select ROWNUM as ID,Student.SNAME,Student.SNO,Student.SUM_AVG,Student.SSEX,Student.SDEPT,SC.GRADE from  Student inner join SC on SC.SNO=STUDENT.SNO;
 
set SERVEROUTPUT ON; 
 
create or replace trigger view_trigger_insteadof
instead of delete on stuinfo
for each row
declare
    userrow stuinfo%ROWTYPE;
begin
   delete from SC where SNO=:OLD.SNO;
   delete from STUDENT where SNO=:OLD.SNO;
   DBMS_OUTPUT.PUT_LINE('ɾ��ѧ��:'||:old.SNAME);

end;

/*
 
  ��ͼ �������ʹ��:old ��:new
*/

desc stuinfo;
-- ����
delete from stuinfo where SNO='001';

rollback;

select * from stuinfo;















