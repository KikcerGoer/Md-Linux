/*
create force|noforce or replace view viewname
as
 slect * from .....
*/
-- force ��ʾҪ������ͼ�ı�����ҲҪ������ͼ
-- noforce ��ʾ�������޷�������ͼ

create or replace view stuinfo
as
select * from  Student inner join SC on SC.SNO=STUDENT.SNO;


