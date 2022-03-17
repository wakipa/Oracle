create table fact2
(fact_num number,
fact_cmt varchar2(25),
fact_mnt integer
)
organization external
( type oracle_loader
 default directory dir_externe
access parameters
	(
		RECORDS DELIMITED BY newline
		fields terminated by ','
		missing field values are null
		(fact_num,
		fact_cmt,
		fact_mnt
		)
	)
location ('fact.txt')
)
reject limit unlimited
;