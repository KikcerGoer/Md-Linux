-- Rank() ���� ����һ�����  ��� Order by  �����ڲ����� 

select User_Id,User_Grade,USER_NAME,Rank()  Over(Order by User_ID) rk from users;