SELECT
      owner,
      object_name,
      object_type,
      session_id,
      username,
      v$lock.TYPE,        -- Type or system/user lock
      lmode,       -- lock mode in which session holds lock
      request,
      block,
      ctime        -- Time since current mode was granted
FROM
     v$locked_object, all_objects, v$lock, v$session
WHERE
    v$locked_object.object_id = all_objects.object_id AND
    v$lock.id1 = all_objects.object_id AND
    v$lock.sid = v$locked_object.session_id and
    v$lock.sid = v$session.sid
ORDER BY
    session_id, ctime DESC, object_name;