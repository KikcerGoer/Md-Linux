-- ����

-- �﷨
create or replace function(����)
return ����ֵ����
[authid |definer|current_user]
as|is
begin
 
 exception
 
end;
-- �޲�������
---------------------------------
create or replace function stu_avg_grade
 return NUMBER --����û�ж���
 as 
  --����û��declare
   sum_avg_avg number;
 begin
    --select avg(sum_avg) into sum_avg_avg from STUDENT;
    return 30;
 end;


-- ����������
-----------------------------------
create or replace function fc_get_avgcount(stuID varchar)
return number  
as
   isHave int;
   avgGrade number;
begin
   select count(*) into isHave from SC where trim(SNO) =stuID;
   if isHave <= 0 then
      return 8;
   else
     select avg(GRADE) into avgGrade from sc where SNO ='008';
     
     return avgGrade;
   end if;
end;
----------
set serveroutput on;


-- ���ú���
select stu_avg_grade() from dual;

-- PLSQL�� ����
declare
   interesting int;
begin
   interesting :=stu_avg_grade();
   DBMS_OUTPUT.put_line('ƽ����:'||interesting);
   Exception when others then
    DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;




