 -- ����һ����ռ�
 
   create tablespace mangodb
   datafile  'E:\TableSpace\mangodb_datafile.dbf' size 32M
   autoextend on next 5
   Logging;


 -- ����һ���û�
  create user C##oracle2016110418 identified by oracle 
  default tablespace mangodb
  quota unlimited on mangodb
  account unlock;

-- ����Ȩ��
  grant create session to C##oracle2016110418;
  grant connect to C##oracle2016110418;
  grant resource to C##oracle2016110418;
  grant dba to C##oracle2016110418;
  grant create table,create view,create trigger,create procedure to C##oracle2016110418;

------------------------------------ ���������� --------------------------------------

-- ����һ������
create sequence seq_DepartmentId
increment by 1
start with 1
maxvalue 999999999;

-- ����һ�����ű�

create table Department (
  DId int,
  DName varchar(20),
  Dfunds number,
  Dprincipal varchar(20)
) tablespace mangodb;

 --���Լ�� 
alter table Department add constraint pk_Did primary key(DId);
alter table Department modify (DName varchar(20) not null); 
alter table Department modify (Dprincipal varchar(20) default '000001');

create table Employees(
   Eid varchar(20),
   EName varchar(20),
   Age int,
   DId int
) tablespace mangodb;

alter table Employees add constraint pk_Eid primary key(DId);
alter table Employees add constraint fk_Eid_DId foreign key(DId) references Department(DId);

--------------------------------------------







