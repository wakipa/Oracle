set linesize 150
col nom format a15


select
tablespace_name as nom,
block_size as bloc,
initial_extent as init,
max_extents as max,
min_extlen as min,
pct_increase as pourcent,
extent_management as manage,
allocation_type as type
from dba_tablespaces
;