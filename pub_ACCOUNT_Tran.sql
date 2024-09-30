-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'PRA_GLOBAL', @optname = N'publish', @value = N'true'
GO

exec [PRA_GLOBAL].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [PRA_GLOBAL]
exec sp_addpublication @publication = N'pub_ACCOUNT_Tran', @description = N'Transactional publication of database ''PRA_GLOBAL'' from Publisher ''PRAUK-DB-001''.', @sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'false', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'false', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'pub_ACCOUNT_Tran', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'NT AUTHORITY\SYSTEM'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'AK-GLOBAL\PRAUK-DB-001 - SQL Server Administrators'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'AK-GLOBAL\prauk-db-001-ssa'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'PRANT_1\DBASQLADMIN'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'PRANT_1\sa_solarwinds_dpa'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'PRANT_1\SQL DBAs'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'PRANT_1\DaElili'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'NT SERVICE\winmgmt'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'NT SERVICE\SQLSERVERAGENT'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'NT SERVICE\MSSQLSERVER'
GO
exec sp_grant_publication_access @publication = N'pub_ACCOUNT_Tran', @login = N'dbwitera'
GO

-- Adding the transactional articles
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCOUNT', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCOUNT', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCOUNT', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCOUNT]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCOUNT]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCOUNT]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCOUNT_ASSET', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCOUNT_ASSET', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCOUNT_ASSET', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCOUNT_ASSET]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCOUNT_ASSET]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCOUNT_ASSET]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCOUNT_AUDIT', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCOUNT_AUDIT', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCOUNT_AUDIT', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCOUNT_AUDIT]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCOUNT_AUDIT]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCOUNT_AUDIT]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCOUNT_SCORE', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCOUNT_SCORE', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCOUNT_SCORE', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCOUNT_SCORE]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCOUNT_SCORE]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCOUNT_SCORE]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCOUNT_STATUS_HIST', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCOUNT_STATUS_HIST', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCOUNT_STATUS_HIST', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCOUNT_STATUS_HIST]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCOUNT_STATUS_HIST]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCOUNT_STATUS_HIST]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_DBTR', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_DBTR', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_DBTR', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_DBTR]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_DBTR]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_DBTR]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_DBTR_ERASURE_CAPTURE', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_DBTR_ERASURE_CAPTURE', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'none', @destination_table = N'ACCT_DBTR_ERASURE_CAPTURE', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_DBTR_ERASURE_CAPTURE]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_DBTR_ERASURE_CAPTURE]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_DBTR_ERASURE_CAPTURE]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_DBTR_HIST', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_DBTR_HIST', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_DBTR_HIST', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_DBTR_HIST]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_DBTR_HIST]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_DBTR_HIST]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_DIR_DBT_INFO', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_DIR_DBT_INFO', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_DIR_DBT_INFO', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_DIR_DBT_INFO]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_DIR_DBT_INFO]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_DIR_DBT_INFO]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_DOC', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_DOC', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_DOC', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_DOC]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_DOC]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_DOC]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_INC_EXP', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_INC_EXP', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_INC_EXP', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_INC_EXP]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_INC_EXP]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_INC_EXP]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_INC_EXP_DATA', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_INC_EXP_DATA', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_INC_EXP_DATA', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_INC_EXP_DATA]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_INC_EXP_DATA]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_INC_EXP_DATA]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_INC_EXP_DATA_HIST', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_INC_EXP_DATA_HIST', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_INC_EXP_DATA_HIST', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_INC_EXP_DATA_HIST]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_INC_EXP_DATA_HIST]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_INC_EXP_DATA_HIST]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_INC_EXP_HIST', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_INC_EXP_HIST', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_INC_EXP_HIST', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_INC_EXP_HIST]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_INC_EXP_HIST]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_INC_EXP_HIST]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_PRTFLO', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_PRTFLO', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_PRTFLO', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_PRTFLO]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_PRTFLO]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_PRTFLO]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_PRTFLO_HIST', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_PRTFLO_HIST', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'manual', @destination_table = N'ACCT_PRTFLO_HIST', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_PRTFLO_HIST]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_PRTFLO_HIST]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_PRTFLO_HIST]'
GO
use [PRA_GLOBAL]
exec sp_addarticle @publication = N'pub_ACCOUNT_Tran', @article = N'ACCT_STAT_BAR', @source_owner = N'PRA_GLOBAL', @source_object = N'ACCT_STAT_BAR', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x00000000081B509F, @identityrangemanagementoption = N'none', @destination_table = N'ACCT_STAT_BAR', @destination_owner = N'PRA_GLOBAL', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_PRA_GLOBALACCT_STAT_BAR]', @del_cmd = N'CALL [sp_MSdel_PRA_GLOBALACCT_STAT_BAR]', @upd_cmd = N'SCALL [sp_MSupd_PRA_GLOBALACCT_STAT_BAR]'
GO

-- Adding the transactional subscriptions
use [PRA_GLOBAL]
exec sp_addsubscription @publication = N'pub_ACCOUNT_Tran', @subscriber = N'PRAUK-DB-004', @destination_db = N'PRA_GLOBAL', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'pub_ACCOUNT_Tran', @subscriber = N'PRAUK-DB-004', @subscriber_db = N'PRA_GLOBAL', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

