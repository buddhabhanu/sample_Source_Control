-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'PRA_GLOBAL', @optname = N'publish', @value = N'true'
GO

exec [PRA_GLOBAL].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [PRA_GLOBAL]
exec sp_addpublication @publication = N'pub_EVENT_LOG_Tran', @description = N'Transactional publication of database ''PRA_GLOBAL'' from Publisher ''PRAUK-DB-001''.', @sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'pub_EVENT_LOG_Tran', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'AK-GLOBAL\PRAUK-DB-001 - SQL Server Administrators'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'AK-GLOBAL\prauk-db-001-ssa'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'PRANT_1\DBASQLADMIN'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'PRANT_1\sa_solarwinds_dpa'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'PRANT_1\SQL DBAs'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'PRANT_1\DaElili'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'NT SERVICE\winmgmt'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'NT SERVICE\MSSQLSERVER'
GO
exec sp_grant_publication_access @publication = N'pub_EVENT_LOG_Tran', @login = N'dbwitera'
GO

-- Adding the transactional articles
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_EVENT_LOG_Tran', @article = N'EVENT_LOG', @source_owner = N'PRA_GLOBAL', @source_object = N'EVENT_LOG', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'EVENT_LOG', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALEVENT_LOG]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALEVENT_LOG]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALEVENT_LOG]'
GO

-- Adding the transactional subscriptions
use [PRA_GLOBAL]
exec sp_addsubscription @publication = N'pub_EVENT_LOG_Tran', @subscriber = N'PRAUK-DB-004', @destination_db = N'PRA_GLOBAL', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'pub_EVENT_LOG_Tran', @subscriber = N'PRAUK-DB-004', @subscriber_db = N'PRA_GLOBAL', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

