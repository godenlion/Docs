-- Search
select *
-- backup records
-- into CacheDataForOtherDB.dbo.testresults
-- delete records 
-- delete
from testresults --(nolock)
where serialno in ('123', '1234','12345','123456','1234567','123456789','000000')

select count(*) from CacheDataForOtherDB.dbo.testresults

-- Search
select * 
-- backup records
-- into CacheDataForOtherDB.dbo.eepromdata
-- delete records 
-- delete
from eepromdata --(nolock)
where newserialnumber in ('123', '1234','12345','123456','1234567','123456789','000000')




