/*
 1. �����ӳ��� ԭ��: ��������������:32K

 */
 
 create or replace function stu_avg_grade
 return NUMBER
 as
   sum_avg_avg number;
 begin
    select avg(sum_avg) into sum_avg_avg from STUDENT;
    return 30;
 end;
 
 --------------------------------
 create or replace trigger insert_student
 before 
 update or insert on Student
 for each row
 begin
     if :new.Sum_Avg <stu_avg_grade() then
         raise_application_error(-20520,'���ϸ��ܳɼ�!');
     end if;
 end;
  
  
 -------------------------------- 
select avg(sum_avg)   from STUDENT;

select * from student;

update student SET SUM_AVG=300 WHERE sno='002';

/*
  �ع�һ��
 */
rollback;
















