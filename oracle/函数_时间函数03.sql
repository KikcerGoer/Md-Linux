/************ʱ�亯��******************/

--�鿴 ��ǰʱ�� Ĭ����ʾ������   �����Ҫ��ʾ������Ϣ��Ҫ�ı����Ի���
select sysdate from dual;

alter session set nls_date_format ='yyyy-mm-dd hh24:mi:ss';

--����������

select sysdate +3 from dual;

--add_months(date,numberofmonthCount);
-- ������ ����  ��С�� ����
select  sysdate ����,ADD_MONTHS(sysdate,3) as ������֮�� from dual;

select ADD_MONTHS(sysdate,3)-sysdate ������� from dual;

--��һ��ָ�����ڵ���� �뵽������������ȫ����ͨ�õģ���Ӧ�ÿ�����1--7�������ڼ� ��

select NEXT_DAY(SYSDATE,1) from dual;
--���һ��
select LAST_DAY(SYSDATE)from dual;

--�鿴�������
select months_between(ADD_MONTHS(sysdate,50),sysdate) from dual;

-- ����ʱ����� ��Ϊ�������

--�鿴 �������
select trunc(months_between(sysdate,to_date('1995-8-5 21:32:21','yyyy-mm-dd hh24:mi:ss'))/12) from dual;

--extract
-- ʱ���ȡ
/*
EXTRACT (  
        { YEAR | MONTH | DAY | HOUR | MINUTE | SECOND }  
        | { TIMEZONE_HOUR | TIMEZONE_MINUTE }  
        | { TIMEZONE_REGION | TIMEZONE_ABBR }  
FROM { date_value | interval_value } )  
*/
select EXTRACT(YEAR from sysdate) year,EXTRACT(month FROM sysdate) aS MonTH ,EXTRACT(day FROM sysdate) AS DAY from dual;
--����ת������
select to_timestamp('2015/5/8 12:53:25','yyyy-mm-dd hh24-mi:ss') from dual;








