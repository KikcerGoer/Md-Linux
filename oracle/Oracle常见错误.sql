-- A  �ַ������ӵĴ���
  remark_info_op:='�û�:'||user_id+ '��������:delete';
  
  dbms_output.put_line('�����㿴��û�� �ַ�������Ҫ��||��Ҫ��+ ��!')
  
/*
 ���󱨸� -
SQL ����: ORA-06502: PL/SQL: ���ֻ�ֵ���� :  �ַ�����ֵ��ת������
ORA-06512: �� "C##KICKER.CHANGE_TB_RECORD", line 33
ORA-04088: ������ 'C##KICKER.CHANGE_TB_RECORD' ִ�й����г���
06502. 00000 -  "PL/SQL: numeric or value error%s"
*Cause:    An arithmetic, numeric, string, conversion, or constraint error
           occurred. For example, this error occurs if an attempt is made to
           assign the value NULL to a variable declared NOT NULL, or if an
           attempt is made to assign an integer larger than 99 to a variable
           declared NUMBER(2).
*Action:   Change the data, how it is manipulated, or how it is declared so
           that values do not violate constraints.
 */


-- B orale��֧�� * ��ǰ������һ���ֶ� ֻ�ܹ�  select '�Ĵ�ʡ' Province ,User_ID from USERS

   select '�Ĵ�ʡ' Province ,* from USERS;

-- C ��̬SQL �����β����ʹ��; ��Ȼ�ᱨ��!
  
  
-- D �ղ��� �������ʲô����д  ����ʹ��null;
  begin
    null;
  end;

-- E  �˱��ʽ�������������������ʽ����ȷ ԭ��:����д����

����(7,4): PLS-00103: ���ַ��� "end-of-file"����Ҫ����֮һʱ��  ;    <an identifier> <a double-quoted delimited-identifier>    current delete exists prior <�ӵ����ŵ� SQL �ַ���> ���� ";" ���滻Ϊ "end-of-file" ������� 
-- ԭ��: �ӳ���end����û�м� ; ����; 

-- G �����ַ����Ƚ� char��varchar �Ƚ�Ҫ����trim

  select count(*)  from SC where SNO ='008';
-- ʹ��select  ���Զ�ȥ���ո�  ����ʹ�ú��� �洢����ȴ���� ����


PLS-00320: �˱��ʽ�������������������ʽ����ȷ Rowtype д���� type
































