--�����û���Ϊmysa���û���������Ҫ���ñ��Ȩ��Ϊ��SELECT,INSERT,DELETE,UPDATE
--���ô洢���̵�Ȩ��Ϊ��EXECUTE
--����1��ִ����������
select 'GRANT SELECT, INSERT, DELETE, UPDATE ON ' + ltrim(rtrim(name)) + ' to mysa;' from sysobjects where type = 'U'
union select 'GRANT EXECUTE ON ' + ltrim(rtrim(name)) + ' to mysa;' from sysobjects where type = 'P'
--����2����ִ�еĽ�����Ƴ�������ִ�С