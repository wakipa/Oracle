COL grantee      FORMAT A35

COL granted_role FORMAT A35

COL admin_option FORMAT A15

COL default_role FORMAT A15

COL common       FORMAT A6



SELECT  grantee
, granted_role
, admin_option
, default_role
, common
 from
 dba_role_privs
 WHERE
 grantee LIKE UPPER('%&1%')
 ORDER
 BY grantee, granted_role
;




CLEAR COL
