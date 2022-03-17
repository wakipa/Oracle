col name format a60
select name
	,status
	,con_id
from v$controlfile
order by name;
clear col