set linesize 200
set pagesize 100
col tablespace_name format a15
col file_name format a50


SELECT t.tablespace_name,
	f.file_name,
	f.status,
	to_char(f.bytes,'9,999,999,999') taille
FROM dba_data_files f
INNER JOIN dba_tablespaces t
	ON f.tablespace_name = t.tablespace_name
UNION ALL
SELECT t.tablespace_name,
	f.file_name,
	f.status,
	to_char(f.bytes,'9,999,999,999') taille
FROM dba_temp_files f
INNER JOIN dba_tablespaces t
	ON f.tablespace_name = t.tablespace_name;

set linesize 150
set pagesize 25
clear col