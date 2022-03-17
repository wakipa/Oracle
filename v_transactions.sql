SELECT s.sid, s.serial#, s.username, t.xidusn, t.addr, t.status, t.start_time
FROM v$session s
join v$transaction t on s.saddr=t.ses_addr
where s.username<>'SYS'
;