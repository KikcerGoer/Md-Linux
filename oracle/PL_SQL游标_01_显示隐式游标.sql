/*********** --------------- PL/SQL �α�01 -------------- *************/

-- �α�����ܵ�Ҫ���Ϊ��,��ʱ��������ݵ�ʱ������ʹ���α�,��ռ�ô����ڴ�
-- ����
    /*
      ��̬�α�
          1.��ʽ�α�:���е�DML���Ϊ��ʽ�α�,ͨ����ʽ�α����Կ��Ի�ȡSQL�����Ϣ
             --��PL/SQL��������д��ÿ��sql���ʵ���϶�����ʽ�α�.ͨ��DML����֮��ʹ��
               "SQL%ROWCOUNT" ����,����֪��������ı��������INSERT,UPDATE��DELETE��
                SELECT���ز�ѯ�ı������
          2.��ʾ�α�:�û���ʾ�������α�,��ָ���������.����ѯ���ؽ������һ��ʱ,����Ҫһ����ʾ�α�
      REF�α� 
          ��̬�������������ʱ����
    */
/* ��ʽ�α����� �� %FOUND ���û�ʹ��DML��������ʱ����TRUE
                 %ISOPEN �ж��α��Ƿ�� �����κε���ʽ�α����Ƿ���false ��ʾ�Ѿ���
                 %NOTFOUND ���ִ��DML���� û�з��������� ����true ����false
                 %ROWCOUNT ���ش�������
*/    
--"SQL%ROWCOUNT"
set serveroutput on;    
declare
   v_Count number;
begin
   select count(*) into v_Count from users;
   DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT:'||SQL%ROWCOUNT);
   --�պ� 1��
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;
   
   
declare
   
begin
   update users set USER_CLASS=15;
   DBMS_OUTPUT.PUT_LINE('��Ӧ�����˶�����:-- ���� SQL%ROWCOUNT:'||SQL%ROWCOUNT);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;   

ROLLBACK;   


---- ��ʾ�α�
 --����һ����ʾ�α�
 /*
    cursor �α�����[(�����б�)][return ��������]
      is �Ӳ�ѯ
    [for update of ������][NOWAIT] 
    ʹ�� Open���α� Close �ر��α�
    ʹ�� Fetch  �α�  into RowType���� ȡ������
    
    --Ĭ������� �α��ڵ�һ��֮��
 */
 
 --�����α� ȡ�õ�һ������
 declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
   if userinfo%isopen then
        null;
   else
        open userinfo;
   end if;  
   Fetch userinfo into User_row;  
   DBMS_OUTPUT.PUT_LINE('��һ�����ݣ�'||User_row.User_Name);   
   Close userinfo;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--�����α� ����while
declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
   if userinfo%isopen then
        null;
   else
        open userinfo;
   end if;  
   fetch userinfo into User_row;
   while userinfo%Found loop
      DBMS_OUTPUT.PUT_LINE('��һ�����ݣ�'||User_row.User_Name||' '||User_row.User_id);
       fetch userinfo into User_row;
   end loop;  
   close userinfo;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--�����α� ����LOOP
declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
   if userinfo%isopen then
        null;
   else
        open userinfo;
   end if;  
   fetch userinfo into User_row;
   loop
       fetch userinfo into User_row;
       EXIT WHEN userinfo%NOTFound;
       DBMS_OUTPUT.PUT_LINE('��һ�����ݣ�'||User_row.User_Name||' '||User_row.User_id);
   end loop;  
   close userinfo;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

--�����α� ����for
declare
   cursor userinfo is select * from users;
   User_row Users%RowType;
begin
       FOR User_row in userinfo loop
       DBMS_OUTPUT.PUT_LINE('��һ�����ݣ�'||User_row.User_Name||' '||User_row.User_id);
       end loop;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;
--�����α� ����for ����Ҫ�α�ı��� ֱ�Ӱ�sql��䵱���α�
declare
   User_row Users%RowType;
begin
       FOR User_row in (select * from users) loop
       DBMS_OUTPUT.PUT_LINE('��һ�����ݣ�'||User_row.User_Name||' '||User_row.User_id);
       end loop;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;







   