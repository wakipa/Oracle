BEGIN
  FOR i IN 1..1000 LOOP
      INSERT INTO fact
      VALUES(i,'facture n° '||to_char(i),1000.50+i,to_date('01-01-2010','DD-MM-YYYY')+i);
    END LOOP;
END;
/