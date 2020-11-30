
-- create temp table
declare @T table (ID int, xmlContent xml)

-- get test data
insert into @T
select billofladingid, cast(billofladingxml as xml)
from tblbilloflading (nolock)
where billofladingid = 9024707


declare @newContainerList varchar(max)  
set @newContainerList = '
<Container>111111</Container>
<Container>111112</Container>
<Container>111113</Container>
<Container>111114</Container>
'


select xmlContent from @T
select xmlContent.query('//PartNumber[@QtyShipped > 0]//Container')
from @T

-- delete
update @T
set xmlContent.modify('
 delete //PartNumber[@QtyShipped > 0]//ContainerList//Container
')

select xmlContent.query('//PartNumber[@QtyShipped > 0]//Container')
from @T

-- insert 
update @T
set xmlContent.modify('
insert <Container>111111</Container> as last
into (//PartNumber[@QtyShipped > 0]//ContainerList)[1]
')

update @T
set xmlContent.modify('
insert <Container>222222</Container> as last
into (//PartNumber[@QtyShipped > 0]//ContainerList)[1]
')


select xmlContent.query('//PartNumber[@QtyShipped > 0]//Container')
from @T

select xmlContent from @T

