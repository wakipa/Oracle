BEGIN
  FOR i IN 1..30000 LOOP
      INSERT INTO stage2(num, nom)
      VALUES(i, 'bonjour');
    END LOOP;
 END;
/