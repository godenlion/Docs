-- 1. �鿴���ݿ������֧�ֵ�OLEDB����
EXEC master.dbo.sp_MSset_oledb_prop

-- 2. ����OLEDB����������
-- ����Ϊ������ִ��
EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'AllowInProcess', 1    
-- ���ö�̬����
EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'DynamicParameters', 1  
