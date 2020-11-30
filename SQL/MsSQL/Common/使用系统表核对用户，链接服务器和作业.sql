-- job 
select * from msdb.dbo.sysjobs (nolock)
order by name 

-- link server
SELECT * FROM sys.servers
order by name

-- user 
Select * From sys.syslogins  
where name not like '#%'
order by name


SELECT CAST([Provider Name] AS VARCHAR(30)) ProviderName,
CAST([Provider Description] AS VARCHAR(60)) ProviderDescription
FROM OPENROWSET(
'SQLOLEDB',
'Server=.;Trusted_Connection=yes',
'SET FMTONLY OFF;
EXEC master..xp_enum_oledb_providers'
)

SELECT * FROM sys.linked_logins

SELECT * FROM sys.servers
order by name
