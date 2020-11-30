
USE AutoTest_APP
GO 

-- 1 clear and stop the transaction
DUMP TRANSACTION AutoTest_APP WITH NO_LOG
GO
-- 2. release log
BACKUP LOG AutoTest_APP WITH NO_LOG
GO

-- 3. cut log file
USE AutoTest_APP
GO 
DBCC SHRINKFILE([AutoTest_LOG], 1)
GO
