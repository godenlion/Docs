-- ===========================================
--
--	����������
--
-- ===========================================
-- ��ѯ���е�DBCC���� 
DBCC HELP('?') 
-- ��ѯָ����DBCC������﷨˵�� 
DBCC HELP('����') 
-- ���ص�ǰ���ӵĻ(����)��SETѡ�� 
DBCC USEROPTIONS 


-- ===========================================
--
--	�����֤������
--
-- ===========================================
-- ���ָ�����ݿ�Ĵ��̿ռ����ṹ��һ���� 
DBCC CHECKALLOC('OCP_Traks')  
-- ���ָ�����ݿ��ϵͳ���ں�ϵͳ����һ���� 
DBCC CHECKCATALOG ('OCP_Traks') 
-- ������ݿ��е����ж���ķ���ͽṹ������ 
DBCC CHECKDB 

-- ���ָ�����ϵ�ָ��Լ��������Լ����������
DBCC CHECKCONSTAINTS ('tablename') 
 
-- ���ָ���ļ��������б��ڵ�ǰ���ݿ��еķ���ͽṹ������ 
DBCC CHECKFILEGROUP 
-- ���ָ�����������ͼ�����ݡ�������test��ntest��imageҳ�������� 
DBCC CHECKTABLE 
-- ���ָ���ĵ�ǰ��ʶֵ
DBCC CHECKIDENT 

--������������Ƿ�CPUʹ�ôﵽƿ�� 
--��ؼ���һ���ο�����num runnable,������ǰ�ж��ٸ��߳��ٵȴ����� 
--������ڵ���2,����CPU�ﵽƿ�� 
DBCC SQLPERF(UMSSTATS) undocumented in BOL 



-- ===========================================
--
--	ά�������� 
--
-- ===========================================
-- ����Alter table drop column���ɾ���ɱ䳤���л�text 
DBCC CLEANTABLE ('db_name','table_name') 
-- �ؽ�ָ�����ݿ��һ���������� 
DBCC DBREINDEX 
-- �Ա����ͼ�ϵ������ͷǾۼ�����������Ƭ����
DBCC INDEXDEFRAG 
--��������פ�����ڴ��� 
--�鿴��Щ��פ�����ڴ�ķ����ǣ� 
--select objectproperty(object_id('tablename'��,��tableispinned') 
DBCC PINTABLE (db_id,object_id) 
-- ����פ�����ڴ��еı�
DBCC UNPINTABLE (db_id,object_id) 
-- ����ָ�����ݿ�������ļ�����־�ļ���С 
DBCC SHRINKDATABASE(db_id,int) 
-- ����������ݿ��ָ�������ļ�����־�ļ���С 
DBCC SHRINKFILE(file_name,int) 

