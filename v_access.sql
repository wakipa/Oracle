set verify off
col owner format a15
col object format a25
col type format a15

select sid
	,owner
	,object
	,type
from v$access
where owner=upper('&utilisateur');

set verify on
clear col