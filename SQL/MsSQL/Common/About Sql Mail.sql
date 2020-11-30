declare @var1 int
declare @var2 int
exec @var2 = sp_xml_preparedocument @var1 output, '<abc><name>Sumit</name></abc>'
select 'Return value from sp_xml_preparedocument is: ' , @var2
select * from openxml (@var1, '/abc', 2) with (Name varchar(20) 'name')
exec @var2 = sp_xml_removedocument @var1
select 'Return value from sp_xml_removedocument is: ' , @var2


Use MSDB
Select count(*) from ExternalMailQueue 

-- get the unsent mail list
Use MSDB
select * from msdb.dbo.sysmail_unsentitems 

-- clear mail queue
Use MSDB
ALTER QUEUE ExternalMailQueue WITH STATUS = ON 
set nocount on
declare @Conversation_handle uniqueidentifier;
declare @message_type nvarchar(256);
declare @counter bigint;
declare @counter2 bigint;
set @counter = (select count(*) from ExternalMailQueue)
set @counter2=0
while (@counter2<=@counter)
begin
receive @Conversation_handle = conversation_handle, @message_type = message_type_name from ExternalMailQueue
set @counter2 = @counter2 + 1
end

-- start database mail 
Use MSDB    
EXEC sysmail_start_sp
