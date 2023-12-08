-- dual = �����ϰ� �׽�Ʈ������ ���� ���̺�, ���� �����ϴ� �� �ƴ�
select upper ('Oracle') from dual;
select * from employee;
select ename, upper(ename), rower(rname), intcap(ename) from employee;
-- colum���� ��ҹ��� ����
select*from employee where ename='smith';
select*from employee where ename=upper('smith');

select length('Oracle mania') from dual;
select length('����Ŭ�ŴϾ�') from dual;
select lengthb('Oracle mania') from dual;
select lengthb('����Ŭ�ŴϾ�') from dual;
select ename, length(ename) from employee;
select ename, lengthb(ename) from employee;

select 'Oracle', 'Mania' from dual;
select concat('Oracle', 'Mania') from dual;
select concat(ename, job) from employee;
select ename || job from employee;
select ename || '' || job as �̸�����å from employee;

select substr('OracleMania',4,3) from dual;
select ename �����̸�, substr(ename,2,3) from employee;
select*from employee;
select ename ����̸�, substr(hiredate,4,2) �Ի�� from employee;
select ename ����̸�, substr(hiredate,4,2) �Ի�� from employee where substr(hiredate,4,2)='02';
select ename ����̸�, substr(hiredate,1,2) �Ի��, substr(hiredate,4,2) �Ի��, substr(hiredate,7,5) �Ի��� 
from employee;
select ename ����̸�, substr(hiredate,1,2) �Ի��, substr(hiredate,4,2) �Ի��, substr(hiredate,7,5) �Ի��� 
from employee
where substr(hiredate,1,2)='81' and substr(hiredate,4,2)='02';

-- �˻� �� �Ǹ� 0���� ���
select (instr('Oracle Mania', 'a'))from dual;
select (instr('Oracle Mania', 'a',4))from dual;
select ename �̸�, instr(ename, 'M') as M����ġ from employee;

select '770824-123456' �ֹι�ȣ, LPAD('770824-1',20,'*') as "LPAD" from dual;
select '770824-123456' �ֹι�ȣ, RPAD('770824-1',20,'*') as "LPAD" from dual;
select*from employee;
select ename �̸�, rpad(substr(hiredate,1,2),8,'*') from employee;

select '          OracleMania           ' from dual;
select * from employee where ename = '       SMITH';
select * from employee where ename = RTRIM('       SMITH');
select '          OracleMania           ' as ����, LTRIM('          OracleMania           ') as ���ʰ�������,
RTRIM('          OracleMania           ') as �����ʰ�������, 
TRIM('          OracleMania           ') as ����������
from dual;
select*from employee where ename = upper(trim('       SMITH'))

-- ����ó���Լ� / ���� ����.
select 98.7654 as ����, round(98.7654) as R1, round(98.7654,2) as R2, 
round(98.7654,-2) as R3, round(98.7654,-1) as R4, round(98.7654,-3) as R5
from dual;

select salary ����, salary*0.033 �ҵ漼, round(salary*0.033) R1, round(salary*0.033,2) R2,
round(salary - (salary*0.033),2) as �Ǽ��ɾ� from employee;

select trunc(98.7654)t1, trunc(98.7654,2)t2, trunc(98.7654,-1)t3,
trunc(98.7654,-2)t4 from dual;

select MOD(3, 2) from dual;

select sysdate from dual;
select sysdate ���糯¥, sysdate-1 ������¥, sysdate+1 ������¥ from dual;
select sysdate-100 100������¥ from dual;
select sysdate+100 100���ĳ�¥ from dual;

desc employee;
select ename �̸�, (sysdate-hiredate) ������ϼ� from employee;
select ename �̸�, trunc(sysdate-hiredate) ������ϼ� from employee;
select hiredate ������¥, trunc(hiredate, 'MONTH'), round(hiredate, 'MONTH') from employee;
select ename �̸�, hiredate �Ի���, months_between(sysdate, hiredate) ������ from employee;
select sysdate ���ó�¥, add_months(sysdate, 100) "100������", sysdate+100 "100����" from employee;
select last_day(sysdate) from employee;
select hiredate �Ի���, last_day(hiredate) ��������¥ from employee;

select sysdate from dual;
select TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;
select hiredate �Ի���, TO_CHAR(hiredate, 'YY-MM-DD MON DAY HH:MI:SS')�Ի���2 from employee;
select TO_CHAR(sysdate, 'YYYY-MM-DD MON DAY HH:MI:SS') from dual;
select TO_CHAR(9876, '000.000') from dual;
select TO_CHAR(9876, '999.999') from dual;
select salary "����", to_char(salary, 'L999.999') "����(�ѱ�)" from employee;

select to_date('1998-10-10','YYYY-MM-DD') from dual;
select to_date('1998-01-01','YYYY-MM-DD'), add_months(to_date('1998-01-01','YYYY-MM-DD') ,100) from dual;
select to_date('1998-01-01','YYYY-MM-DD')+100 "100�� �� ��¥", 
add_months(to_date('1998-01-01','YYYY/MM/DD') ,100) "100���� �� ��¥"
from dual;
select to_date(770814,'YYMMDD') from dual;
