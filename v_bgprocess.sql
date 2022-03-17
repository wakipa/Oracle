select name
	,description
from v$bgprocess
where paddr<>'00'
order by name;