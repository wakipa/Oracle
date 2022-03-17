set termout off
set linesize 255
set pagesize 0
set feedback off 

spool fichiers.txt

select name from v$controlfile;
select name from v$datafile;
select name from v$tempfile;
select member from v$logfile;

spool off
set termout on
set linesize 200
set pagesize 5000
set feedback on