
  create table MEMBERINFO(
    mid varchar(30) , --primary key not null,
    email varchar(30) ,--unique
    age int ,--check(age >18 and age <150),
    constraint uk_emali unique(email),
    constraint pk_mid primary key(mid),
    constraint ck_age check((age >18) and (age <150)),
    constraint Fk_mid foreign key(mid) references  users(USER_ID) 
  )
  --UK UL 
  /*Լ�������� Լ����д_�ֶ�*/
  alter table member add constraint uk_email unique(emali);
  alter table member add constraint pk_mid primary key(mid);
  
  -- ����Լ�� PK
  
  --�鿴Լ��
  select * from SYS.USER_CONSTRAINTS where table_name='MEMBERINFO';
  
  select * from SYS.USER_CONS_COLUMNS where table_name='MEMBERINFO';
  
  --�޸�Լ��
  --�ǿ�Լ��
  alter table MEMBERINFO modify(AGE int not null);
  -- ��������
  alter table MEMBERINFO disable constraint PK_MID;

  alter table MEMBERINFO disable constraint PK_MID cascade ;--����������ϵ
  
  --��������
  alter table MEMBERINFO Enable constraint PK_MID;
 --ɾ��Լ��
 
  alter table MEMBERINFO drop constraint PK_MID;
   