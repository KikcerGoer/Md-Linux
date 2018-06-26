/*
  �α��������Ҫ����"FOR UPDATE"�Ӿ���"WHERE CURRENT OF"�Ӿ䣻
  "WHERE CURRENT OF"�Ӿ��ԭ�����ROWID�ĸ���ڸ��»�ɾ���α����ݵ�ʱ�򣬿������ô�
   �Ӿ䶨λ�����С������Ӿ�Ĵ������������FOR UPDATE�Ӿ䣬�����޷�ʹ�ã�
*/

/* FOR UPDATE [OF COLUMN...]*/

/*
  FOR UPDATE  of column... �� FOR UPDATE ������
  
  FOR UPDATE  of column...: ���ڶ���ѯ

*/


-- CURSOR cur_name IS SELECT * FROM emp WHERE ... FOR UPDATE NOWAIT;
-- �������α���ִ�и��»�ɾ���Ĳ���ʱ���������FOR UPDATE�Ӿ䣻
   /*
      ���Ӿ�Ὣ�α���ȡ���������ݽ����м������������ڱ��Ự�����ڼ䣬�����û��ĻỰ�Ͳ��ܶ�
      ��ǰ�α��е������н��и��²�����
   */
     
     set serveroutput on; 
    
    declare
       CURSOR USER_LIST IS SELECT * FROM USERS FOR UPDATE OF USER_GRADE;
       Grade_new USERS.USER_GRADE%TYPE;
    begin
       
       for usr in user_list loop
          Grade_new:=usr.USER_GRADE+1;
          update USERS SET USERS.USER_GRADE=Grade_new where user_id=usr.USER_ID;
          dbms_output.put_line(usr.User_Name);
       end loop;
       
       Exception when others then
          DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
    end;


    /*
      ��Oracle�У����е����񶼾߱������ԣ���һ���û��Ự��������������δ�ύʱ�������û��Ự���޷������ݽ�
      �и��µġ������ʱִ���α����ݵĸ��²������ͻ��������״̬��
      FOR UPDATE NOWAIT�Ӿ���Ա����α�����״̬��
      ʾ��1���������ȴ��α�
    
    */
    DECLARE
        CURSOR cur_emp IS SELECT * FROM emp WHERE deptno=10 FOR UPDATE OF sal,comm ;    
    BEGIN    
        FOR emp_row IN cur_emp LOOP
        
         UPDATE emp SET sal=9999 WHERE CURRENT OF cur_emp ; --��ʾ���µ�ǰ��
        
        END LOOP ;   
    END ;