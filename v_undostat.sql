select to_char(begin_time,'dd/mm/yyyy hh24:mm:ss') debut
	, to_char(end_time,'dd/mm/yyyy hh24:mm:ss') fin
	, undoblks nb_blocs
	,txncount nb_transactions
	,maxconcurrency transaction_simult
from v$undostat
order by undoblks
;