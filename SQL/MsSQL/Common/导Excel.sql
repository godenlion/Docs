EXEC master..xp_cmdshell 'bcp "select ''Term'',''Badge'',''Name'',''ActualAttendance'',''OvertimeOnWeekdays'',''WeekendOvertime'',''HolidayOvertime'' union all select term,badge,name,acthour,ot1,ot2,ot3 from OPHR.DBO.aVW_AttendForCis where recno<60001 " q
ueryout D:\SqlExportFile\HR_AutoImport_Attend_1.xls -w -q -S"172.16.129.57" -U"hr_interface" -P"hr_interface"'




EXEC master..xp_cmdshell 'bcp "select * from [AgileWorkFlowData].dbo.APS_SD_CustomerMasterWorkflow_Serial" q
ueryout \\FESVMAPWEB01\SharedFolder\test_1.xls -w -q -S"." -U"AgilePointDB" -P"o6AD4BiT"'



use master;
go

sp_configure 'show advanced options',1
reconfigure
go
sp_configure 'xp_cmdshell',1
reconfigure
go