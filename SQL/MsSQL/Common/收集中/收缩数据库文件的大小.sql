
-- 查看当前数据库的情况
sp_helpdb 'MyworkSpace'

-- 查看数据库的空间使用情况
sp_spaceused 

-- 收缩文件,若不成功,则继续
DBCC SHRINKDATABASE ([MyworkSpace], TRUNCATEONLY)

-- 重新统计数据库的使用情况
dbcc updateusage (MyworkSpace)


-- 收缩文件
use MyworkSpace
GO
-- 查看文件基本信息
select * from sysfiles
-- 收缩单个文件
DBCC SHRINKFILE
( 3	-- fileID
  , 200   -- 预留的空间大小， 单位为M
)
