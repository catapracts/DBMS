select * from employee;

select eno, ename, job
from employee;

select eno, ename, salary, ename, ename, salary*12
from employee;

select eno as 사원번호, ename 사원명, salary as 월급, salary*12 as 연봉
from employee;

select *
from employee;

select eno 사원번호, ename 사원이름, job 직책, manager 직속상관, hiredate 입사날짜, salary 월급, commission 보너스,
dno 부서번호
from employee;

desc employee;

select * from employee;

-- 연봉계산
select eno 사원번호, ename 사원명, salary 월급, commission 보너스 -- 원본테이블 출력
from employee;

-- 연봉 = 월급*12 + 보너스
select eno 사원번호, ename 사원명, salary 월급, commission 보너스, salary*12+commission
from employee;

select eno 사원번호, ename 사원명, salary 월급, commission 보너스, 
salary*12+nvl(commission,0) 연봉
from employee;

select * from employee;
desc employee;

select ename salary, salary+salary as "+연산", salary*salary as "*연산", salary*0.1 as "월급의 10%"
from employee;

select * from employee;

select distinct dno from employee;

select job from employee;

select distinct job from employee;

select ename 사원명, job 직책 from employee where job = 'MANAGER';

select*from department;

select dno 부서번호, dname 부서명, loc 부서위치 from department;

select * from salgrade;

select grade 연봉등급, losal 제일낮은연봉, hisal 제일높은연봉 from salgrade;

select * from employee;

select * from employee where salary>1500;

select * from employee where salary=1500;

select * from employee where salary<>1500;

select * from employee where salary = 1500 or salary = 800 or salary = 1600;

select * from employee where salary in(1500, 800, 1600);

select * from employee where salary>1500;

select eno 사원번호, ename 사원명, salary 월급, job 직책 from employee where job='MANAGER' and salary>2000;

select * from employee where hiredate > '81/01/01' and hiredate < '81/12/31';

select * from employee where ename < 'D';

select * from employee where ename like '%LA%';

select * from employee where ename like '%_CO%';

select * from employee where commission is null;

select * from employee where commission is not null;

select count(*) from employee;

select count(commission) from employee;

select commission from employee;

select * from employee order by salary;

select * from employee order by salary desc;

select * from employee order by ename;

select * from employee order by job desc;

select * from employee where salary>1500 order by salary desc;


