set linesize 150
set verify off
set pagesize 30
col name format a35 
col value format a30

accept name prompt 'Propriete :'

select	 property_name name
	, property_value value
from database_properties
where property_name='GLOBAL_DB_NAME'
or property_name like upper('%&name%');

undefine name
clear col
set verify on
