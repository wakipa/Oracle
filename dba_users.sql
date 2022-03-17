
COL username         FORMAT A25
COL common           FORMAT A6
COL def_tbs          FORMAT A10
COL tmp_tbs          FORMAT A10
COL account_status   FORMAT A25
COL profile             FORMAT A10
COL authentication_type FORMAT A10
COL initial_rsrc_consumer_group FORMAT A30
 SELECT 
         username
        ,common
        ,default_tablespace   AS def_tbs
        ,temporary_tablespace AS tmp_tbs
        ,account_status
        ,profile
        ,authentication_type
	,initial_rsrc_consumer_group
  FROM 
         dba_users
  WHERE 
         username LIKE UPPER('%&1%')
  ORDER
     BY  username ASC
 ;

CLEAR COL
UNDEFINE 1

