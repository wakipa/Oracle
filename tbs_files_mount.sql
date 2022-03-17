set linesize 200
set pagesize 100
col tablespace_name format a10
col file_name format a55
col content format a10

SELECT t.name AS tablespace_name,
        f.file#,
	f.name AS file_name,
	'DATA' as content,
	f.status,
	f.enabled,
	to_char(f.bytes,'9,999,999,999') taille
FROM v$datafile f
INNER JOIN v$tablespace t
	ON f.ts# = t.ts#
UNION ALL
SELECT t.name,
        f.file#, 
	f.name, 
	'TEMP',
	f.status,
	f.enabled,
	to_char(f.bytes,'9,999,999,999') taille
FROM v$tempfile f
INNER JOIN v$tablespace t
	ON f.ts# = t.ts#;

set linesize 150
set pagesize 25
clear col