select * from help;

-- 1�� �ּ� /**/ N�� �ּ�

create user C##HR1 identified by 1234
default tablespace USERS
temporary tablespace TEMP;

grant resource, connect to C##HR1;

alter user C##HR1 quota unlimited on USERS;

drop user C##HR cascade
