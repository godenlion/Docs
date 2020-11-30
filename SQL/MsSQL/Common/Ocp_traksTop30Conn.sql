select top 30 HostName, program_name , count(*)
from sys.sysprocesses s  
inner join  sys.databases d on s.dbid=d.database_id  
where s.dbid=5 and s.status='sleeping' --and s.Loginame in ('EpromUser', 'Finaltest')  
group by HostName, program_name  
--having count(*) > 100  
order by count(*) desc  


select d.name,count(*)
from sys.databases d 
inner join sys.sysprocesses s  on s.dbid=d.database_id 
group by d.name
order by count(*) desc
