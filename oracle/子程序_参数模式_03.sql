-- �ӳ������ģʽ
/*
 IN  Ĭ����ֵ���� ��ʽ���� default valueҲ�� inģʽ
 OUT �ս���ֵ����
 IN OUT ��ַ����  ��������

*/
---------------------------------------------------------
-- IN ģʽ
---------------------------------------------------------


--��ѯһ��ѧ�� �ɼ���һ�������ϵĿγ�������.
create or replace function ccount(
  stuID IN CHAR,
  stu_Grade number default 60  --Ĭ��ֵ
  )
return int
as
   counts number;
begin
   select count(*) into counts from SC where trim(SNO)=trim(stuID) and GRADE>=stu_Grade;
   return counts;
end;

-- ���Ե���
select ccount('006') from dual;

-- �ӳ������
declare
   counts int;
begin
   -- Ĭ��ֵ����
   DBMS_OUTPUT.PUT_LINE('ѧ��Ϊ008��ѧ���ĳɼ���Լ70�ֵĿγ���ĿΪ:'|| ccount('008',70));
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;


---------------------------------------------------
--- out ģʽ
---------------------------------------------------

create or replace function ccount(
  stuID IN CHAR,
  count_c out number,
  stu_Grade number default 60 --Ĭ��ֵ
  )
return int
as
   counts number;
begin
   select count(*) into count_c from SC where trim(SNO)=trim(stuID) and GRADE>=stu_Grade;
   return -10;
end;




-- ���ò���
declare
   counts int;
   csd int;
begin   
   csd:=ccount('008',counts,70);
   DBMS_OUTPUT.PUT_LINE('ѧ��Ϊ008��ѧ���ĳɼ���Լ70�ֵĿγ���ĿΪ:'||counts);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;












