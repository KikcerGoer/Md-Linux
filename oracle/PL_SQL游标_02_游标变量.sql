/*
  ��̬��ָ�����͵Ĳ�ѯ,���Ƕ�̬�α� 
  �����α��������
  
  CURSOR ���ݱ����������� IS REF CURSOR [RETURN ��������]
  
  type tp_name ref cursor;
  lists tp_name;
  
  д��return ���� ǿ�����α��������
  ��дreturn ���� �������α��������
  
  �α���� ʹ��loopѭ�� ����ʹ��for 
  
  ʹ�÷���
  
  open ���ݱ����������� FOR select * from table_name.....;
  close ���ݱ�����������
*/
declare
  --����һ�����α�
  type cur_ref_user IS REF CURSOR;
  cur_user cur_ref_user;
  usrrow users%rowtype;
begin
   open cur_user for select * from users;
   loop
     
       fetch cur_user into usrrow;
       exit when cur_user%notfound;
       dbms_output.put_line('Name:'||usrrow.User_Name||' ID:'||usrrow.USER_ID);
   end loop;

   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;   

--  ϵͳ�����������α� sys_refcursor
declare
  ref_usr sys_refcursor; 
  usrrow users%rowtype;
begin
   open ref_usr for select * from users;
   loop
     
       fetch ref_usr into usrrow;
       exit when ref_usr%notfound;
       dbms_output.put_line('Name:'||usrrow.User_Name||' ID:'||usrrow.USER_ID);
   end loop;

   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;   

ROLLBACK;  