select * from sc;

set linesize 100; /*����ÿһ�е������� ���⻻��*/

/*�鿴��ǰ�û�*/
show user;
--�鿴��ǰ��������
show con_name;
--�޸�����
alter session set Container =pdbmldn;

--
select * from dba_users;