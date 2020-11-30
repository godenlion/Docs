--对于用户名为mysa的用户，我们需要设置表的权限为：SELECT,INSERT,DELETE,UPDATE
--设置存储过程的权限为：EXECUTE
--步骤1：执行下面的语句
select 'GRANT SELECT, INSERT, DELETE, UPDATE ON ' + ltrim(rtrim(name)) + ' to mysa;' from sysobjects where type = 'U'
union select 'GRANT EXECUTE ON ' + ltrim(rtrim(name)) + ' to mysa;' from sysobjects where type = 'P'
--步骤2：将执行的结果复制出来，再执行。