/*
   ��: ģ�黯������Ƶ���Ҫʵ���ֶ�,���Խ� ����,����,�α�,����,���� ����һ����� ʱ�ڿ��Է����
   �໥����
   
   ���Ķ��������������: ���淶 �� ����
 */
 
 -- ���淶 package ���屣�ؿ��Ա��ⲿ���ʵĲ��֣��ڰ��淶�е����������ݿ��Դ�Ӧ�ó���Ͱ����κεط����ʡ�
 -- �����﷨������ʾ
 
create [replace] package pk_name
--[authid |definer|current_user] --���п��޵Ķ���
IS--���� AS ������
  -- �ṹ���ƶ���(����,����,����,�α�,�쳣�ȵ�)
end pk_name; 


 -- ���� Package body :������淶�ж���ĺ������߹��̵ľ���ʵ�ִ���,����ڰ���֮��
 -- �����˰��淶��û�е�����,��˲��ֽ��ᱻ����Ϊ˽������,����Ķ����﷨������ʾ��
 
 create [replace] PACKEAGE BODY pk_name
 is --���� as
    �ṹʵ��(����,����,����,�α�,�쳣�ȵ�)
begin
    ����ʼ���������
end;

---------------------------------------------------------------------

--���淶
create or replace package pk_student_manger
as
  Function get_student_count return number;
end;

--����ʵ��

create or replace package body pk_student_manger
as
   Function get_student_count
   return number
   as
     scount number;
   begin
     select count(*) into scount from Student;
     return scount;
   end;
end;

-- ��ѯ�û�����İ� �� ����
select * from user_objects
where object_type in ('PACKAGE','PACKAGE BODY');

-- ִ�а���

set serveroutput on;

declare
   cout int;
begin
   cout:=pk_student_manger.get_student_count();
   DBMS_OUTPUT.put_line('ѧ������:'||cout);
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- ���±��� ���淶
alter package pk_student_manger compile specification;
-- ���±��� ����
alter package pk_student_manger compile BODY;






























