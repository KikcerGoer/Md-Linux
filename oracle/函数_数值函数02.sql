/*C:\Users\Kick\AppData\Roaming\SQL Developer*/
 -- sum 
 -- ��� ������� �߼��÷�
  select sum(case when Grade>=60 then 1 else 0 end) as �������� from sc;
 
 -- round��float,savePoint��; 
 -- ������λС�� ��������
 select round(95.625,2) from dual;
 -- trunc ��ȡС��
 select TRUNC(15.79),TRUNC(15.71239,2) from dual;
 
 -- ȡ������
 -- floor / ceil
 select floor(98.56) as floor����ȡ�� ,CEIL(56.235) ����ȡ��  from dual;
 