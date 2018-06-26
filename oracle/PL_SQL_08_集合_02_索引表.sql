-----������   �����ڳ�������֮�е�����  ���Ա���������
-- ���ҿ���ͨ���±����ÿһ������,����Oracle���Զ����������±����͵���������������Ҳ�������ַ���

-- ��������Ҫ���г�ʼ�� ����Ϊָ��������ֵ ���ٵ��������������һ����Ҫ����
-- �������С�����������Ҳ�������ַ��� ������map
-- �����±�Ҳ�����Ǹ���

type �������� is table of �������� [not null]
index by [pls_integer][binary_integer] [VARCHAR2(����)]


-- value.EXISTS(key) �ж��Ƿ��������
set serveroutput on;

declare 
   type info_index is table of varchar(20) 
   index by pls_integer;
   v_info info_index;
   v_length int :=0;  --��¼���� ���ڱ���
begin
     v_info(1):='��ð�';
     v_length:=v_length+1;
     v_info(2):='���Ǻ�';
     v_length:=v_length+1;   
     
     for vars in 1..v_length loop
       if v_info.EXISTS(vars) then
          DBMS_OUTPUT.PUT_LINE(v_info(vars));
       else
          DBMS_OUTPUT.PUT_LINE('���ݲ�����');
       end if;
     end loop;
end;


-- ��ֵ��
desc  C##KICKER.USERS;
declare 
   type info_index is table of C##KICKER.USERS%rowtype 
   index by pls_integer;
   v_info info_index;
   v_length int :=0;  --��¼���� ���ڱ���
begin
     v_info(1).User_iD :='��ð�';
     v_info(1).User_Name :='����';
     v_info(1).USER_BIRTHDAY:= To_date('2018-05-06','yyyy-mm-dd');
     v_info(1).USER_GRAde:=10;
     v_info(1).USER_STATUS:=10;
     v_info(1).USER_CLASS:=10; 
     v_length:=v_length+1;
     
     for vars in  1..v_length  loop
       if v_info.EXISTS(vars) then
          DBMS_OUTPUT.PUT_LINE(v_info(vars).User_Name);
       else
          DBMS_OUTPUT.PUT_LINE('���ݲ�����');
       end if;
     end loop;
end;