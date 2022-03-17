COL grantee FORMAT A35

COL admin_option FORMAT A15
COL common FORMAT A6



select grantee,
	privilege,
	admin_option,
	common
from dba_sys_privs
where grantee like upper('%&1%')
order by grantee, privilege;

clear col