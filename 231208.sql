desc employee;

select sum(salary) from employee;
-- select sum(salary), ename from employee; = 오류 발생, 단일 행으로 끝남
select avg(salary) from employee;
select round(avg(salary),2) from employee;
select sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) 레코드개수 from employee;

-- NULL은 자동으로 처리 안 한다.
select commission from employee;
select sum(commission), round(avg(commission),2), max(commission), min(commission), count(*) 레코드개수 from employee;

-- dno의 동일한 값을 그룹화해서 집계함수 적용, 그룹화시킨 속성은 같이 사용 가능
select salary, dno from employee order by dno asc;
select dno, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) 레코드개수 from employee group by dno;


-- 직책별 월급 합계, 평균, 최대값, 최소값 그룹된 함수 출력
select ename, salary, job from employee order by job asc;
select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) 레코드개수 from employee group by job;

-- 직급별 월급의 합계, 평균, 최대값, 최소값, 그룹원의 수 출력하고 부서번호 20을 제외하고, 부서별로 평균이 2000이상인 내용만 출력, 평균을 desc로 출력
select * from employee order by dno asc;
select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) 그룹원수 
from employee where dno!=20 group by job 
having round(avg(salary),2)>2000 
order by round(avg(salary),2) desc;
--select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) 그룹원수 
--from employee where dno!= 20 and round(avg(salary),2)>2000 order by round(avg(salary),2) desc
--group by job;

-- groupby절에서 컬럼이 2개 이상, 2개 걸쳐서 동일 내용 그룹핑
select job, dno from employee order by job asc;
select dno, job, sum(salary), count(*) from employee group by job, dno;

-- 각 직책에 대해 월급의 합, 평균, 최대, 최소, 그룹원수 출력 + 입사년도 81년만 출력 + 월급평균 1500이상 출력 내림차순
select hiredate, job from employee order by hiredate asc;
select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*)
from employee 
where hiredate like '81%' 
group by job
having round(avg(salary),2)>=1500 
order by round(avg(salary),2) desc;

-- rollup, cube 안 쓴경우 = 그룹핑된 것만 출력
select dno, job, count(*), sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
group by dno, job
order by count(*) desc;

select dno, job from employee order by dno asc;

-- rollup = 그룹핑된 것 + 전체내용 출력
select dno, job, count(*), sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
group by rollup(dno, job)
order by count(*) desc;


-- cube = 그룹핑된 것 + 전체내용 + 세부사항 출력
select dno, job, count(*), sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
group by cube(dno, job)
order by count(*) desc;

-- sub query : 여러번 작업한 걸 한 구문에서 처리, where절에서 많이 사용
select job, ename from employee where ename = 'SCOTT';
select job, ename from employee where job = 'ANALYST';
select ename, job from employee where job = (select job from employee where ename = 'ALLEN');

select job from employee where ename = 'SCOTT';
select job from employee where ename = 'ALLEN';
select ename, job from employee where job not in('ANALYST','SALESMAN');
select ename, job from employee where job not in((select job from employee where ename = 'ALLEN'),'SALESMAN');
select ename, job from employee where job not in
((select job from employee where ename = 'ALLEN'),(select job from employee where ename = 'SCOTT'));
select ename, job from employee where job not in
(select job from employee where ename = 'ALLEN'or ename = 'SCOTT');
select ename, job from employee where job not in
(select job from employee where ename in('ALLEN','SCOTT'));

-- scott보다 많은 월급 받는 사원들 정보, 월급 출력 / 닫힌값 : =, 여러 개의 값 : in

select ename 사원, salary 월급 from employee
where salary>(select salary from employee where ename = 'SCOTT');

-- 최소 급여를 받는 사원들의 이름, 담당업무, 급여 출력
select*from employee order by salary desc;

select ename, job, salary from employee where salary = (select min(salary) from employee);

-- subquery사용 / dno로 최소급여 받는 사원 이름, 직책, 월급 출력 / group by, dno, min, in
--select ename, job, salary, dno from employee
--where dno in(select salary from employee where salary = (select min(salary) from employee));
select salary, dno, ename
from employee
order by dno asc, salary desc;

select salary, dno, ename
from employee
where salary in(
 select min(salary) from employee group by dno
);

-- 각 부서의 최소 급여가 30번 부서의 최소급여보다 큰 부서를 출력 / 이름, 직책, 월급, 부서번호
--select dno, salary
--from employee
--where salary in(
-- select min(salary) from employee where dno in (select dno from employee where dno = 30)
--);

select dno, count(*), min(salary) from employee group by dno -- 부서별 최소 월급
having min(salary) > ( 
select min(salary) from employee where dno=30 -- subquery
);
