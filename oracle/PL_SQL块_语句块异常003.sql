
---�쳣 ϵͳԤ�����쳣 ����

declare
  v_sal int;
begin
  v_sal:=20;
  case 
      when v_sal>20 then
      dbms_output.put_line('�Ұ���');
      when v_sal=20 then
      dbms_output.put_line('�Һܰ���');
      when v_sal<20 then
      dbms_output.put_line('�ҳ�������');
   end case;
exception
  when CASE_NOT_FOUND THEN
  dbms_output.put_line('��Case��ȱ��������');
end;

set serveroutput on;

-- ��ϵͳԤ�����쳣
declare 
  --ϵͳ��Ԥ�����쳣�Ķ��������
  ex_null exception;
  pragma Exception_IniT(ex_null,-01400);
  --�û��Զ����쳣
  ex_insert exception;
  v_ese int:=50;
begin
    if v_ese>20
    then
        raise ex_insert;
    elsif v_ese=20
    then
       v_ese:=50;
    end if;
exception
     when ex_null then
     dbms_output.put_line('ϵͳ��Ԥ�������');
     when ex_insert then
     dbms_output.put_line('�û��Զ������');
end;