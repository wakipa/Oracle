COL segment_name FORMAT a30

SELECT
       segment_type
      ,segment_name
      ,bytes
      ,extents
  FROM 
       user_segments
 WHERE 
       segment_name like upper('%&1%')
 ORDER
    BY segment_type
      ,segment_name
;

CLEAR COL
UNDEFINE 1