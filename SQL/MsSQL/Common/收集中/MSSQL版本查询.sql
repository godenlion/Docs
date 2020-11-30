--如何确定所运行的 SQL Server 2005 的版本？
--要确定所运行的 SQL Server 2005 的版本，请使用 SQL Server Management Studio 连接到 SQL Server 2005，然后运行以下 Transact-SQL 语句：

SELECT SERVERPROPERTY('productversion'), SERVERPROPERTY ('productlevel'), SERVERPROPERTY ('edition')
