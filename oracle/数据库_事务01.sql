-- ���� Oracle
-- Ĭ������� Oracle ���ǲ��Զ��ύ�Զ��ύ���� 
/*
  1. SET AUTOCOMMIT =OFF ȡ���Զ��ύ����,����������
  2. SET AUTOCOMMIT =ON ���Զ��ύ����,�ر�������
  3. COMMIT �ύ����
  4. ROLLBACK TO �ع�����
  5. SAVEPOINT���񱣴������ �������񱣴��
*/
 savepoint starts;

 insert into users(USER_ID,User_Name,USER_BIRTHDAY,USER_GRADE,User_STATUS) 
        values('2015110418','����',TO_DATE('1997/5/6','yyyy-mm-dd'),2015,30);
    select  * from users where User_Grade =2015;   

-- �ع�����
  
  rollback TO starts;
   
   

-- �ύ����
   commit;
   