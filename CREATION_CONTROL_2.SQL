-- The following are current System-scope REDO Log Archival related
-- parameters and can be included in the database initialization file.
--
-- LOG_ARCHIVE_DEST=''
-- LOG_ARCHIVE_DUPLEX_DEST=''
--
-- LOG_ARCHIVE_FORMAT=ARC%S_%R.%T
--
-- DB_UNIQUE_NAME="orcl"
--
-- LOG_ARCHIVE_CONFIG='SEND, RECEIVE, NODG_CONFIG'
-- LOG_ARCHIVE_MAX_PROCESSES=4
-- STANDBY_FILE_MANAGEMENT=MANUAL
-- STANDBY_ARCHIVE_DEST=%ORACLE_HOME%\RDBMS
-- FAL_CLIENT=''
-- FAL_SERVER=''
--
-- LOG_ARCHIVE_DEST_1='LOCATION=C:\app\oracle\product\12.1.0\dbhome_1\RDBMS'
-- LOG_ARCHIVE_DEST_1='MANDATORY NOREOPEN NODELAY'
-- LOG_ARCHIVE_DEST_1='ARCH NOAFFIRM NOVERIFY SYNC'
-- LOG_ARCHIVE_DEST_1='NOREGISTER NOALTERNATE NODEPENDENCY'
-- LOG_ARCHIVE_DEST_1='NOMAX_FAILURE NOQUOTA_SIZE NOQUOTA_USED NODB_UNIQUE_NAME'
-- LOG_ARCHIVE_DEST_1='VALID_FOR=(PRIMARY_ROLE,ONLINE_LOGFILES)'
-- LOG_ARCHIVE_DEST_STATE_1=ENABLE

--
-- Below are two sets of SQL statements, each of which creates a new
-- control file and uses it to open the database. The first set opens
-- the database with the NORESETLOGS option and should be used only if
-- the current versions of all online logs are available. The second
-- set opens the database with the RESETLOGS option and should be used
-- if online logs are unavailable.
-- The appropriate set of statements can be copied from the trace into
-- a script file, edited as necessary, and executed when there is a
-- need to re-create the control file.
--
--     Set #1. NORESETLOGS case
--
-- The following commands will create a new control file and use it
-- to open the database.
-- Data used by Recovery Manager will be lost.
-- Additional logs may be required for media recovery of offline
-- Use this only if the current versions of all online logs are
-- available.

-- After mounting the created controlfile, the following SQL
-- statement will place the database in the appropriate
-- protection mode:
--  ALTER DATABASE SET STANDBY DATABASE TO MAXIMIZE PERFORMANCE

STARTUP NOMOUNT
CREATE CONTROLFILE REUSE DATABASE "ORCL" NORESETLOGS  NOARCHIVELOG
    MAXLOGFILES 16
    MAXLOGMEMBERS 3
    MAXDATAFILES 100
    MAXINSTANCES 8
    MAXLOGHISTORY 292
LOGFILE
  GROUP 1 (
    'C:\APP\ORACLE\ORADATA\ORCL\REDO01A.LOG',
    'C:\STAGE\ORADATA\REDO01B.LOG'
  ) SIZE 50M BLOCKSIZE 512,
  GROUP 2 (
    'C:\APP\ORACLE\ORADATA\ORCL\REDO02A.LOG',
    'C:\STAGE\ORADATA\REDO02B.LOG'
  ) SIZE 50M BLOCKSIZE 512,
  GROUP 3 (
    'C:\APP\ORACLE\ORADATA\ORCL\REDO03A.LOG',
    'C:\STAGE\ORADATA\REDO03B.LOG'
  ) SIZE 100M BLOCKSIZE 512
-- STANDBY LOGFILE
DATAFILE
  'C:\APP\ORACLE\ORADATA\ORCL\SYSTEM01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\SYSAUX01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\UNDOTBS01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\USERS01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\EXAMPLE01.DBF'
CHARACTER SET WE8MSWIN1252
;

