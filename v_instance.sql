SELECT
	instance_name
	,status
	,to_char(startup_time,'yyyy/mm/dd hh24:mi') demarrage
	,logins
	,con_id
FROM
	v$instance
;