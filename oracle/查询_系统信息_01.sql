/*********�� ��ѯ ��ǰ�û������еı���ǰִ����������û�  user_tables *****/

-- ��ͬ���û��õ����ݲ�ͬ
select * from user_tables;

/*********�� ��ѯ ���еı� �����û�   all_tables *** */

-- ��ʱ��ͬ���û�������ͬ���ֵı� �����ڲ�ѯ�Ƿ����ĳ�����ʱ�� ��Ҫ��ѯall_tables where ����������� table_name ��Owner
select * from all_tables where Table_Name ='SC_NUMBER' and  owner= C##MYDBADMIN;

select * from sc;

set linesize 100; /*����ÿһ�е������� ���⻻��*/

/*�鿴��ǰ�û�*/
show user;
select user from dual;
--�鿴��ǰ��������
show con_name;
--�޸�����
alter session set Container =pdbmldn;

--
select * from dba_users;