set pagesize 2000
col audit_type format a20
col action_name format a30
col object_name format a30
select audit_type
	,dbusername
	,event_timestamp
	,action_name
	,object_schema
	,object_name
	,system_privilege
	,object_privileges
from unified_audit_trail;

set pagesize 80
clear col