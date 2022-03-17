col grantee FORMAT A15
col owner FORMAT A15
col table_name FORMAT A15
col privilege FORMAT A10

col grantable FORMAT A10

col grantor FORMAT A15

col common FORMAT A6

select grantee
, type
, owner
,table_name
,	privilege
, grantable
, grantor
, common
 from dba_tab_privs
where grantee like upper('%&1%')
order by grantee, type, owner, table_name, privilege;

clear col