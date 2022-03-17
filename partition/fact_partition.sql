select to_char(fact_date,'YYYY') annee, dbms_rowid.rowid_relative_fno(rowid) fno, count(*) nb
from fact partition(fact_old)
group by to_char(fact_date,'YYYY'),dbms_rowid.rowid_relative_fno(rowid)
;