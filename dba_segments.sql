COL owner        FORMAT A15
COL segment_type FORMAT A15
COL segment_name FORMAT A25

 SELECT
        owner
       ,segment_type
       ,segment_name
       ,blocks
       ,bytes
   FROM
        dba_segments
  WHERE
        owner = upper('&1')
  ORDER
     BY segment_type ASC
       ,segment_name ASC
 ;

CLEAR COL

 
