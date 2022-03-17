set linesize 200
col name format a55

select file#
	,name
	,bytes taille
	,status
	,enabled
	,con_id
from v$tempfile
order by con_id;

clear col