SET LINESIZE 200
SET PAGESIZE 0
SET HEADING OFF
SET FEEDBACK OFF
SET VERIFY OFF

SPOOL kill_orcl.sql
	SELECT 'ALTER SYSTEM KILL SESSION ' 
		|| '''' 
		|| sid 
		|| ',' 
		|| serial# 
		|| '''' 
		|| ';'
	FROM v$session
	WHERE username = upper('&1');
SPOOL OFF

@kill_orcl.sql
HOST DEL kill_orcl.sql

SET LINESIZE 150
SET PAGESIZE 25
SET HEADING ON
SET FEEDBACK ON
SET VERIFY ON