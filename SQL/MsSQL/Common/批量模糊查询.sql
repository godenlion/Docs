/********************************************************
����ģ����ѯ
********************************************************/
-- 1�� ������ѯ�ؼ��ֵ���ʱ��
declare @qTable table 
(
querystring varchar(50)
)
-- 2. ������ʱ����ѯ�Ĺؼ����б�
insert into @qTable
select ss='A0001' 
union
select ss='B0001'
-- 3. ���������Ƿ���ȷ
select * from @qTable
-- 4. ִ��ģ����ѯ
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

