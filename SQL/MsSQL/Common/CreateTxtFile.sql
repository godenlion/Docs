

declare @sqlstr varchar(3000)
set @sqlstr='bcp "select a=''employee_id|name|class_code|id'' union all select top 10 a=cast(employee_id as varchar(100))+''|''+rtrim(name)+''|''+class_code+''|''+cast(id as varchar(100)) from other.dbo.employee (nolock) " queryout "c:\3.txt" -c -T'
exec master.dbo.xp_cmdshell @sqlstr



