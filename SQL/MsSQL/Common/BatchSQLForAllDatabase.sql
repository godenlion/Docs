

-- normal action:
DBCC CHECKDB
DBCC UPDATEUSAGE(DatabaseName,"dbo.ObjectName");


-- Batch action:
USE master
GO
EXEC sp_MSforeachdb @command1="print '?' EXEC [?].dbo.sp_updatestats"
 
USE master
GO
EXEC sp_MSforeachdb @command1="print '?' DBCC UPDATEUSAGE (?)"






