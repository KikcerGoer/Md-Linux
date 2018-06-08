--trigger �﷨
/*
create or replace trigger trigger_name
[before | after |instead of]
[insert | delete |  update of ������]
on ������|��ͼ|database |schema
referencing [old as ���] [new as ���] [parent as ��־]
for each row
[Follows ����������]
disable  --������Ĭ�ϵ�״̬
[when ��������]
declare
    [������������]
begin
    [����������]
end ����������;
*/
--��ͼֻ��Ӧ��:instead of ���ڴ�������ͼ

--�������������κβ��� һ�����ݱ�ֻ������12�������� ÿ�������� ��С���32K

-- Ĭ������� ������֮���ǲ���ʹ��������

-- �ű�����������Ĵ�������ᵼ��DML�����½� ���ݿ��в�Ҫʹ�ô����� ��Ϊ����̫����  �ر��Ƕ��ڴ�����Ŀ ���ݽ���Ƶ��

/*--****************************************************************--*/

-- 1.DML������ ���û�ִ����insert update delete  
-- 2.��Ϊ ���𴥷��� | �м�������

/*--****************************************************************--*/

--  ���𴥷��� ������ for each row
/*
create or replace trigger tri_tb_age_add 
before update on USERS
for each row
declare
  [����]
begin
  [�������]
end tri_tb_age_add;
*/


----DML ��������
set serveroutput on;



--ÿ�β���Ͱ��꼶����һ��
create or REPLACE trigger tri_tb_age_add
BEFORE insert on USERS
declare
  cursor users_cu is select * from Users;
  user_gradenew USERS.User_Grade%Type;
begin
   for val in users_cu loop
     DBMS_OUTPUT.PUT_LINE(val.User_Grade);
     user_gradenew:= val.User_Grade-1;
     update users set User_Grade=user_gradenew where USER_ID =val.User_ID;
     
   end loop;
end;



--******ÿ�η�����ı����ô��¼��record����****----

create table SysRecord(
  op_id int,
  op_name varchar2(100) not null,
  op_remark varchar(200) check(trim(op_remark)!=''),
  op_IsFinish char(1),
  constraint pk_op_id primary key(op_id)
)


/****************************************************/

  --����! :new��:oldֻ�������м�������������������伶������
  -- ����Ĵ��������Ǵ����
  
/******************************************************/
create or replace trigger change_tb_record
before 
insert or update or delete on USERS
declare 
   record_max_id SysRecord.op_id%type;
   user_id varchar(20);
   remark_info_op varchar(200);
BEGIN
   select user into user_id from dual;
   select max(op_id)+1 into record_max_id from SysRecord;

   if inserting then
      remark_info_op:='�û�:'||user_id+ '��������:insert ������λID: User_ID'||new.USER_ID;
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,30);
   end if;
   
   if updateing then
      remark_info_op:='�û�:'||user_id+ '��������:update ������λID: User_ID'||new.USER_ID;
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,30);
   end if; 
   
   if deleting then 
       remark_info_op:='�û�:'||user_id+ '��������:delete ������λID: User_ID'||new.USER_ID||new.User_Name||To_char(new.User_Birthday,'yyyy-mm-dd hh24:mi:ss')||To_char(new.User_Grade)||To_char(new.User_Class);
       insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,30);
   end if;
   
end;
/********************************************************************************************/
  DBMS_OUTPUT.PUT_line('����Ĵ����� ʵ�ֵ��Ա�ʵ��DML����ʱ����¼�ڱ���!');
/********************************************************************************************/
set serveroutput on;

create or replace trigger change_tb_record
before 
insert or update or delete on USERS
declare 
   record_max_id int;
   remark_info_op varchar(200);
   op_row_count int:=0;
   user_id varchar(20);
BEGIN
   select nvl(user,'���û�') into user_id from dual;
   select count(*) into op_row_count from  Sysrecord;
   if op_row_count=0 then
      record_max_id:=1;
   else
      select max(op_id) into record_max_id from SysRecord;
      record_max_id:=record_max_id+1;   
   end if;
   
   if inserting then
   
      remark_info_op:='�û�:'||user_id|| ' ��������:insert';
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'Insert',remark_info_op,'1');
       DBMS_OUTPUT.put_line('inserting');
   end if;
   
   if updating then

      remark_info_op:='�û�:'||user_id|| ' ��������:update';
      insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'update',remark_info_op,'1');

  DBMS_OUTPUT.put_line('updating');
   end if; 
   
   if deleting then  
       remark_info_op:='�û�:'||user_id|| ' ��������:delete';
       insert into SysRecord(op_id,op_Name,op_remark,op_isfinish) values(record_max_id,'delete',remark_info_op,'1');
       DBMS_OUTPUT.put_line('deleting');
   end if; 
end;

/******************************************************************************************/

/*
insert into USERS values('201233211023412','Jkxxxsd',to_date('1998/07/09','yyyy-mm-dd hh24:mi:ss'),2015,30,2); 

select * from USERS;

rollback;
*/


 -- ɾ��������
drop trigger tri_tb_age_add;






























