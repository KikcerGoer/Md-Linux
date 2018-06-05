
set serveroutput on;
set linesize 20;
declare 
   cursor stu_cursor is select sc.sno,sc.cno,STUDENT.SNAME,COURSE.CNAME,sc.GRADE from sc
                        inner join STUDENT ON TRIM(STUDENT.SNO)=trim(sc.SNO) 
                        inner join  C##Mydbadmin.course ON TRIM(COURSE.CNO)=TRIM(sc.CNO)
                        /*WHERE GRADE >(SELECT AVG(GRADE) from sc  where sc.CNO =CNO)*/
                        order by sc.SNO,SC.CNO,sc.GRADE desc;
   Sno varchar(20):='###';
   Cno varchar(20);
   Sname varchar(20);
   Cname varchar(20);
   Cgrade number;
   vmax_grade number;
   SgradeAvrage number;  --�洢ƽ����
   strlength int;        --ѡ������
   huanhang int:=0;      --���п���
begin
    SYS.DBMS_OUTPUT.PUT_LINE('----------------------| �� �� �� �� |------------------------');
    SYS.DBMS_OUTPUT.PUT_LINE('ѧ��       �γ̺�          ����        �ɼ�        �γ�����   ');
     dbms_output.put_line(lpad('-',60,'-'));
     
    for rw in stu_cursor loop
        if rw.sno!=Sno
        then
          SYS.DBMS_OUTPUT.PUT_LINE(' ');
          select avg(grade) into SgradeAvrage   from SC group by SNO having Sno=rw.Sno;
          select count(*) into strlength   from SC group by SNO having Sno=rw.Sno;    --����ѡ������
          select max(GRADE) into vmax_grade   from SC where  Sno=rw.Sno;    --������߷�
          dbms_output.put_line(substr(rw.Sname,0,5)||' ѧ��: '||trim(rw.sno)||'  ƽ���ɼ� :'||ROUND(SgradeAvrage,0) ||'   ѡ����: '||strlength||'  ��߷֣�'||vmax_grade||'         |');
          dbms_output.put_line(lpad('-',60,'-'));
          Sno:=rw.sno;
        end if;
        SYS.DBMS_OUTPUT.PUT_LINE('|            '||rw.cno||'  |       '||SubStr(rw.Sname,0,5)||'|     '||TO_CHAR(rw.Grade)||'   |   '||SubStr(rw.Cname,0,9)||'|');
        dbms_output.put_line(lpad('-',60,'-'));
    end loop; 
end;

   