-- 1. 查看数据库服务器支持的OLEDB驱动
EXEC master.dbo.sp_MSset_oledb_prop

-- 2. 设置OLEDB驱动的属性
-- 设置为进程内执行
EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'AllowInProcess', 1    
-- 设置动态参数
EXEC master.dbo.sp_MSset_oledb_prop N'OraOLEDB.Oracle', N'DynamicParameters', 1  
