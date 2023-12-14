create table EMP03 as select eno as no, ename as name, salary as account
from employee;

select * from EMP03;

create table account10 as select eno as no, ename as name, salary as account
from employee;

select * from account10;

begin transaction; 
    update account10 set account = account -10 where no = 7369;
    update account10 set account = account +10 where no = 7934;

select * from C##HR1 account10;
    



