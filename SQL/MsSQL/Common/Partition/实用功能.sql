
use TestDB4Partion
go

-- 使用$Partition函数可以查看分区表的信息, 其语法结构如下:
-- [数据库名.]$Partition.<分区函数名>(<表达式>)

-- 1. 查看分区依据列的指定值所在的分区
SELECT $Partition.[TestDB4PartionPartitionFution]('2012-09-21')

-- 2. 查看分区表中每个非空分区的行数
SELECT $Partition.[TestDB4PartionPartitionFution]([CreatedTime]) AS ParttitionNumber, Count(*) RecordCount
FROM tblActionLog
Group by $Partition.[TestDB4PartionPartitionFution]([CreatedTime])

-- 3. 查看指定分区中的所有记录
SELECT * FROM tblActionLog
WHERE $Partition.[TestDB4PartionPartitionFution]([CreatedTime]) = 5

