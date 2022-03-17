begin
for i in 1..5 loop
for j in 1..5 loop
insert into trop select * from emp;
end loop;
commit;
end loop;
end;
/
