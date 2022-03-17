set pagesize 0
set feedback off
col name format a30
col value format 99999999999999

select name, value
from v$sga;

select lpad('-', 30, '-') || ' ' || lpad('-', 15, '-')
from dual;

select 'Total SGA' as name, sum(value) as value
from v$sga;

set pagesize 50
set feedback on
clear col