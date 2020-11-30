select * into #tmp from dbo.tblTestResult


select * from #tmp


update #tmp set PassOrFail=0  where id < 200
WAITFOR DELAY '00:00:00:100'

update #tmp set PassOrFail=0  where id >= 200 AND id < 500
WAITFOR DELAY '00:00:00:100'

update #tmp set PassOrFail=0  where id >= 500 AND id < 2000
WAITFOR DELAY '00:00:00:100'

update #tmp set PassOrFail=0  where id >= 2000 AND id < 5000
WAITFOR DELAY '00:00:00:100'

update #tmp set PassOrFail=0  where id >= 5000 

