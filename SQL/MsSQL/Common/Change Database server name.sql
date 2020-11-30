
select @@servername

sp_dropserver 'WIN-932FJECJFRA'
go 

sp_addserver 'TWIOT-PROD-SRV1','local'
go

-- restart SQL server service ( and Agent service)
