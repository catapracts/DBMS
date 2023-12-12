--��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.  
--1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. �μ���ȣ�� �������� ���� �ϼ���.  
--2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.   	
--3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
--4. group by - �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 
--5. group by - �μ��� ������ �հ谡 9000 �̻�͸� ���
--6. group by - �μ��� ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ��  ������������ ���
--7. group by - ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 
--8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 
--9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 
--10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�. 

select * from employee;

--1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. �μ���ȣ�� �������� ���� �ϼ���.

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


--2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.

--select dno, sum(salary), round(avg(salary),2), max(salary), min(salary) 
--from employee 
--where job != 'SALESMAN' and job != 'PRESIDENT' and job != 'CLERK'
--group by dno 
--order by dno asc;

select dno, sum(salary), round(avg(salary),2), max(salary) from employee
where job not in('SALESMAN','PRESIDENT','CLERK') group by dno order by dno asc;


--3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.

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


--4. group by - �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���.

--select dno, min(salary) from employee 
--group by dno
--having min(salary)>1000;

select dno, min(salary)
from employee
group by dno
having min(salary)>=1000;


--5. group by - �μ��� ������ �հ谡 9000 �̻�͸� ���

--select dno, sum(salary) from employee 
--group by dno
--having sum(salary)>9000;

select dno, sum(salary)
from employee
group by dno
having sum(salary)>=9000;


--6. group by - �μ��� ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ��  ������������ ���

--select dno, sum(salary) from employee 
--group by dno
--having avg(salary)>=2000
--order by dno asc;

select dno, round(avg(salary),2)
from employee
group by dno
having round(avg(salary),2)>=2000;

--7. group by - ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�.

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

--8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���.

select ename, salary, job, dno
from employee where salary in
( select min(salary) from employee group by dno);


--select *from employee;

--select dno, count(*), min(salary) from employee group by dno -- �μ��� �ּ� ����
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


--9. sub query - ��ü ��� �޿����� ���� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���.

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


--10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�.

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
--select dno, count(*), min(salary) from employee group by dno -- �μ��� �ּ� ����
--having min(salary) > ( 
--select min(salary) from employee where dno=30 -- subquery
--);
--
--select eno, ename, salary from employee
--where salary in(
-- select min(salary) from employee group by dno
-- having min(salary) > (select salary from employee)
--) order by salary;
