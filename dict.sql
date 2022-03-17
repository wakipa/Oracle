set verify off
set pagesize 0
set linesize 200
col comments format a80

SELECT table_name, comments
FROM dict
WHERE table_name LIKE UPPER('%&name%')
ORDER BY table_name;

set verify on
set pagesize 25
set linesize 150
clear col