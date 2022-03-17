SELECT 	usn
     	,rssize
     	,xacts nb_transactions
     	,extents nb_extents
	,extends nb_extensions
	,shrinks     
     	,status
FROM v$rollstat
;