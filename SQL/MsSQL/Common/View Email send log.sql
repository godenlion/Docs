
-- view send email log 

SELECT *
FROM msdb.dbo.sysmail_allitems

SELECT *
FROM msdb.dbo.sysmail_sentitems

SELECT *
FROM msdb.dbo.sysmail_unsentitems

SELECT *
FROM msdb.dbo.sysmail_faileditems
where mailitem_id > 11635 