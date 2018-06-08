/******************************************************************************/
/*
/*
/* �м������� ����ʹ��:OLD :NEW �����ֶ�
--  DML             OLD                        NEW
--  insert        δ�����ֶ�����Ϊnull         Ϊ��������
--  update        ��������ǰ����ֵ             ���º����
--  delete        ɾ����ֵ                    û�ж��� Ϊnull
/*
/******************************************************************************/
--                                                     �����������Լ20��� ���뱾�� 

create or replace TRIGGER Check_stu_is_OK
before
insert or update OF user_birthday  on users
for each row
declare 

begin 
 if inserting then
    if trunc(months_between(sysdate,:new.user_birthday)/12) >20 then
      RAISE_APPLICATION_ERROR(-20000, '����! ���ݲ��ϸ�! �������20��~');
    end if;  
 end if;
 
 if updating then
   if trunc(months_between(sysdate,:new.user_birthday)/12) >20 then
    RAISE_APPLICATION_ERROR(-20000, '����! ���ݲ��ϸ�! �������20��~');
   end if;
 end if;
 
end;


select * from users;

update users set user_birthday=to_date('1991-05-6','yyyy-mm-dd') where USER_ID='2017110410';

select trunc(months_between(sysdate,to_date('2009-05-6 21:32:21','yyyy-mm-dd hh24:mi:ss'))/12) from dual;

