/********************************************************
批量模糊查询
********************************************************/
-- 1， 创建查询关键字的临时表
declare @qTable table 
(
querystring varchar(50)
)
-- 2. 创建临时待查询的关键字列表
insert into @qTable
select ss='A0001' 
union
select ss='B0001'
-- 3. 检验数据是否正确
select * from @qTable
-- 4. 执行模糊查询
select * from (
	select SN='A0001-1'
	union
	select 'A0001-2'
	union
	select 'A0001-3'
	union
	select 'A0001-4'
	union
	select 'B0001-1'
	union
	select 'B0001-2'
	union
	select 'C0001-1'
	union
	select 'C0001-2'
) t
inner join @qTable tt on t.sn like tt.querystring+'%'

