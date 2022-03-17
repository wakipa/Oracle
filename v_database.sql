COL name FORMAT A10

SELECT name
	,open_mode
	,log_mode
	,checkpoint_change#
	,cdb
	,con_id
	,con_dbid
FROM
	v$database
;

CLEAR COL