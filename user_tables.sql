
COL table_name      FORMAT A30
COL tablespace_name FORMAT A20
COL logging         FORMAT A8
COL temporary       FORMAT A10
COL dropped         FORMAT A7

  SELECT
           temporary 
         , table_name
         , tablespace_name
         , pct_free
         , initial_extent
         , logging
         , dropped
         , container_data
    FROM
           user_tables
   WHERE
           table_name LIKE UPPER('%&1%')
   ORDER
      BY   temporary   ASC
         , table_name  ASC
  ;    


CLEAR COL
UNDEFINE 1
