-- ʹ�� SQL Mail XPs ѡ����ڴ˷����������� SQL Mail(��ѡ��Ĭ���ǹرյ�)
-- ����������Ч������ֹͣ������������������

sp_configure 'show advanced options', 1
go
Reconfigure;
go
sp_configure 'SQL Mail XPs', 1
go
Reconfigure;
go


-- ���ʼ����Լ���ѯ���ݿ��ʼ���־��
 
Exec msdb.dbo.sp_send_dbmail @profile_name='Database_System',
    @recipients='chengc@oplink.com.cn',
    @subject='���ݿ��ʼ�����',
    @body='hello, this is a test mail!'
Go