SET VERIFY OFF
COL name    FORMAT A45
COL value   FORMAT A70
COL ses_maj FORMAT A9
COL pdb_maj FORMAT A9

 SELECT
         name
        ,isses_modifiable  AS ses_maj
        ,issys_modifiable  AS sys_maj
        ,ispdb_modifiable  AS pdb_maj
        ,value
   FROM
         v$system_parameter2
  WHERE
         name LIKE LOWER('%&1%')
  ORDER
     BY  name    ASC
;

CLEAR COL
UNDEFINE 1
SET VERIFY ON
