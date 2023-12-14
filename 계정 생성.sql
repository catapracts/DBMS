create user C##HR10 identified by 1234 
default tablespace USERS
temporary tablespace TEMP;

grant resource, connect to C##HR10;
grant create view to C##HR10;

alter user C##HR10 quota unlimited on USERS;