-- Commands to re-create incarnation table
-- Below log names MUST be changed to existing filenames on
-- disk. Any one log file from each branch can be used to
-- re-create incarnation records.
-- ALTER DATABASE REGISTER LOGFILE 'C:\APP\ORACLE\PRODUCT\12.1.0\DBHOME_1\RDBMS\ARC0000000001_0857983248.0001';
-- ALTER DATABASE REGISTER LOGFILE 'C:\APP\ORACLE\PRODUCT\12.1.0\DBHOME_1\RDBMS\ARC0000000001_0896804431.0001';
-- Recovery is required if any of the datafiles are restored backups,
-- or if the last shutdown was not normal or immediate.
RECOVER DATABASE

-- Database can now be opened normally.
ALTER DATABASE OPEN;

-- Commands to add tempfiles to temporary tablespaces.
-- Online tempfiles have complete space information.
-- Other tempfiles may require adjustment.
ALTER TABLESPACE TEMP ADD TEMPFILE 'C:\APP\ORACLE\ORADATA\ORCL\TEMP01.DBF'
     SIZE 62914560  REUSE AUTOEXTEND ON NEXT 655360  MAXSIZE 32767M;
-- End of tempfile additions.
--
--     Set #2. RESETLOGS case
--
-- The following commands will create a new control file and use it
-- to open the database.
-- Data used by Recovery Manager will be lost.
-- The contents of online logs will be lost and all backups will
-- be invalidated. Use this only if online logs are damaged.

-- After mounting the created controlfile, the following SQL
-- statement will place the database in the appropriate
-- protection mode:
--  ALTER DATABASE SET STANDBY DATABASE TO MAXIMIZE PERFORMANCE

STARTUP NOMOUNT
CREATE CONTROLFILE REUSE DATABASE "ORCL" RESETLOGS  NOARCHIVELOG
    MAXLOGFILES 16
    MAXLOGMEMBERS 3
    MAXDATAFILES 100
    MAXINSTANCES 8
    MAXLOGHISTORY 292
LOGFILE
  GROUP 1 (
    'C:\APP\ORACLE\ORADATA\ORCL\REDO01A.LOG',
    'C:\STAGE\ORADATA\REDO01B.LOG'
  ) SIZE 50M BLOCKSIZE 512,
  GROUP 2 (
    'C:\APP\ORACLE\ORADATA\ORCL\REDO02A.LOG',
    'C:\STAGE\ORADATA\REDO02B.LOG'
  ) SIZE 50M BLOCKSIZE 512,
  GROUP 3 (
    'C:\APP\ORACLE\ORADATA\ORCL\REDO03A.LOG',
    'C:\STAGE\ORADATA\REDO03B.LOG'
  ) SIZE 100M BLOCKSIZE 512
-- STANDBY LOGFILE
DATAFILE
  'C:\APP\ORACLE\ORADATA\ORCL\SYSTEM01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\SYSAUX01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\UNDOTBS01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\USERS01.DBF',
  'C:\APP\ORACLE\ORADATA\ORCL\EXAMPLE01.DBF'
CHARACTER SET WE8MSWIN1252
;

-- Commands to re-create incarnation table
-- Below log names MUST be changed to existing filenames on
-- disk. Any one log file from each branch can be used to
-- re-create incarnation records.
-- ALTER DATABASE REGISTER LOGFILE 'C:\APP\ORACLE\PRODUCT\12.1.0\DBHOME_1\RDBMS\ARC0000000001_0857983248.0001';
-- ALTER DATABASE REGISTER LOGFILE 'C:\APP\ORACLE\PRODUCT\12.1.0\DBHOME_1\RDBMS\ARC0000000001_0896804431.0001';
-- Recovery is required if any of the datafiles are restored backups,
-- or if the last shutdown was not normal or immediate.
RECOVER DATABASE USING BACKUP CONTROLFILE

-- Database can now be opened zeroing the online logs.
ALTER DATABASE OPEN RESETLOGS;

-- Commands to add tempfiles to temporary tablespaces.
-- Online tempfiles have complete space information.
-- Other tempfiles may require adjustment.
ALTER TABLESPACE TEMP ADD TEMPFILE 'C:\APP\ORACLE\ORADATA\ORCL\TEMP01.DBF'
     SIZE 62914560  REUSE AUTOEXTEND ON NEXT 655360  MAXSIZE 32767M;
-- End of tempfile additions.
--
