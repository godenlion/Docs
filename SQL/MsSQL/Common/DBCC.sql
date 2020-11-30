-- ===========================================
--
--	帮助类命令
--
-- ===========================================
-- 查询所有的DBCC命令 
DBCC HELP('?') 
-- 查询指定的DBCC命令的语法说明 
DBCC HELP('命令') 
-- 返回当前连接的活动(设置)的SET选项 
DBCC USEROPTIONS 


-- ===========================================
--
--	检查验证类命令
--
-- ===========================================
-- 检查指定数据库的磁盘空间分配结构的一致性 
DBCC CHECKALLOC('OCP_Traks')  
-- 检查指定数据库的系统表内和系统表间的一致性 
DBCC CHECKCATALOG ('OCP_Traks') 
-- 检查数据库中的所有对象的分配和结构完整性 
DBCC CHECKDB 

-- 检查指定表上的指定约束或所有约束的完整性
DBCC CHECKCONSTAINTS ('tablename') 
 
-- 检查指定文件组中所有表在当前数据库中的分配和结构完整性 
DBCC CHECKFILEGROUP 
-- 检查指定表或索引视图的数据、索引及test、ntest和image页的完整性 
DBCC CHECKTABLE 
-- 检查指定的当前标识值
DBCC CHECKIDENT 

--可以用来检查是否CPU使用达到瓶颈 
--最关键的一个参考数据num runnable,表明当前有多少个线程再等待运行 
--如果大于等于2,考虑CPU达到瓶颈 
DBCC SQLPERF(UMSSTATS) undocumented in BOL 



-- ===========================================
--
--	维护类命令 
--
-- ===========================================
-- 回收Alter table drop column语句删除可变长度列或text 
DBCC CLEANTABLE ('db_name','table_name') 
-- 重建指定数据库的一个或多个索引 
DBCC DBREINDEX 
-- 对表或视图上的索引和非聚集索引进行碎片整理
DBCC INDEXDEFRAG 
--将表数据驻留在内存中 
--查看哪些表驻留在内存的方法是： 
--select objectproperty(object_id('tablename'）,‘tableispinned') 
DBCC PINTABLE (db_id,object_id) 
-- 撤消驻留在内存中的表
DBCC UNPINTABLE (db_id,object_id) 
-- 收缩指定数据库的数据文件和日志文件大小 
DBCC SHRINKDATABASE(db_id,int) 
-- 收缩相关数据库的指定数据文件和日志文件大小 
DBCC SHRINKFILE(file_name,int) 

