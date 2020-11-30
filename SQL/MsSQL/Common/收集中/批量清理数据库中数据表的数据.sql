-- ����һ�������� BTIDBMP,�F�����댢�����SYS�_�^�Լ������������������Ñ�����գ��惦�^�����£�
create  proc DeleteTableData
as

set nocount on
print '����̎��Ո�Ժ򡣡���'

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
               --1.�Ƚ�ֹ���е��|�l���ͼs��
              SET   @SQL='ALTER TABLE  '      +  @TName  +'  DISABLE  TRIGGER ALL  '
             EXEC sp_executesql  @SQL
             SET   @SQL='ALTER TABLE  '      +  @TName  +'  NOCHECK CONSTRAINT   ALL '
              EXEC sp_executesql  @SQL

             --2.��Ք���
                SET   @SQL= 'TRUNCATE  TABLE  '  +  @TName
                EXEC sp_executesql  @SQL

              --3.�������е��|�l���ͼs��
              SET   @SQL='ALTER TABLE  '      +  @TName  +'  ENABLE  TRIGGER ALL  '
              EXEC sp_executesql  @SQL
              SET   @SQL='ALTER TABLE  '      +  @TName  +'  CHECK CONSTRAINT   ALL '
              EXEC sp_executesql  @SQL

                fetch next from cursor_a into @TName  
      end
    
if @@error<>0
begin
   rollback tran tran_del
   print '�������ʧ��!'
end
else
begin
   commit tran tran_del
  set nocount off
  print '��������ꮅ!'
end

--���҈��д惦�^�̣�
exec DeleteTableData
--���F�����e�`��
Server: Msg 4712, Level 16, State 1, Line 1
--Cannot truncate table 'ATT03020' because it is being referenced by a FOREIGN KEY constraint.
--�������I�����I�s���ı�t������Ճ��ݣ�Ո����ԓ����޸Ĵ惦�^�̣��x�x��

--�ھW������һ�£���Ҳ�]���ҵ����m���k������Ҫ�ǲ��ܽ�Q�����I�s���Ć��}��



--�򻯵����������

--�Ƚ����������Լ��
exec sp_msforeachtable "alter table ? nocheck CONSTRAINT all"

--Ȼ��ɾ������
exec sp_msforeachtable @command1='truncate table ?'
                       ,@whereand='and name not like ''sys%'' 
                                   and name not in(''�����1'',''�����2'',''�����3'')'

--�������������Լ��
exec sp_msforeachtable "alter table ? check constraint all"

--�򻯵���������� II
alter table tbname nocheck CONSTRAINT all
--�������������û�õ�
truncate table
--�ǲ���¼��־�ģ�����Ҳ���ᴥ����������
--����¥���Ȱ����д������IԼ���ı��ҳ������޸Ĺ�ϵΪ����ɾ����Ȼ����ִ���������
exec sp_msforeachtable @command1='truncate table ?'
                       ,@whereand='and name not like ''sys%'' 
                                   and name not in(''�����1'',''�����2'',''�����3'')
