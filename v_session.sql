SELECT SID
	,SERIAL#
	,SADDR
FROM v$session
WHERE OSUSER IS NOT NULL
ORDER BY 'username';