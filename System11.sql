create user "C##HongGilDong" identified by "1234"
default tablespace USERS temporary tablespace TEMP;
grant resource, connect to "C##HongGilDong";
alter user "C##HongGilDong" quota unlimited on USERS;
grant create session to "C##HongGilDong";
grant create table to "C##HongGilDong";
grant create view to "C##HongGilDong";
-- alter user "C##HongGilDong" identified by "1234";
-- ALTER SYSTEM SET SEC_CASE_SENSITIVE_LOGON=FALSE;
select*from DBA_USERS;
select*from ALL_USERS;

drop user "C##HongGilDong";