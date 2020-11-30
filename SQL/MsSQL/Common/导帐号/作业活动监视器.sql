	




declare  @table TABLE(
	[job_id] [uniqueidentifier] NULL,
	[originating_server] [nvarchar](128) NULL,
	[name] [sysname] NULL,
	[enabled] [tinyint] NULL,
	[description] [nvarchar](512) NULL,
	[start_step_id] [int] NULL,
	[category] [sysname] NULL,
	[owner] [sysname] NULL,
	[notify_level_eventlog] [int] NULL,
	[notify_level_email] [int] NULL,
	[notify_level_netsend] [int] NULL,
	[notify_level_page] [int] NULL,
	[notify_email_operator] [sysname] NULL,
	[notify_netsend_operator] [sysname] NULL,
	[notify_page_operator] [sysname] NULL,
	[delete_level] [int] NULL,
	[date_created] [datetime] NULL,
	[date_modified] [datetime] NULL,
	[version_number] [int] NULL,
	[last_run_date] [int] NOT NULL,
	[last_run_time] [int] NOT NULL,
	[last_run_outcome] [int] NOT NULL,
	[next_run_date] [int] NOT NULL,
	[next_run_time] [int] NOT NULL,
	[next_run_schedule_id] [int] NOT NULL,
	[current_execution_status] [int] NOT NULL,
	[current_execution_step] [sysname] NULL,
	[current_retry_attempt] [int] NOT NULL,
	[has_step] [int] NULL,
	[has_schedule] [int] NULL,
	[has_target] [int] NULL,
	[type] [int] NOT NULL
) 



	insert @table
	exec [zh-db-srv].msdb.dbo.sp_help_job

	select * from @table 