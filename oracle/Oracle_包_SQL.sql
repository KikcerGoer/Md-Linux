/*
ʹ��Student, SC, Course���ű����洢���̺ͺ������������Ĺ��ܣ�
   �û������������γ������ɼ�����ɶ�SC��Ĳ��������������ɹ������سɹ���Ϣ��������ʧ�ܣ����ش�����Ϣ��
   
   ����ĿҪע�⿼�Ǳ��֮��Ĺ�ϵ�������������γ����ͳɼ����������Ų�ͬ�ı�񣬶�����Ҫ�����ݲ��뵽SC���У�
   ���Ҫ���ж������Ϳγ����Ƿ���ȷ��Ȼ���ٽ���ת��Ϊѧ�źͿγ̺ţ�ͬ�ɼ�һ����뵽SC����У��������Ѿ�ѡ��
   �˸ÿγ̣�Ӧ�øĲ���Ϊ�޸ģ��������ĸÿγ̳ɼ���Ϊ�û�����ĳɼ���  
*/

CREATE OR REPLACE Procedure InertIntoSC(s_name varchar2,c_name varchar2,mark number,return_number out number) 
is
    sc_count int :=0;
    s_count int :=0;
    c_count int:=0;
    s_id varchar(40);
    c_id varchar(40);
    shoose_count int:=0;
begin
     select count(*) into s_count from STUDENT where SNAME=s_name;
     select count(*) into c_count from  COURSE where CNAME=c_name;
     
     if s_count<= 0 then
       return_number :=0 ;  ---������Ϣ: ��ʾû�д�ѧ��
     elsif c_count <=0 then
      return_number :=-1 ;  ---������Ϣ: ��ʾû�пγ� 
     else
         select SNO into s_id  from STUDENT where SNAME=s_name;
         select CNO into c_id from  COURSE where CNAME=c_name;
         
         select count(*) into sc_count from  SC where TRIM(SNO) =TRIM(s_id) and TRIM(CNO)=trim(c_id); 
          
         if(sc_count >0 )then
            update SC set GRADE = mark where TRIM(SNO) =TRIM(s_id) and TRIM(CNO)=trim(c_id); 
         else
            select count(*) into shoose_count from SC where  TRIM(CNO)=trim(c_id); 
            if(shoose_count > 50) then
               return_number :=-10; --������Ϣ ��ʾѡ���Ѿ�����
            else
               insert into SC(SNO,CNO,GRADE) VALUES(s_id,c_id,mark);
               return_number :=1; --��Ϣ ��ʾһ������
            end if;
         end if;
     end if;       
end;





alter table STUDENT add constraint uq_sname unique(SNAME);
