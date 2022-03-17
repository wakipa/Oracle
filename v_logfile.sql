set linesize 150
col member  format a50
col gstatus format a15
col mstatus format a15

select  g.group#
       	,g.sequence#
       	,g.bytes
       	,g.status as gstatus
	,g.first_change#
       	,m.member
       	,m.status as mstatus
	from
        v$log     g
        join v$logfile m
	on
        g.group# = m.group#
 order
    by  g.group#
       ,m.member
;

clear col