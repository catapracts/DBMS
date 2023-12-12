--모든 평균은 소숫점 2자리까지 출력하되 반올림 해서 출력 하시오.  
--1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 부서번호를 오름차순 정렬 하세요.  
--2.  직책의 SALSMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.   	
--3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오. 
--4. group by - 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요. 
--5. group by - 부서별 월급의 합계가 9000 이상것만 출력
--6. group by - 부서별 월급의 평균이 2000 이상만 출력 하되 부서번호를  오름차순으로 출력
--7. group by - 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라. 
--8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요. 
--9. sub query - 전체 평균 급여보다 많이 받는 사용자의  이름과 급여와 직책과 부서번호를 출력하세요. 
--10. sub query - 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오. 

select * from employee;

--1.  10 번 부서를 제외하고 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오. 부서번호를 오름차순 정렬 하세요.

--select * from employee order by dno asc;
--select dno, salary from employee where dno!=10 order by dno asc;
--select sum(salary), round(avg(salary),2), max(salary), min(salary) from employee where dno!=10;
--select sum(salary), round(avg(salary),2), max(salary), min(salary) from employee group by dno;
--select dno, sum(salary), round(avg(salary),2), max(salary), min(salary) from employee group by dno;
--select dno, sum(salary), round(avg(salary),2), max(salary), min(salary) from employee group by dno order by dno asc;
--select dno, sum(salary), round(avg(salary),2), max(salary), min(salary) from employee where dno!=10 group by dno order by dno asc;
--select dno, salary, sum(salary), round(avg(salary),2), max(salary), min(salary) from employee where dno!=10 group by dno, salary order by dno asc;

select dno, sum(salary), round(avg(salary),2), max(salary) from employee
where dno!=10 -- <>, ^=
group by dno order by dno asc;


--2.  직책의 SALSMAN, PRESIDENT, CLERK 을 제외한 각 부서별 월급의 합계와 평균과 최대값, 최소값을 구하시오.

--select dno, sum(salary), round(avg(salary),2), max(salary), min(salary) 
--from employee 
--where job != 'SALESMAN' and job != 'PRESIDENT' and job != 'CLERK'
--group by dno 
--order by dno asc;

select dno, sum(salary), round(avg(salary),2), max(salary) from employee
where job not in('SALESMAN','PRESIDENT','CLERK') group by dno order by dno asc;


--3. SMITH 과 동일한 부서에 근무하는 사원들 의 월급의 합계와 평균과 최대값, 최소값을 구하시오.

--select * from employee;
--
--select dno, sum(salary), round(avg(salary),2), max(salary), min(salary) 
--from employee 
--where dno = (select dno from employee where ename='SMITH')
--group by dno;

select dno, sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
where dno = (select dno from employee where ename='SMITH')
group by dno;


--4. group by - 부서별 최소월급을 가져오되 최소월급이 1000 이상인 것만 출력하세요.

--select dno, min(salary) from employee 
--group by dno
--having min(salary)>1000;

select dno, min(salary)
from employee
group by dno
having min(salary)>=1000;


--5. group by - 부서별 월급의 합계가 9000 이상것만 출력

--select dno, sum(salary) from employee 
--group by dno
--having sum(salary)>9000;

select dno, sum(salary)
from employee
group by dno
having sum(salary)>=9000;


--6. group by - 부서별 월급의 평균이 2000 이상만 출력 하되 부서번호를  오름차순으로 출력

--select dno, sum(salary) from employee 
--group by dno
--having avg(salary)>=2000
--order by dno asc;

select dno, round(avg(salary),2)
from employee
group by dno
having round(avg(salary),2)>=2000;

--7. group by - 월급이 1500 이하는 제외하고 각 부서별로 월급의 평균을 구하되 월급의 평균이 2500이상인 것만 출력 하라.

select dno, round(avg(salary),2)
from employee where salary>1500
group by dno having round(avg(salary),2)>=2500;


--select * from employee order by dno asc;
--
--select dno, round(avg(salary),2) from employee 
--group by dno
--having round(avg(salary),2)>2500
--order by dno asc;
--
--select dno, round(avg(salary),2) from employee
--group by dno
--having round(avg(salary),2)>2500
--order by dno asc;
--
--select dno, round(avg(salary),2) from employee
--where salary<1500
--group by dno
--order by dno asc;
--
--select dno, salary, round(avg(salary),2) from employee
--group by dno, salary
--having salary>1500
--order by dno asc;
--
--select dno, salary, round(avg(salary),2) from employee
--group by dno, salary
--having salary>1500 and round(avg(salary),2)>2500
--order by dno asc;

--8. sub query - 부서별로 최소 급여를 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요.

select ename, salary, job, dno
from employee where salary in
( select min(salary) from employee group by dno);


--select *from employee;

--select dno, count(*), min(salary) from employee group by dno -- 부서별 최소 월급
--having min(salary) > ( 
--select min(salary) from employee -- subquery
--);
--
--select salary, dno, ename
--from employee
--where salary in(
-- select min(salary) from employee group by dno
--);

--select dno, ename, salary, job, min(salary), count(*)
--from employee group by dno, ename, salary, job
--having min(salary)>(select min(salary) from employee);

--select dno, min(salary), count(*)
--from employee group by dno
--having min(salary)>(select min(salary) from employee);
--
--select dno, min(salary), count(*)
--from employee 
--where select ename from employee
--group by dno
--having min(salary)>(select min(salary) from employee);

--select ename, salary, job, dno
--from employee
--where salary in(
-- select min(salary) from employee group by dno
--);


--9. sub query - 전체 평균 급여보다 많이 받는 사용자의 이름과 급여와 직책과 부서번호를 출력하세요.

select ename, salary, job, dno
from employee
where salary>
( select round(avg(salary),2) from employee);


--select dno, round(avg(salary),2), count(*)
--from employee
--where round(avg(salary),2)<(select salary from employee)
--group by dno;

--select salary, dno, ename
--from employee
--where salary in(
-- select min(salary) from employee group by dno
--);
--
--select ename, salary, job, dno
--from employee
--where salary in(
-- select round(avg(salary),2) from employee group by dno
-- having round(avg(salary),2)<salary
--);


--10. sub query - 급여가 평균 급여보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해 오름차순 정렬하시오.

select ename, salary, job, dno
from employee
where salary>
(select round(avg(salary),2) from employee)
order by salary asc;

--select salary, dno, ename
--from employee
--where salary in(
-- select min(salary) from employee group by dno
--);
--
--select dno, count(*), min(salary) from employee group by dno -- 부서별 최소 월급
--having min(salary) > ( 
--select min(salary) from employee where dno=30 -- subquery
--);
--
--select eno, ename, salary from employee
--where salary in(
-- select min(salary) from employee group by dno
-- having min(salary) > (select salary from employee)
--) order by salary;
