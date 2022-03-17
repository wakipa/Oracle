
COL segment_name    FORMAT A35
COL tablespace_name FORMAT A15

 SELECT
        segment_name
       ,segment_type
       ,tablespace_name
       ,bytes
       ,blocks
       ,extents
  FROM
        user_segments
 WHERE
        segment_name LIKE UPPER('%&1%')
 ORDER
    BY  segment_type ASC
       ,segment_name ASC
 ;

CLEAR COL
UNDEFINE 1
 
