-- �����ֵ� Oracle������¼���ݿ������Ϣ�����ݶ���
select * from all_users;

-- �޸ı����� ���൱�� �޸������ֵ��еı���Ϣ
-- �������� ��� ������
rename users  to ItUsers; 

rename ITusers  to Users; 

--�޸������� 
alter table TABLE_NAME rename column FIELD_NAME to NEW_FIELD_NAME;


select *from ITUSERS;

-- ������ /��ض�   truncate table tablname;

--ɾ���� drop table tableName
  
  select * from users;
  
  delete from users;
  
  rollback;
  
  
-- FlashBake ����    Oracle 10g ���ӵķ�ֹ���ݿ������
   /* OracleΪ�˷�ֹ ���ڱ����ɾ�� ���Զ���ɾ����������Ǵ���ڻ���վ�� �����Ҫ����ʹ������ �һ�ɾ�������� */
   select * from users_bak;
   
   drop table users_bak;
   --���Բ鿴ɾ��������
   select * from recyclebin;
    --����ɾ���ı�
    Flashback table users_bak to before drop;
    -- �������
    select * from users_bak;
    
    -- ����ɾ��һ�ű� drop table table_name purge;
    
    --ɾ������վ�еı� Purge table tableName;
     
    -- ��ջ���վ purge recyclebin
  /***************************************----------------*******************/
  /* Create /DROP /Alter
  /*                                                  */
  -- ������
  ALTER TABLE USERS ADD (User_Class int default 0);
   
  select * from users;
  -- ɾ����
  alter table users DROP COLUMN User_Class;
  
  -- �����ֶ����� ������ ����Ҫ����
  alter table users set unused column User_Class;
  alter table users set unused(User_Class);
  --midify
  alter table users modify (User_Class  varchar(20) not null);
  commit;
  desc table users;
  -- ɾ��������
  alter table users drop unused COLUMNS ;
  
  --���ӱ�ע��
   Comment on table users is '�û���Ϣ��';
   
   --������ע��
   Comment on column users.User_ID is 'ʹ���û�ѧ��';
   /* �鿴ע����Ϣ */
    select * from user_tab_comments;
    select * from user_tab_comments where table_name='USERS';
    
    --�鿴��ע��
    select * from user_col_comments where table_name ='USERS'; 
   
  
  
  
  
  
  
  
  