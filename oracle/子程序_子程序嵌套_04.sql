create or replace procedure inser_stu(
  stuID in STUDENT.SNO%TYPE,
  stuName in STUDENT.SNAME%TYPE,
  stuAge in STUDENT.SAGE%TYPE
) 
as
  status int;
  -- ���涨��һ���洢����
  PROCEDURE ChechisHave (tuID in char)
  as
    ccount_stu int;
   begin 
     select count(*) into ccount_stu from STUDENT where SNO=stuID;
   end;
begin
   null;
end;


-- ���û��ʲô��