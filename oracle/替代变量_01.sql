-- ������������ڼ����������ݵĲ���
-- ������Ϊ�˷����û���ѯ ����  


-- ʹ�� ��ű�ʾ &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&     77 shift+7
  select * from C##KICKER.users WHERE USER_GRADE =&INPUTGrade;
--
  select * from C##KICKER.users WHERE USER_Status =&InputStatus;
  --���������� �ַ��� ����������ʱ�������� ����ʵ���� '''&input''' Ҳ����
  select * from C##KICKER.users WHERE USER_Name = &InputStatus;  
  
  
  -- ����������
    select * from C##KICKER.users WHERE USER_Grade = &InputGrade and USER_STATUS=&INPUTSTATUS ;  
    
 --��ϸ˵��: 
      --������ groupby orderby ����ʹ���������
      -- &&����ʹ�� һ��������涼ʹ���������
      -- ��һ�������  �ڶ�����Ҫ������ ֱ��ʹ�õ�һ����ֵ
      select * from C##KICKER.users WHERE USER_Status =&&InputStatus;
  
      select * from C##KICKER.users WHERE USER_Name = &InputStatus;  
      -- ����޷��ٴ����������  undefine  ������  �Ϳ�����
      
      undefine InputStatus;
  
  -- ����������� define ����������� =ֵ
   
   select * from users;
   
   define inputName ='''Jxier''';
   define inputGrade =2017;
   select user_grade from users where USER_NAME=&inputName;
   select user_grade from users where USER_GRADE=&inputGrade;
   
   undefine inputName;  --ȡ���������
   undefine inputGrade; --ȡ���������
   
   