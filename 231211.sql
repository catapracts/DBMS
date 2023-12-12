-- dno = foreign key
-- employee와 department는 하나의 테이블인데, 모델링(제1,2정규화 등)을 통해 나눈 것
select * from employee; -- dno는 department에 있음
select * from department; -- dno column을 employee가 참조한것

create table emp01 as select * from employee;
create table dept01 as select * from department;

select * from user_constraints;
select * from user_constraints where table_name in('EMPLOYEE','DEPARTMENT');
select * from user_constraints where table_name in('emp01','dept01');

alter table dept01 add constraint PK_DEPT01_DNO primary key (dno);
alter table emp01 add constraint PK_EMP01_ENO primary key (eno);
alter table emp01 add constraint FK_EMP01_DNO foreign key (dno) references dept01(dno);
desc emp01; select * from emp01;

--insert into emp01(eno, ename, job, manager, hiredate, salary, commission, dno)
--values(7934, 'aaa','CLERK', 'MANAGER', '23/12/11', 1500, NULL, 50);

commit;

desc dept01;
-- insert into dept01(dno, dname, loc) values(40,'HR','SEOUL');
insert into dept01(dno, dname, loc) values(50,'HR','SEOUL');
commit;

select * from dept01; select * from emp01;

-- from emp01 e, dept01 d = alias 시킴
-- where e.dno=d.dno = 두 table의 공통  key column
select eno, ename, job, d.dno, dname, loc from emp01 e, dept01 d where e.dno=d.dno;
select eno, ename, job, d.dno, dname, loc from emp01 e, dept01 d where e.dno=d.dno and d.dno = 10;
select eno, ename, job, d.dno, dname, loc from emp01 e inner join dept01 d on e.dno=d.dno;
select eno, ename, job, d.dno, dname, loc from emp01 e join dept01 d on e.dno=d.dno;
select eno, ename, job, d.dno, dname, loc from emp01 e join dept01 d on e.dno=d.dno order by ename desc;
select * from emp01 e join dept01 d on e.dno=d.dno;

select * from dept01;
insert into dept01(dno, dname, loc) values(60,'MANGE','BUSAN');
commit;
select * from dept01;

select * from emp01 e right outer join dept01 d on e.dno=d.dno;
select * from emp01 e full outer join dept01 d on e.dno=d.dno;

select ename, e.ename, e.manager, m.eno, m.ename from emp01 e join emp01 m on e.manager = m.eno;
select eno, ename, manager, eno, ename from employee;

select * from emp01; select * from dept01;

select * from emp01 e join dept01 d on e.dno=d.dno where ename = 'SCOTT';
select ename, salary, dname, loc from emp01 e join dept01 d on e.dno=d.dno where salary>=2000 order by d.dno desc;

select e.eno, e.ename, e.manager, m.eno, m.ename from emp01 e left outer join emp01 m on e.manager = m.eno;
select e.eno, e.ename, e.manager, m.eno, m.ename from emp01 e right outer join emp01 m on e.manager = m.eno;
select e.eno, e.ename, e.manager, m.eno, m.ename from emp01 e full outer join emp01 m on e.manager = m.eno;

select ename, e.dno, dname, loc from emp01 e join dept01 d on e.dno=d.dno where job = 'MANAGER';

