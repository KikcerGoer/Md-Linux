 /*
   Oralce ����100����ϵͳȨ�ޣ����Ҳ�ͬ�����ݿ�汾��Ӧ��Ȩ����Ҳ�����ӡ�
   ��,�û�,����,����,����,����,ͬ���,��ͼ,�ӳ��� ��ʮ������Ȩ��
   
   Ȩ���ַ�Ϊ: ϵͳȨ�� �� ����Ȩ��
   ����Ȩ���ְ���  ��ɾ�Ĳ� sel,ins,upd,de ��ִ��execute �޸�alter ����index ����references
 */
 
  grant Ȩ��,... To [�û���. |��ɫ��,...| public]
  [with admin option];--���û������Ȩ�޼������������û�
  --public ��ʹ��Public ����Ȩ������Ϊ����Ȩ�ޣ�
  
  /*�����û�����session��Ȩ��*/
  grant create session to C##kicker;
  grant connect to C##kicker;
  --Oracle 12c֮ǰ�İ汾 ����Ȩ�޺���Ҫ����
  
  grant create table,create sequence ,create view to C##kicker with admin option;
  /*
  C D B��CDBȫ��ΪContainer Database�����ķ���Ϊ�������ݿ⡣
  P D B��PDBȫ��ΪPluggable Database�����ķ���Ϊ�ɲ�����ݿ⡣
  
  CDB �����PDB   CDB �������  PDB��ͬU��
  */
  commit;
  
  --�鿴�û�Ȩ�� �г��û�Ȩ��
  select * from dba_sys_privs where grantee in ('C##KICKER');
  
  select * from dba_sys_privs;
  
  /*����Ȩ��*/
  
  revoke create table,create view from C##Kicker;
  
  /-----------------------������Ȩ*********************/
  Grant ����Ȩ�� |All... on ����  --All��ʾ���е�Ȩ��  se de up in index references execute alter
  To [ �û��� | ��ɫ�� | Public ]
  with grant option;
  
  --������Ը���һ�����ĳһ��
  grant update(class_id) on classTable To  C##kicker;  
  
  show user;
  
  Revoke ����Ȩ�� |All... on ����  --All��ʾ���е�Ȩ��  se de up in index references execute alter
  From [ �û��� | ��ɫ�� | Public ]
  
  revoke update(class_id) on classTable from C##Kicker;
  
  
  /****/ --Oracle��ɫ /*****/
  --�鿴ĳһ����ɫӵ�е�Ȩ��
  select * from role_sys_privs WHERE ROLE= UPPER('DBA') ;
  
  -- ����ɫ���� �û�
  grant DBA to C##kicker;
  
  -- ���� ��ɫ
  create role C##kicker_role_Java; 
  -- ��Ȩ�޸����ɫ
  grant create table to C##kicker_role_Java;
  
  -- ��һ����ɫ���ջ�Ȩ��
  revoke CREATE table from C##kicker_role_Java;
  
  --���ý�ɫ����
  alter role C##kicker_role_Java
  identified by JDBC;  
  
  -- ��������
  alter role C##kicker_role_Java
  not identified; 