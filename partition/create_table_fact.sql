create table fact
(fact_num number,
fact_cmt varchar2(25),
fact_mnt number(8,2),
fact_date date
)
storage
( initial 10 K
 next 10 K
	)
partition by range (fact_date)
(
partition fact_old
	values less than (to_date('01-01-2012','DD-MM-YYYY')) tablespace users,
partition fact_act
	values less than (to_date('01-01-3000','DD-MM-YYYY')) tablespace stage_tab
)
;