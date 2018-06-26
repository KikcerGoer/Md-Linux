/*
  
   execute immediate 
    into 
    using
    returning | return 
    ת��ʹ�� ''
 */
 
 execute immediate ��̬SQL�ַ���[BULK COLLECT] INTO �Զ������...
 using in|out|int out �󶨲���
 returning | return [bulk collect] into �󶨲���
 
 
 --- ʹ�� using ռλ��
 
  declare
    l_depnam varchar2(20) := 'testing';
    l_loc    varchar2(10) := 'Dubai';
  begin
    execute immediate 'insert into dept values  (:1, :2, :3)'
    using 50, l_depnam, l_loc;
  commit;
 end;
 
 -- ʹ��into �Ӷ�̬sql���� ����ֵ
 declare
  l_cnt    varchar2(20);
 begin
    execute immediate 'select count(1) from dual'
    into l_cnt;
    dbms_output.put_line(l_cnt);
 end;
 
 -- ���ʹ��
 declare
   l_dept    pls_integer := 20;
   l_nam     varchar2(20);
   l_loc     varchar2(20);
 begin
    execute immediate 'select dname, loc from dept where deptno = :1'
       into l_nam, l_loc
       using l_dept ;
 end;

-- ����ƴ���ַ���


---------------------------

���α������ʱ��ʹ��using 
open �α����� for ��̬sql��� [using �󶨱���...]


declare
  cur_stu SYS_REFCURSOR;
  row_stu Student%ROWTYPE;
begin
  open cur_stu for 'select * from STUDENT';
  loop
     fetch cur_stu into row_stu;
     EXIT WHEN cur_stu%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(row_stu.SNO);
  end loop;
end;























