/************************** ת������ *********************************/
-- TO_CHAR ���ڸ�ʽ��
/*
   YYYY ������
   Y,YYY �����ŵ���
   YYY ��ĺ���λ
   YY ����λ
   Y  ��һλ
   YEAR ��ݵ� ���ֱ�ʾ ֱ�ӱ�ʾ��λ����
   MONTH �·ݵ����ֱ�ʾ ֱ�ӱ�ʾ��λ����
   MM ����λ���ֱ�ʾ�·� ������������������M
   DAY ����������
   DDD ��ʾһ�������
   DD ��ʾһ����������� 
   D ��ʾһ�ܵ�����
   DY ��ʾһ��������ڼ� ���ֱ�ʾ
   WW ��ʾһ�����������
   W ��ʾһ�������������
   HH ��ʾ12Сʱ�ƣ�Сʱ����λ����
   HH24 24���Ʊ�ʾСʱ
   MI ��ʾ����
   SS ��ʾ�� ������λ����
   SSSSS ��ҹ֮��������ֱ�ʾ
   AM | PM ��ʾ�����������
   FM ȥ��ǰ����
 */
 select to_date('2005-01-01 13:14:20','yyyy-mm-dd HH24:mi:ss') from dual;  
 
 
  --TO_CHAR(DATE,FORMAT)
  select  sysdate ��ǰϵͳʱ��,To_char(SYSDATE,'YYYY-MM-DD') FROM DUAL;
  -- TO_CHAR(DATE,FORMAT)  ȥ��ǰ����
  select TO_CHAR(sysdate ,'FMYYYY-MM-DD') from dual;
 -- TO_CHAR ���ָ�ʽ��
 /*
   9 ��ʾһλ����
   0 ��ʾǰ��0
   $ �����ҵķ�����ʾΪ��������
   L �������Ի�������ͬ�Զ�ѡ�����s����
   . ��ʾС����
   , ��ʾǧλ��
   */
   -- ǧλ����
   select TO_CHAR(2059156151651,'999,999,999,999,99999') from dual;
   select TO_CHAR(2059156151651,'000,000,000,000,00000') from dual;  
  -- ��Ԫ
    select TO_CHAR(2059156151651,'$999,999,999,999,99999') from dual;
    select TO_CHAR(2059156151651,'L000,000,000,000,00000') from dual;   
  
  --TO_DATE(STRING,DATE_FORMAT)
  SELECT TO_CHAR(TO_DATE('1998-8-5 21:21','YYYY-MM-DD HH24:MI'),'YYYY-MM-DD HH24:MI:SS') from dual;
 
 -- TO_Number() �ַ����������
 -- û���� Oracle֧���Զ�ת��
  select to_number('19') *to_number('56') from dual;
 
  select '19'*'56' from dual;
 
-- ����ת�ַ��� cast(value as newType) 
 select cast(95.6512 as varchar(20)) from dual;
-- ����ת�ַ���
 select to_char(95.6512) from dual;
 
 
 
 
 