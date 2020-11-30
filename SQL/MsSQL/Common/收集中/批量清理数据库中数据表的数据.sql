-- 我有一個數據庫 BTIDBMP,現在我想將里面除SYS開頭以及三個特殊表外的所有用戶表清空，存儲過程如下：
create  proc DeleteTableData
as

set nocount on
print '正在處理，請稍候。。。'

begin tran tran_del

declare @SQL  nvarchar(500)
declare @TName nvarchar(30)
select name into #tablelist  from sysobjects  where type='U'  order by name
declare cursor_a cursor for
    select name from #tablelist
    open cursor_a
    fetch next from cursor_a into @TName
    while @@fetch_status=0
       begin
              if  objectproperty(object_id(@TName),'IsUserTable')=1  and left(@TName,3)<>'SYS'    and @TName<>'PUR01030'  and  @TName<>'PUR01031'    and  @TName<>' PUR01010'
               --1.先禁止所有的觸發器和約束
              SET   @SQL='ALTER TABLE  '      +  @TName  +'  DISABLE  TRIGGER ALL  '
             EXEC sp_executesql  @SQL
             SET   @SQL='ALTER TABLE  '      +  @TName  +'  NOCHECK CONSTRAINT   ALL '
              EXEC sp_executesql  @SQL

             --2.清空數據
                SET   @SQL= 'TRUNCATE  TABLE  '  +  @TName
                EXEC sp_executesql  @SQL

              --3.啟用所有的觸發器和約束
              SET   @SQL='ALTER TABLE  '      +  @TName  +'  ENABLE  TRIGGER ALL  '
              EXEC sp_executesql  @SQL
              SET   @SQL='ALTER TABLE  '      +  @TName  +'  CHECK CONSTRAINT   ALL '
              EXEC sp_executesql  @SQL

                fetch next from cursor_a into @TName  
      end
    
if @@error<>0
begin
   rollback tran tran_del
   print '清除數據失敗!'
end
else
begin
   commit tran tran_del
  set nocount off
  print '清除數據完畢!'
end

--當我執行存儲過程：
exec DeleteTableData
--出現以下錯誤：
Server: Msg 4712, Level 16, State 1, Line 1
--Cannot truncate table 'ATT03020' because it is being referenced by a FOREIGN KEY constraint.
--即有外鍵或主鍵約束的表則不能清空內容，請問我該如何修改存儲過程，謝謝！

--在網上找了一下，但也沒有找到合適的辦法，主要是不能解決有外鍵約束的問題。



--简化的批处理操作

--先禁用所有外键约束
exec sp_msforeachtable "alter table ? nocheck CONSTRAINT all"

--然后删除数据
exec sp_msforeachtable @command1='truncate table ?'
                       ,@whereand='and name not like ''sys%'' 
                                   and name not in(''特殊表1'',''特殊表2'',''特殊表3'')'

--再启用所有外键约束
exec sp_msforeachtable "alter table ? check constraint all"

--简化的批处理操作 II
alter table tbname nocheck CONSTRAINT all
--上面语句对外銉是没用的
truncate table
--是不记录日志的，所以也不会触发触发器。
--建义楼主先把所有存在外鍵约束的表找出来，修改关系为级联删除，然后再执行下面语句
exec sp_msforeachtable @command1='truncate table ?'
                       ,@whereand='and name not like ''sys%'' 
                                   and name not in(''特殊表1'',''特殊表2'',''特殊表3'')
