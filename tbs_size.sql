col tablespace_name format a10
col file_name format a50

select f.tablespace_name, 
	f.file_name, 
	count(e.extent_id) as nb_extents, 
	sum( e.bytes) as bytes
from dba_data_files f
left outer join dba_extents e
on f.file_id = e.file_id 
group by f.tablespace_name, 
	f.file_name
order by f.tablespace_name, 
	f.file_name
;

clear col