DECLARE

 v_nom varchar2(20) := to_char( sysdate, 'HH24:MI:SS');

BEGIN

  FOR i in 1..100 LOOP
    FOR j in 1..100 LOOP
       
       INSERT INTO stage(num , nom )
                  VALUES(i , v_nom )
       ;

    END LOOP;
  END LOOP; 

END;
/