-- ��: ��ͬsession ����ͬһ������
   
   select * from users where user_grade=2016 for update;
   
-- ��Oracle SQLPlus ����һ���ػ�ִ��������,�ͻᷢ�ֲ��ᶯ�ˡ�
    
    commit; --�ύ/�ع���  SQLPLUS�Ϳ���ʩ���ˡ�
    
 /*
  �м����� �û�ִ����ɾ��һ�� select for update �Ժ� �ڵ�ǰ����û���ύ֮ǰ ��Щ��ִ�е��оͻᱻ����������Դ�ᱻ��ռ����������һֱҪ���������ͷ�����Ż���в��� 
  */
  
  /*
   ������ ֻҪ�û���ȷָ��ʹ��LOCK TABLE ������/��ͼ���� �����ֹ�������
   �﷨: LOCK TABLE TABL_NAME/VIEW_NAME IN ����ģʽ Mode [NoWait]
   NoWait��������ֵ�ǰ��Դ�Լ���������Դ����,�򲻻�ȴ���
   ģʽ�� 
        row share �й����� �����ڼ� ����������ԶԱ���и��ֲ��� ���ǲ��������κ������ͬһ�ű���ж�ռ
        row Exclusive  �������� 
        SHare ����������Բ�ѯ�����Բ���
        SHARE ROW EXCLUSIVE ���Բ�ѯ ���ǲ����� select for update �����û�������ʹ�ù�����
        EXCLUSIVE ������,�����Զ�ռ��ʽ������,�����û������ѯ,���ǲ����޸�,Ҳ���������κε���
  */
  
  lock table users in share row exclusive mode nowait;
  
  --������� ����һ��session�Ϳ�����
  
  --alter system kill session 'SID,SERIAL#';
    alter system kill session '375,40494';
  -- �鿴��
  select * from v$Locked_object;
  -- �鿴session
  select SID,SERIAL# from v$Session where SID IN(374);
  
  
  