/*
  ��Oracle֮��ÿһ��session��ӵ�ж�����ʳ��,����һ������������ж���ִ��һϵ�е�SQL���²�����
  ��Щ���ܵ�һ��������������,�����û������Ҫ�����������ִ��Commit����rollback֮��ſ���
  ��������������ӳ���֮������Ҫ���ж������������� ���ҿ�������������ʹ��COMMit ��RollBack��Ӱ��������
  ������ô��Ҫ����������п��ơ�
 */

declare
   -- ��ʱ �����񱻹һ�
   pragma autonomous_transaction; --������������
begin
   insert into SC VALUES('005','C09',98);
   commit; --�ύ�������� ������������
   -- ���� rollback ������Ӱ��������
   Exception when others then
      DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
end;

-- ��system�û����Ѿ���������