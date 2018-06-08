/************************* ------------ - PL/SQL ���� - ----------- *************************/
 -- 1. ���峣��

declare 
   v_name varchar(20);
   v_id varchar(20);
begin
   --Ϊ������ֵ :=
   v_id:='2017110418';
   select USER_NAME into v_name from users where user_id=v_id; 
   dbms_output.put_line(v_name);
end;

 -- 2. ����ǿձ���
 --    ������ �ͱ���Ҫ��ֵ 
declare 
   v_name varchar(20) not null:='2015'; -- 
   v_id varchar(20);
begin
   v_id:='2017110418'; --�����ܲ����ҵ�һ����Ч���û�  ���涼����Ҫ��ֵ
   select USER_NAME into v_name from users where user_id=v_id; 
   dbms_output.put_line(v_name);  
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- 4. constant ���峣��

declare 
   v_name constant varchar(20) not null:='2015'; -- 
   v_id varchar(20);
begin
   v_id:='2017110418'; --�����ܲ����ҵ�һ����Ч���û�  ���涼����Ҫ��ֵ
   select USER_NAME into v_name from users where user_id=v_id; 
   dbms_output.put_line(v_name);  
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
      --���ʽ 'V_NAME' ������Ϊ SELECT/FETCH ���� INTO Ŀ�� ���� ��Ϊ���ܸ�����into
end;

-- 3. %Type  %RowType
-- ʹ�� %ROWTYPE ����ʱ, 'USER' ����������, �α���α����
declare 
   v_grade users.USER_GRADE%type;
   v_userRow users%ROWType;
BEGIN
  select * into v_userRow from users where user_id='2017110418'; 
  v_grade:=v_userRow.USER_GRADE;
  DBMS_OUTPUT.PUT_LINE(v_grade);
END;
