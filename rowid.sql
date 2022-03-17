select 	rowid
	,ename
	,dbms_rowid.rowid_block_number(rowid) no_bloc
	,dbms_rowid.rowid_object(rowid) no_objet
	,dbms_rowid.rowid_row_number(rowid) no_ligne
	,dbms_rowid.rowid_relative_fno(rowid) no_fichier
 from emp;