/*********�� ��ѯ ��ǰ�û������еı���ǰִ����������û�  user_tables *****/

-- ��ͬ���û��õ����ݲ�ͬ
select * from user_tables;

/*********�� ��ѯ ���еı� �����û�   all_tables *** */

-- ��ʱ��ͬ���û�������ͬ���ֵı� �����ڲ�ѯ�Ƿ����ĳ�����ʱ�� ��Ҫ��ѯall_tables where ����������� table_name ��Owner
select * from all_tables where Table_Name ='SC_NUMBER' and  owner= C##MYDBADMIN;

