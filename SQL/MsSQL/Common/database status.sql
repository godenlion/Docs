alter database OPHR0417 set EMERGENCY   
alter database OPHR0417 set single_user
--alter database OPHR0417 set read_write
dbcc checkdb(OPHR0417)
dbcc checkdb(OPHR0417, repair_allow_data_loss)
alter database OPHR0417 set multi_user   
alter database OPHR0417 set online

-- dbcc rebuild_log('OPHR0417','E:\DB_Test_Log\OPHR0417_1.ldf')

USE master ;
ALTER DATABASE OPHR0417 SET RECOVERY FULL ;


select name,status,* from sysdatabases
where name='OPHR0417'

select name,state_desc,* from sys.databases
where name='OPHR0417'

update sysdatabases
set status=0
where name='OPHR0417'
