/****************************  ͨ�ú���  ************************************/
/*
  NVL
  NVL2
  NULLIF
  DEOCODE
  COALESCE
*/
/**************************************************************************/
-- ��֤ NVL ����
-- �ж��Ƿ�Ϊ�� NVL ���� �ǿ���Ϊԭֵ ����Ϊ ����ֵ
   select NVL(NULL,0),NVL(3,0) FROM dual; 
   
-- NVL2(value,not_null_vakue,null_value) ��� �ǿ���ȡnot_null_vakue  ����ȡnull_value

  select NVL2(NULL,95+6,75) from dual; -- return  75
  
  -- NULLIF(���ʽһ,���ʽ��) ��������Ҫ�������ж��������ʽ����Ƿ���� ��ȷ���NULL ����ȷ��ر��ʽһ
  
  select NULLIF(75,75) from dual; --���  ���� NULL

  select NULLIF(85,75) from dual; --����� ���� 85 
  
  -- DECODE() ���� ������������ڳ����е� if..else..if  else�����жϵ����ݶ��Ǹ���һ�������ֵ
  -- DECODE(value | ���ʽ ,ֵ,������,ֵ2,������....,Ĭ��ֵ)
  select DECODE(11,1,'������һ',2,'����Ϊ��','Ĭ��ֵ') from dual;
  select DECODE(2-1,1,'������һ',2,'����Ϊ��') from dual;
  
  -- COALESCE(���ʽһ,���ʽ��,���ʽ��,���ʽ��....) ��ʾһΪ�� ��Ϊ���ʽ�� ������ʽ2Ϊ����Ϊ���ʽ��....
  
  select Coalesce(null,5,56) from dual;
  
  
  /**************************************************************************/