sp_change_users_login 'AUTO_FIX','ZH-ACPDB-SRV\SQLServer2005MSFTEUser$ZH-ACPDB-SRV$MSSQLSERVER'

-- 查看独立帐号
sp_change_users_login 'report'
go
-- 解决孤立帐号
sp_change_users_login 'update_one','ZH-ACPDB-SRV\SQLServer2005MSFTEUser$ZH-ACPDB-SRV$MSSQLSERVER','ZH-ACPDB-SRV\SQLServer2005MSFTEUser$ZH-ACPDB-SRV$MSSQLSERVER'
go
sp_change_users_login 'update_one','wsAppsUser','wsAppsUser'
go
sp_change_users_login 'update_one','query','query'
go
sp_change_users_login 'update_one','acpda_test','acpda_test'
go

sp_change_users_login 'update_one','Epr0mUser','Epr0mUser'
go

sp_change_users_login 'update_one','EpromUser','EpromUser'
go


sp_change_users_login 'update_one','Fina1test','Fina1test'
go


sp_change_users_login 'update_one','Finaltest','Finaltest'
go


sp_change_users_login 'report'
go
--sp_change_users_login 'update_one','Epr0mUser','Epr0mUser'
--go
--sp_change_users_login 'update_one','Epr0mUser','Epr0mUser'
--go


