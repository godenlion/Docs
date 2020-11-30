

--   sqlserver2008数据库可疑文件的修复方式：
--1.设置数据库状态，脚本
EXEC sp_resetstatus 'MfgControl'
--2.设置数据库为紧急模式，脚本
ALTER DATABASE MfgControl SET EMERGENCY
--3.设置数据库为单用户模式（对数据库检查修复只能在单用户模式下），脚本
ALTER DATABASE MfgControl SET SINGLE_USER
--4.检查并修复数据库，会提示你修复数据库可能丢失数据，正常应该不会丢失数据库数据，但是数据库日志的完整性将受到破坏，脚本
DBCC CheckDB (MfgControl, REPAIR_ALLOW_DATA_LOSS)
--5.恢复数据库为多用户模式，脚本
ALTER DATABASE MfgControl SET MULTI_USER
--以上五步即可修复sqlserver2008中的可疑文件


--dbcc rebuild_log('MfgControl','D:\SQL_Log\MfgControl.ldf')
----验证数据库一致性（可省略）
--dbcc checkdb('MfgControl')

-- 恢复数据库状态
ALTER DATABASE dbName SET ONLINE
GO
-- 设置数据库为多用户状态
ALTER DATABASE dbName MULTI_USER
GO


-- 数据库状态
select name,status from sysdatabases
-- Ad hoc updates to system catalogs are not allowed.