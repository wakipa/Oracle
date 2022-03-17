COL profile FORMAT A20
COL resource_name FORMAT A32

COL resource_type FORMAT A15

COL limit FORMAT A30


select 	profile
	,resource_type
	,resource_name
	,limit
	,common
from dba_profiles
where profile like upper('%&1%')
order by 2,3
;


CLEAR COL

UNDEFINE 1

