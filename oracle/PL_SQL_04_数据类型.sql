/*********** --------------- PL/SQL ��� -------------- *************/
-- ������������
/*
  1.�������� �ַ��� ���� ���� ����
  2.�������� ��¼���� Ƕ������ ������ �ɱ�����
  3.�������� ����ֻ����һ��ͬ�Ķ��� ����:REF CURSOR ,REF
  4.LOB ���������� ���洢4G����Ϣ����������
*/  
  --NUMBER(3) �����λ����
  --NUMBER(5,2) ��λ����  ��λС��
  -- PLS_NUMBER()
  -- һ��ͼ
declare
   
begin
   
   dbms_output_put_line(Binary_DOUBLE_max_normal);
   
   
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;