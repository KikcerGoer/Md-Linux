 /************************* ------------ - PL/SQL ���̿��� - ----------- *************************/
/* if���̿���
  if condition then
     null;
   end if;
   
   if condition then
    null;
   elsif  condition then
    null;
   else 
    null;
   end if;
   
  if condition then
     null;
   else
     null;
   end if;
*/
set serveroutput on;
declare
   v_age int:=&input_your_age;
begin
  
     if v_age >18 then
     dbms_output.put_line('����һ���������ˣ�');
     else
     dbms_output.put_line('�㻹С!');
     end if;
  /*************************************************/   
     if (v_age!=18) then
        dbms_output.put_line('�����㲻��ʮ����');
     elsif v_age<0 then
        dbms_output.put_line('����û�г�����!');
      else 
        dbms_output.put_line('���������:'||v_age);
      end if;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

/*
  case [����] 
     when ֵ|���ʽ then
        ִ������;
     when ֵ|���ʽ then
        ִ������;
     when ֵ|���ʽ then
        ִ������;
     else
        �������;
  end case;
*/

declare
   val_color int :=32;
begin
   -- ����case
   case val_color 
      when 31 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ��:��ɫ');
      when 32 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ��:��ɫ');
      when 33 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ��:��ɫ');
      when 34 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ��:��ɫ');
      when 35 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ��:��ɫ');
      when 36 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ��:��ɫ');
      else
         DBMS_OUTPUT.PUT_LINE('��֪���������ֵ');
    end case;
    
   -- ���ʽcase
   case  
      when val_color > 30 and val_color < 40 then
         DBMS_OUTPUT.PUT_LINE('�����ɫֵ�Ǻϸ��!');
      when val_color < 30 then
         DBMS_OUTPUT.PUT_LINE('�����ɫֵ̫С��!�޷���ʾ');
      when val_color >=40 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ̫��ǿ��!');
      when val_color =35 then
         DBMS_OUTPUT.PUT_LINE('�����ɫ����������!');
      else
         DBMS_OUTPUT.PUT_LINE('��֪���������ֵ');
    end case; 
    
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- ѭ���ṹ  Loop For ѭ��

/*
  Loop 
    ѭ��ִ�е�����;
    EXIT WHEN ѭ����������;
    ѭ�����������޸�;
  End Loop
  
  While(condition) Loop
    ѭ����ִ�е�����;
    ѭ�������������޸�
  END Loop  
  
*/
declare
   v_loop_count int :=1;
begin 
   ---Loopѭ��
   Loop 
      DBMS_OUTPUT.PUT_LINE('��ð�! �ѽ�ѭ��'||v_loop_count||'����!');
      v_loop_count:=v_loop_count+1;
      exit when v_loop_count>10;
   end loop;   
     v_loop_count:=1;
  
   DBMS_OUTPUT.PUT_LINE('/*********ѭ�����¿�ʼʹ�� while***********/');
  
   while v_loop_count<=10 Loop
      DBMS_OUTPUT.PUT_LINE('��ð�! �ѽ�ѭ��'||v_loop_count||'����!');
      v_loop_count:=v_loop_count+1;
   end loop;
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;


/*
 
 for ѭ������in ѭ���������� ..ѭ���������� loop
    ѭ��ִ�е�����;
 End Loop;
 

*/
  declare
     v_val int :=1;
  begin
     for v_val in  1..5 loop
        DBMS_OUTPUT.PUT_LINE('��ð�! �ѽ�ѭ��'||v_val||'����!');
     end loop;
     
     DBMS_OUTPUT.PUT_LINE('/********************/');
     
     for v_val in reverse  1..5 loop
        DBMS_OUTPUT.PUT_LINE('��ð�! �ѽ�ѭ��'||v_val||'����!');
     end loop;
         
     Exception when others then
        DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
  end;

/*
  exit;
  continue;
  Goto;  <<endpoint>>  goto endpoint;
*/