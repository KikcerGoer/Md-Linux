-- whit ��ʱ��   ͨ�ñ���ʽ �����ѯ��䲻�Էֺ� ;��β 
-- �Ͷ�̬Sqlһ�� 




with tempTable as
(
  select '�Ĵ�ʡ' Province ,USERS.USER_ID from USERS
)
select USER_ID from tempTable order by USER_ID desc;


