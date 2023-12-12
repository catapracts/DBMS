desc employee;

select sum(salary) from employee;
-- select sum(salary), ename from employee; = ���� �߻�, ���� ������ ����
select avg(salary) from employee;
select round(avg(salary),2) from employee;
select sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) ���ڵ尳�� from employee;

-- NULL�� �ڵ����� ó�� �� �Ѵ�.
select commission from employee;
select sum(commission), round(avg(commission),2), max(commission), min(commission), count(*) ���ڵ尳�� from employee;

-- dno�� ������ ���� �׷�ȭ�ؼ� �����Լ� ����, �׷�ȭ��Ų �Ӽ��� ���� ��� ����
select salary, dno from employee order by dno asc;
select dno, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) ���ڵ尳�� from employee group by dno;


-- ��å�� ���� �հ�, ���, �ִ밪, �ּҰ� �׷�� �Լ� ���
select ename, salary, job from employee order by job asc;
select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) ���ڵ尳�� from employee group by job;

-- ���޺� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷���� �� ����ϰ� �μ���ȣ 20�� �����ϰ�, �μ����� ����� 2000�̻��� ���븸 ���, ����� desc�� ���
select * from employee order by dno asc;
select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) �׷���� 
from employee where dno!=20 group by job 
having round(avg(salary),2)>2000 
order by round(avg(salary),2) desc;
--select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*) �׷���� 
--from employee where dno!= 20 and round(avg(salary),2)>2000 order by round(avg(salary),2) desc
--group by job;

-- groupby������ �÷��� 2�� �̻�, 2�� ���ļ� ���� ���� �׷���
select job, dno from employee order by job asc;
select dno, job, sum(salary), count(*) from employee group by job, dno;

-- �� ��å�� ���� ������ ��, ���, �ִ�, �ּ�, �׷���� ��� + �Ի�⵵ 81�⸸ ��� + ������� 1500�̻� ��� ��������
select hiredate, job from employee order by hiredate asc;
select job, sum(salary), round(avg(salary),2), max(salary), min(salary), count(*)
from employee 
where hiredate like '81%' 
group by job
having round(avg(salary),2)>=1500 
order by round(avg(salary),2) desc;

-- rollup, cube �� ����� = �׷��ε� �͸� ���
select dno, job, count(*), sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
group by dno, job
order by count(*) desc;

select dno, job from employee order by dno asc;

-- rollup = �׷��ε� �� + ��ü���� ���
select dno, job, count(*), sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
group by rollup(dno, job)
order by count(*) desc;


-- cube = �׷��ε� �� + ��ü���� + ���λ��� ���
select dno, job, count(*), sum(salary), round(avg(salary),2), max(salary), min(salary)
from employee
group by cube(dno, job)
order by count(*) desc;

-- sub query : ������ �۾��� �� �� �������� ó��, where������ ���� ���
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

-- scott���� ���� ���� �޴� ����� ����, ���� ��� / ������ : =, ���� ���� �� : in

select ename ���, salary ���� from employee
where salary>(select salary from employee where ename = 'SCOTT');

-- �ּ� �޿��� �޴� ������� �̸�, ������, �޿� ���
select*from employee order by salary desc;

select ename, job, salary from employee where salary = (select min(salary) from employee);

-- subquery��� / dno�� �ּұ޿� �޴� ��� �̸�, ��å, ���� ��� / group by, dno, min, in
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

-- �� �μ��� �ּ� �޿��� 30�� �μ��� �ּұ޿����� ū �μ��� ��� / �̸�, ��å, ����, �μ���ȣ
--select dno, salary
--from employee
--where salary in(
-- select min(salary) from employee where dno in (select dno from employee where dno = 30)
--);

select dno, count(*), min(salary) from employee group by dno -- �μ��� �ּ� ����
having min(salary) > ( 
select min(salary) from employee where dno=30 -- subquery
);
