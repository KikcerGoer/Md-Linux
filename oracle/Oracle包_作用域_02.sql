/*
 
  ���ڰ��淶�ж��壬��ֻ�ڰ��嶨��ĽṹΪ˽��
  ���еİ����ڵ�һ�α�����ʱ�Ż���г�ʼ�������������������״̬���浽�û�ȫ�����ĻỰ
   �У���һ���Ự�ڼ��ڣ��˰���һֱ���û���ռ�ã�һֱ���Ự������ŻὫ���ͷţ�
   
   ���е��κ�һ���������α궼������һ���Ự�ڼ�һֱ���ڣ��൱��ȫ�ֱ�����ͬʱ���Ա����е��ӳ���������
 
 */
 
 
 
CREATE OR REPLACE PACKAGE pk_sudent_info
AS
   stuID student.SNO%type:='008';
   FUNCTION getName RETURN varchar2 ;
END ;



CREATE OR REPLACE PACKAGE BODY pk_sudent_info
AS
    FUNCTION getName RETURN varchar2
    AS
      StuName varchar(20);
    BEGIN
       SELECT SNAME INTO StuName FROM STUDENT WHERE SNO=pk_sudent_info.stuID;
       RETURN StuName ;
    END ;
END ;


declare
   Sname varchar(20);
begin
   Sname:=pk_sudent_info.getName();
   DBMS_OUTPUT.put_line('ѧ������:'||Sname);
   pk_sudent_info.stuID:='007';
   Sname:=pk_sudent_info.getName();
    DBMS_OUTPUT.put_line('ѧ������:'||Sname);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;


