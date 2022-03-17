col username format a10
col osuser format a20
col machine format a15
col taddr format a10


select sid, serial#, username, osuser, machine, status,TADDR, to_char(logon_time,'DD-MM-YYYY-HH:MI') heure
from v$session
where username <>'SYS';

clear col