 /**************  ͳ�ƺ���  ******************/
 -- COUNT /SUM /AVG /MAX /MIN /median /Variance /Stddev

 -- median �����м�ֵ
 -- variance Ӣ��  ����
 -- Standard deviation ��׼��
  desc dba_tablespaces;
  desc DBA_USERS;
 -- �����м�ֵ
  select median(user_id) from DBA_USERS;
 -- ���ط���
  select Variance(user_id) ���� from DBA_USERS;
  select STDDEV(user_id) ��׼�� from DBA_USERS;