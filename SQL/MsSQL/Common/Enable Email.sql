Use MSDB   
EXEC sysmail_start_sp




USE Master
GO
sp_configure 'show advanced options', 1
GO
reconfigure with override
GO
sp_configure 'Database Mail XPs', 1
GO
reconfigure with override 
GO
sp_configure 'show advanced options', 0
GO


sp_configure

