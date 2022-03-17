SET VERIFY OFF
COL name    FORMAT A45
COL value   FORMAT A70
COL ses_maj FORMAT A9

 SELECT
         name
        ,isses_modifiable  as ses_maj
        ,issys_modifiable  as sys_maj
        ,value
   FROM
         v$parameter2
  WHERE
         name LIKE LOWER('%&1%')
  ORDER
     BY  name    ASC
  ;

CLEAR COL
UNDEFINE 1
SET VERIFY OFF
