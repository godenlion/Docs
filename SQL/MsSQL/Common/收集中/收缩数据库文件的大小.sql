
-- �鿴��ǰ���ݿ�����
sp_helpdb 'MyworkSpace'

-- �鿴���ݿ�Ŀռ�ʹ�����
sp_spaceused 

-- �����ļ�,�����ɹ�,�����
DBCC SHRINKDATABASE ([MyworkSpace], TRUNCATEONLY)

-- ����ͳ�����ݿ��ʹ�����
dbcc updateusage (MyworkSpace)


-- �����ļ�
use MyworkSpace
GO
-- �鿴�ļ�������Ϣ
select * from sysfiles
-- ���������ļ�
DBCC SHRINKFILE
( 3	-- fileID
  , 200   -- Ԥ���Ŀռ��С�� ��λΪM
)
