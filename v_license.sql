select
	sessions_max
	,users_max
	,sessions_current
	,sessions_highwater
from v$license;