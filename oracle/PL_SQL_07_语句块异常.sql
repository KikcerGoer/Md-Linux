
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

/*
�û��Զ����쳣
��ʽһ :��������������Exception����,�˷�ʽ������ѡ��:
       ѡ��һ: �����쳣��������������������,�˷�ʽʹ����ͨ��others�쳣�����û������쳣;
       ѡ���: �����쳣����������Ч��Oracle�������ӳ��,��Ҫ��д������When���鲶��
������ ����ִ�п��й�����̬�쳣        
        ͨ��RAISE_APPLICATION_ERROR �������Թ�����̬�쳣.�ڴ�����̬�쳣ʱ,����ʹ��-20000
        ~-20999��Χ�����֡����ʹ�ö�̬�쳣,����������ʱָ�ɴ�����Ϣ.
*/


-- ��һ�ִ���
declare
   val_count int:=20;
   va_myexception exception;
   pragma Exception_IniT(va_myexception,-20998); --���ô������  ʹ�ø���
begin
   if val_count >10 then
     raise va_myexception;
   end if;
   Exception 
     when va_myexception then
       DBMS_OUTPUT.PUT_LINE('������һ����: ��С��<10');
     when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--�ڶ���




declare
   val_count int:=20;
   /*����Ҳ����Ҫ����һ������*/
begin
   if val_count >10 then
      RAISE_APPLICATION_ERROR(-20789,'��������һ����ȷ������'); --ֱ���������׳��쳣
   end if;
   Exception 
     when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;






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