  /*
   �û�: ��������� 
  */
  /*
  create [Temporary] TABLESPACE ��ռ�����
  [datafile | Tempfile ��ռ�·��] size ����[K|M]
  autoextend on |off next ���� [K | M] --�Ƿ����Զ���չ�ļ�
  Logging | NoLogging;
  
  ����: ����޷������ļ� ����Ҫ�Ȱ�Ŀ¼�ļ���������  �ſ��� ������ֱ�Ӱ������ļ��������̷�֮��
  */
  dbms_output.put_line('��ռ䴴��----------�﷨-----------:');
  CREATE tablespace  Mydb
  datafile 'E:\TableSpace\mydb_datafile.dbf' size 64M
  autoextend on next 5M
  Logging
  ���ݿ����_����_01.sql
  
  /*�鿴��ռ�*/
  select * from dba_tablespaces;
  DESC dba_tablespaces;
  /*
    USERS��ռ�  ���Դ洢�û�������
    Undo��ռ� ��������Ļع��ͳ�����
    Temp��ռ� ���Դ��Oracle��������Ҫ�����洢�����ݱ���������м���
  */
  
  /*����һ���� Ȼ�󷽷�Ŷһ����ռ���*/
    create table student(
    Sno varchar(10) primary key,
    Sname varchar(20) not NULL,
    Sage smallint,
    Ssex varchar(2),
    Sdept varchar(20)) tablespace mydb;
  
  --����ͨ��alter��������һ�����ƶ�������һ����ռ��У�
    alter table spaceOne.tablename  move tablespace spaceTwo;
  --���ͣ����������ǰ�tablename���spaceOne�ƶ���spaceTwo�С�
  
  /*ɾ����ռ�*/
  DROP TABLESPACE Mydb INCLUDING CONTENTS AND DATAFILES;
  
  /*��ռ�����*/
  alter database datafile '/oracle/app/oradata/mytablespace/my_01.dbf' resize 256M;
  
  dbms_output.put_line('�����û� -----------�﷨-------------:');
  /*
  create user �û��� Identified By ����
  default TableSpace ��ռ�����
  QUOTA ����[K|M|] | UNLIMITED ON ��ռ�����
  QUOTA ����[K|M|] | UNLIMITED ON ��ռ�����
  PROFILE ��Ҫ�ļ�����|default --�û���������Դ�ļ� �����ָ����ʹ��Ĭ����Դ�����ļ�
  password Expire --�û�����ʧЧ��Ҫ�ڵ�һ��ʹ�õ�ʱ���޸�����
  ACCOUNT LOCK|UNLOCK  --ʹ�������û� Ĭ����UNLOCK
  */
  /* oracle 12c ֮�󴴽�һ���û����½��Ҫ���� C##*/
  
  create user kicker identified By Oracles
  default tablespace mydb
  quota unlimited on mydb
  account unlock
  
  create user C##kicker identified By Oracles
  default tablespace mydb
  quota unlimited on mydb
  account unlock 
  /* oracle 12c ֮�󴴽�һ���û����½��Ҫ���� C##*/
  /*�޸��û�*/
  alter user Kicker identified by jiangxing000;
  
  --alter user c##Kicker identified by jiangxing000;
  /*ǿ���û��´ε�¼ʱ �޸�����*/
  alter user kicker password expire;
  
  /*����/���� �û�*/
   alter user kicker account lock;
   alter user kicker account unlock; 
  
  
    show user; -- �鿴��ǰ�û�
  /* �û���Ҫ�ļ�  :
     ��Ҫ�ļ���һ�������˵Ŀ������Դ�ļ�������Ա����������ֱ�������û�����Դ�����������û�����Ȳ���
     ��Ϊ���� 
      ��һ�飺��Դ��������
          sessions_per_user ���� |UNLIMITED |DEFAULT 
          ����һ���û�ͬʱ����SESSION���������
          CPU_per_Session ���� |UNLIMITED |DEFAULT
          һ��session ����ʹ��CPU ��ʱ����  ����
          cpu_per_call ���� |UNLIMITED |DEFAULT
          ����ÿ������sql����ڼ� CPU��ʱ������ ��λ��
          Idle_Time ���� |UNLIMITED |DEFAULT
          session �ĳ�ʱʱ��  ��λ ��
          Connect_time ���� |UNLIMITED |DEFAULT 
          session������ʱ���� ��λΪ��
          logical_reads_per_session ���� |UNLIMITED |DEFAULT
          Ϊ�˷�ֹ�ѿ������Ĳ���,�����޶�ÿһ���û���������ȡ�����ݿ�����
          logical_reads_per_call ���� |UNLIMITED |DEFAULT
          ÿ�ε���SQL����ڼ� ��������û���ȡ�����ݿ�����
      �ڶ��飺������������
          failed_login_attempts ���� |UNLIMITED |DEFAULT
          ��������½ʧ�ܴ����ﵽ�ò���ָ��ʱ���û�������
          password_life_time ���� |UNLIMITED |DEFAULT
          ������Ч�� (��) Ĭ�� ������
          password_reuse_time ���� |UNLIMITED |DEFAULT
          ����޸ĺ�ԭ�п������������Ա�����ʹ�ã�Ĭ��������
          password_verify_function ���� |UNLIMITED |DEFAULT
          ����У�麯��
          password_lock_time ���� |UNLIMITED |DEFAULT
          �˻���Ϊ failed_login_attempts�����������������
          password_grade_time ���� |UNLIMITED |DEFAULT
          ������ں󣬼���ʹ��ԭ����Ŀ�����(��)
     */
     --�ڴ���profile֮ǰ����Ҫ�޸�һ��������alter system set resource_limit=true;
     alter system set resource_limit=true;
     
     
     create profile C##kicker_profile limit
     FAILED_LOGIN_ATTEMPTS 5
     sessions_per_user 200
     CPU_per_Session 1000
     connect_time 60;
     
     CREATE PROFILE c##kicker_profile_list
     LIMIT PASSWORD_REUSE_MAX DEFAULT
           PASSWORD_REUSE_TIME UNLIMITED;
     
     CREATE PROFILE c##kicker_profile_list LIMIT
      FAILED_LOGIN_ATTEMPTS 5
      PASSWORD_LIFE_TIME 60
      PASSWORD_REUSE_TIME 60
      PASSWORD_REUSE_MAX UNLIMITED
      PASSWORD_VERIFY_FUNCTION verify_function
      PASSWORD_LOCK_TIME 1/24
      PASSWORD_GRACE_TIME 10;
      
     alter profile kicker_profile limit
     CPU_per_Session 1000
     sessions_per_user 200
     cpu_per_session 100000
     connect_time 60;
     
     /*���ø�Ҫ�ļ������û� ��һ����Ҫ�ļ���������û� 
     ��ɾ�������Ҫ�ļ�ʱʹ��cascade�ؼ��� ����ɾ������ʹ�������Ҫ�ļ����û�*/
     -- ɾ����Ҫ�ļ��� ����ɾ��kicker�û�
     drop profile C##kicker_profile_list cascade; 
     
     /*�鿴�����ĸ�Ҫ�ļ�*/
     select * from dba_profiles;
      

  