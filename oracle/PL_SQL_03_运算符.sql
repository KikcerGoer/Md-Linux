/*********** --------------- PL/SQL ����� -------------- *************/

-- ��ֵ���㷨  into  :=


declare
   v_Id varchar(20);
   v_user_name  varchar(20);
   v_count int:=0;
begin
   v_id:='2017110418';
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- ��������� || �ַ�������  ����+ �û�||


-- ��ϵ���㷨 > < <= >= = != <>
-- null is null  is not null
-- �߼� and or not
-- between and 
-- in 
-- like

declare
   val_ varchar(50):='vallist valkk val';
begin
   if INSTRB(val_,'val') >0 then
      DBMS_OUTPUT.PUT_LINE('����');
  end if;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

