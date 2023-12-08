/*
1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
*/

select * from employee;

-- 1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
select ename ����̸�, salary �޿�, salary+300 �λ�ȱ޿� from employee;


-- 2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�.
select ename ����̸�, salary �޿�, (salary*12)+100 �����Ѽ��� from employee order by salary desc;


-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
select ename ����̸�, salary �޿� from employee where salary>2000 order by salary desc;


-- 4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
select eno �����ȣ, ename ����̸�, dno �μ���ȣ from employee where eno=7788;


-- 5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���.
select ename ����̸�, salary �޿� from employee where salary<2000 or salary>3000;


-- 6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
select ename ����̸�, job ������, hiredate �Ի��� from employee where hiredate > '81.02.20' and hiredate < '81.05.01';


-- 7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
select ename ����̸�, dno �μ���ȣ from employee where dno=20 or dno=30 order by ename asc;


-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
select ename ����̸�, salary �޿�, dno �μ���ȣ from employee where dno=20 or dno=30 and salary>2000 and salary<3000 order by ename desc;


-- 9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
select ename ����̸�, hiredate �Ի��� from employee where hiredate like '81%';
select ename ����̸�, hiredate �Ի��� from employee where hiredate like '81_%';


-- 10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
select ename ����̸�, job ������ from employee where job!='MANAGER';


-- 11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename ����̸�, salary �޿�, commission Ŀ�̼� from employee
where commission is not null order by salary desc;

select ename ����̸�, salary �޿�, commission Ŀ�̼� from employee
where commission is not null order by commission desc;


-- 12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
select ename ����̸�, instr(ename, 'R') from employee where instr(ename, 'R') = 3;


-- 13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename ����̸�, instr(ename, 'A') from employee where instr(ename, 'A')>0 and instr(ename, 'E')>0;


-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.

-- CLERK, SALESMAN�� ��µ�
select ename ����̸�, job ������, salary �޿� from employee where job='CLERK' or job = 'SALESMAN';

-- 1600, 950, 1300 �� ����
select ename ����̸�, job ������, salary �޿� from employee where salary != 1600 and salary != 950 and salary != 1300;

-- ������µǴµ� 1300�� ���ڱ� ����, ����? 
select ename ����̸�, job ������, salary �޿� from employee where job='CLERK' or job = 'SALESMAN'and salary != 1600 and salary != 950 and salary != 1300;

-- ������µȴ�.
select ename ����̸�, job ������, salary �޿� from employee where salary != 1600 and salary != 950 and salary != 1300 and job='CLERK' or job = 'SALESMAN';


-- 15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.  
select ename ����̸�, salary �޿�, commission Ŀ�̼� from employee where commission>500;
