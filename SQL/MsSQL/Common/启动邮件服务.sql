-- 使用 SQL Mail XPs 选项可在此服务器上启用 SQL Mail(该选项默认是关闭的)
-- 设置立即生效，无需停止并重新启动服务器，

sp_configure 'show advanced options', 1
go
Reconfigure;
go
sp_configure 'SQL Mail XPs', 1
go
Reconfigure;
go


-- 发邮件测试及查询数据库邮件日志：
 
Exec msdb.dbo.sp_send_dbmail @profile_name='Database_System',
    @recipients='chengc@oplink.com.cn',
    @subject='数据库邮件测试',
    @body='hello, this is a test mail!'
Go