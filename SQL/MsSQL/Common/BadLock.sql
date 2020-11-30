use master
go

select spid, blocked, loginame, last_batch, status, cmd, hostname, program_name
from sysprocesses
where spid in
( select blocked from sysprocesses where blocked <> 0 ) or (blocked <>0)

/*
-- kill 916
sp_lock
sp_who 916
*/

select top 1 * from ocp_traks.dbo.testresults_dwdm



