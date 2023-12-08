/*
<����1>  commission(���ʽ�) �÷��� null �� ���� ����ϵ� �����ȣ, ����̸�,�Ի糯¥�� ��� 
<����2> dno(�μ���ȣ) �� 20�̰� �Ի糯¥�� 81�� 4�� ���� ����� �̸��� ��å�� �Ի糯¥�� ���
<����3> ������ ����ؼ� �����ȣ, ����̸�, ����, ���ʽ�, ��ü ������ ���
<����4> commission�� null �� �ƴ� ������� �̸��� ��� 
<����5> manager (���޻��) 7698 �� ����̸��� ��å�� ���.
<����6> ������ 1500 �̻��̰� �μ��� 20�� ����� ����̸��� �Ի糯¥, �μ���ȣ, ������ ���
<����7> �Ի糯¥�� 81�� 4�� 1�� �̻��̰� 81�� 12�� ���ϱ����� ��� �̸��� �Ի糯¥�� ���
<����8> ��å(job) salesman �̸鼭 ������ 1500 �̻��̸鼭 �μ���ȣ�� 30�� ������� ���
<����9> ������ 1500 �����̸鼭 �μ���ȣ�� 20�� �� �ƴ� ����̸���, ���ް�, �μ���ȣ�� ���
<����10> �����ȣ(eno) �� 7788, 7782 �� �μ���ȣ�� �̸��� ��å�� ��� 
<����11> ������ [SALESMAN]�� �ƴ� ����� �����ȣ,����̸�,����,�޿� �˻�
<����12> �޿��� [2000]�̻��� ����� �����ȣ,����̸�,����,�޿� �˻�
<����13> ����̸��� [A],[B],[C]�� ���۵Ǵ� ����� �����ȣ,����̸�,����,�޿� �˻�
<����14> [1981�� 5�� 1��]������ �Ի��� ����� �����ȣ,����̸�,����,�޿�,�Ի��� �˻�
<����15> ������ [SALESMAN]�� ��� �� �޿��� [1500]�̻��� ����� �����ȣ,����̸�,����,�޿� �˻�
<����16> �μ���ȣ�� [10]�̰ų� ������ [MANAGER]�� ����� �����ȣ,����̸�,����,�޿�,�μ���ȣ �˻�
<����17> �޿��� [1000~3000]�� ����� �����ȣ,����̸�,����,�޿� �˻�
*/

select eno �����ȣ, ename �����, hiredate �Ի糯¥ from employee where commission is null;

select ename �����, hiredate �Ի糯¥, job ��å from employee where hiredate > '81/04/01' and dno=20;

select eno �����ȣ, ename �����, salary ����, commission ���ʽ�, salary*12+nvl(commission,0) ����
from employee;

select * from employee where commission is not null;

select ename �����, job ��å from employee where job = 'MANAGER';

select ename �����, hiredate �Ի糯¥, dno �μ���ȣ, salary ���� from employee where salary>1500 and dno=20;

select ename �����, hiredate �Ի糯¥ from employee where hiredate > '81/01/01' and hiredate < '81/12/31';

select ename ����� from employee where salary>1500 and dno=30 and job = 'SALESMAN';

select ename �����, salary ����, dno �μ���ȣ from employee where salary<1500 and dno!=20;

select dno �μ���ȣ, ename �����, job ��å from employee where eno=7788 and eno=7782;

select eno �����ȣ, ename �����, salary ����, job ��å from employee where job != 'SALESMAN';

select eno �����ȣ, ename �����, job ��å, salary ���� from employee where salary>2000;

select eno �����ȣ, ename �����, job ��å, salary ���� from employee where ename < 'D';

select eno �����ȣ, ename �����, salary ����, job ��å, hiredate �Ի糯¥ from employee where hiredate < '81/05/01';

select eno �����ȣ, ename �����, job ��å, salary ���� from employee where salary>1500 and job = 'SALESMAN';

select eno �����ȣ, ename �����, job ��å, salary ����,dno �μ���ȣ from employee where dno=10 or job = 'MANAGER';

select eno �����ȣ, ename �����, job ��å, salary ���� from employee where salary>1000 and salary<3000;



