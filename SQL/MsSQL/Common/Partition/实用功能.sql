
use TestDB4Partion
go

-- ʹ��$Partition�������Բ鿴���������Ϣ, ���﷨�ṹ����:
-- [���ݿ���.]$Partition.<����������>(<���ʽ>)

-- 1. �鿴���������е�ָ��ֵ���ڵķ���
SELECT $Partition.[TestDB4PartionPartitionFution]('2012-09-21')

-- 2. �鿴��������ÿ���ǿշ���������
SELECT $Partition.[TestDB4PartionPartitionFution]([CreatedTime]) AS ParttitionNumber, Count(*) RecordCount
FROM tblActionLog
Group by $Partition.[TestDB4PartionPartitionFution]([CreatedTime])

-- 3. �鿴ָ�������е����м�¼
SELECT * FROM tblActionLog
WHERE $Partition.[TestDB4PartionPartitionFution]([CreatedTime]) = 5

