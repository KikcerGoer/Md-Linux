/**********************************************************/
--                                                       --
--  �ص� ����Ϥ�ĵط�  Iinicap �� InStr  ����ĸ��д ���Һ���  --
--                                                       --
/**********************************************************/

-- 1. lower
--ȫСд
select lower('JaKe Linke') from dual;
-- 2. Upeer 
--ȫ��д
select upper('Jake Linke') from dual;
-- 3. initcap
-- ����ĸ��д 
select INITCAP('the soap') Catpure from dual;
-- 4. Repalce
--�滻
select  replace('ABAAACDEFGABCDEFG','A','_') from dual;
-- 5. Lnegth
--��ȡ����
select Length('ABDEFGHIJKLMN') FROM DUAL;
-- 6. SubStr(string,start,end) 
-- SubStr(string,start)
-- ��ȡ�ַ���
select substr('ABCDEFGHIJKLMNOPQRSDUVWSYZ',0,5) FROM DUAL;
select substr('ABCDEFGHIJKLMNOPQRSDUVWSYZ',5) FROM DUAL;
-- CHR ASCII
select CHR(73) FROM DUAL;      -- 73->I
SELECT ascii('I') FROM DUAL;   -- i->73
-- trim �����ո�
select   trim('   ABCDEFG   ') from DUAL;
-- LPAD RPAD
select LPAD('ABCD',50,'_') from dual;
select RPAD('ABCD',50,'_') from dual;
--INSTR
-- ���� �����ַ���һ�γ��ֵ�λ�� �����߼�λ�ô�1��ʼ
select INSTRB('CORPORATE FLOOR','OR') as results FROM DUAL;

select INSTRB('CORPORATE FLOOR','XXX') as results FROM DUAL;












