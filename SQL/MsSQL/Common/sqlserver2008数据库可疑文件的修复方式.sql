

--   sqlserver2008���ݿ�����ļ����޸���ʽ��
--1.�������ݿ�״̬���ű�
EXEC sp_resetstatus 'MfgControl'
--2.�������ݿ�Ϊ����ģʽ���ű�
ALTER DATABASE MfgControl SET EMERGENCY
--3.�������ݿ�Ϊ���û�ģʽ�������ݿ����޸�ֻ���ڵ��û�ģʽ�£����ű�
ALTER DATABASE MfgControl SET SINGLE_USER
--4.��鲢�޸����ݿ⣬����ʾ���޸����ݿ���ܶ�ʧ���ݣ�����Ӧ�ò��ᶪʧ���ݿ����ݣ��������ݿ���־�������Խ��ܵ��ƻ����ű�
DBCC CheckDB (MfgControl, REPAIR_ALLOW_DATA_LOSS)
--5.�ָ����ݿ�Ϊ���û�ģʽ���ű�
ALTER DATABASE MfgControl SET MULTI_USER
--�����岽�����޸�sqlserver2008�еĿ����ļ�


--dbcc rebuild_log('MfgControl','D:\SQL_Log\MfgControl.ldf')
----��֤���ݿ�һ���ԣ���ʡ�ԣ�
--dbcc checkdb('MfgControl')

-- �ָ����ݿ�״̬
ALTER DATABASE dbName SET ONLINE
GO
-- �������ݿ�Ϊ���û�״̬
ALTER DATABASE dbName MULTI_USER
GO


-- ���ݿ�״̬
select name,status from sysdatabases
-- Ad hoc updates to system catalogs are not allowed.