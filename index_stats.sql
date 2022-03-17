col name format a20
select name
	,height
	,pct_used
	,del_lf_rows/lf_rows 
from index_stats;
clear col