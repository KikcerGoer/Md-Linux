/*
   �ӳ������: ������ �洢����  ���Ƕ��ڴ����ķ�װ��һ���ض��ṹ�� 
 */
 
 -- ����洢���� ���� + PL/SQL
 create or replace procedure pro_Name_next([��������,����ģʽ[in / out /inout ],��������]....)
 [authid |definer|current_user]
 as|is   
    -- û��declare 
    ��������
 begin
    ����
 exception
   �쳣����
 end;
 
 -- ���峬���򵥵Ĺ���
 create or replace procedure pc_get_vag
 as
 begin
   dbms_output.put_line('ƽ���ɼ���֪��');
 end;
 
 --ִ�д˹���
 exec pc_get_vag;
 
-- ����������Ĺ���

create or replace procedure pc_get_name_by_id(stuID in varchar)
 as
   stuName STUDENT.SNAME%TYPE;
 begin
    select SName into stuName from STUDENT where trim(SNO)=stuID; 
    DBMS_OUTPUT.PUT_LINE('ѧ��:'||stuName);
 end;

exec pc_get_name_by_id('002'); 
-- 
set serveroutput on

---------------------------
-- ��ѯ�ӳ���  
select * from user_procedures;

-- ��ѯ�����û����� ������ ���� �ӳ���
select * from user_objects;

-- ��ѯ���ж����Դ��
select * from user_source;

-- ��ѯ�����ӳ���Ĵ�����Ϣ
select * from user_errors;

-- ɾ���ӳ���
drop procedure pc_get_vag;




























 