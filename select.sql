select * from employee;

select eno, ename, job
from employee;

select eno, ename, salary, ename, ename, salary*12
from employee;

select eno as �����ȣ, ename �����, salary as ����, salary*12 as ����
from employee;

select *
from employee;

select eno �����ȣ, ename ����̸�, job ��å, manager ���ӻ��, hiredate �Ի糯¥, salary ����, commission ���ʽ�,
dno �μ���ȣ
from employee;

desc employee;

select * from employee;

-- �������
select eno �����ȣ, ename �����, salary ����, commission ���ʽ� -- �������̺� ���
from employee;

-- ���� = ����*12 + ���ʽ�
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�, salary*12+commission
from employee;

select eno �����ȣ, ename �����, salary ����, commission ���ʽ�, 
salary*12+nvl(commission,0) ����
from employee;

select * from employee;
desc employee;

select ename salary, salary+salary as "+����", salary*salary as "*����", salary*0.1 as "������ 10%"
from employee;

select * from employee;

select distinct dno from employee;

select job from employee;

select distinct job from employee;

select ename �����, job ��å from employee where job = 'MANAGER';

select*from department;

select dno �μ���ȣ, dname �μ���, loc �μ���ġ from department;

select * from salgrade;

select grade �������, losal ���ϳ�������, hisal ���ϳ������� from salgrade;

select * from employee;

select * from employee where salary>1500;

select * from employee where salary=1500;

select * from employee where salary<>1500;

select * from employee where salary = 1500 or salary = 800 or salary = 1600;

select * from employee where salary in(1500, 800, 1600);

select * from employee where salary>1500;

select eno �����ȣ, ename �����, salary ����, job ��å from employee where job='MANAGER' and salary>2000;

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

select dno ,ename from employee order by dno asc, ename desc;

select dno ,ename from employee order by dno asc, ename asc;

select job, dno ,ename from employee order by job asc, dno asc, ename asc;
