


use TestDB4Partion
go

alter database TestDB4Partion add file 
	(Name=N'TestDB4Partion_P1',FileName=N'D:\DB\TestDB4Partion\TestDB4Partion_P1.ndf'
		, Size=5MB, MaxSize=100MB, FileGrowth=5MB)
	TO FileGroup P1
	
alter database TestDB4Partion add file 
	(Name=N'TestDB4Partion_P2',FileName=N'D:\DB\TestDB4Partion\TestDB4Partion_P2.ndf'
		, Size=5MB, MaxSize=100MB, FileGrowth=5MB)
	TO FileGroup P2
	
alter database TestDB4Partion add file 
	(Name=N'TestDB4Partion_P3',FileName=N'D:\DB\TestDB4Partion\TestDB4Partion_P3.ndf'
		, Size=5MB, MaxSize=100MB, FileGrowth=5MB)
	TO FileGroup P3
	
alter database TestDB4Partion add file 
	(Name=N'TestDB4Partion_P4',FileName=N'D:\DB\TestDB4Partion\TestDB4Partion_P4.ndf'
		, Size=5MB, MaxSize=100MB, FileGrowth=5MB)
	TO FileGroup P4
GO