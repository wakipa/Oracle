SET VERIFY OFF
COL name    FORMAT A45
COL value   FORMAT A70

 SELECT
         name
        ,value
   FROM
         v$spparameter
  WHERE
         name LIKE LOWER('%&1%')
  ORDER
     BY  name    ASC
  ;

CLEAR COL
UNDEFINE 1
SET VERIFY ON
