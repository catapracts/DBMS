/*
1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
   ������ ������ ��ġ ��Ű�ÿ�.
7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
10.   �����ȣ,
      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
      �̸�, 
       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"       
11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	dual ���̺� ���
    
12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 
        
13.  employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 
*/

select*from employee;

-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 

select substr(hiredate,1,2) �Ի��, substr(hiredate,4,2) �Ի�� from employee;

-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
select * from tab;
select ename ����̸�, substr(hiredate,4,2) �Ի�� from employee where substr(hiredate,4,2) = 04;

-- 3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�.

--select ename ����̸�, mod

select ename, manager from employee where MOD (manager , 2) = 1; 

-- 4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.

select ename ����̸�, salary ���� from employee where mod(salary,3) = 0;

-- 5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�.

--select hiredate �Ի���, to_date(hiredate, 'YY-MON-DY') from employee;

select hiredate , to_char ( hiredate, 'YY MON DD DY') as ��°�� from employee; 

-- 6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
--   ������ ������ ��ġ ��Ű�ÿ�.

select sysdate, to_date('2023-01-01','YY-MM-DD'),
sysdate - to_date('2023-01-01','YY-MM-DD')
from dual;

-- 7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 

select sysdate, to_date('1994-09-13','YY-MM-DD'),
sysdate - to_date('1994-09-13','YY-MM-DD')
from dual;

-- 8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.

select sysdate, Months_between(sysdate, '1994-09-13')
from dual;

-- 9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
-- ����Ŭ�� ���ȣ�� 1�� ����
select ename, manager , nvl (manager, 0), nvl2 (manager, manager,0)from employee; 

-- 10.   �����ȣ,
--      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
--      �̸�, 
--       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"

select rpad(substr(eno,1,2),4,'*') as "������ȣ",
rpad(substr(ename,1,1),4,'*') as "�����̸�"
from employee;

-- 11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	--dual ���̺� ���

select rpad(substr('801210-12345678',1,8),13,'*'),
rpad(substr('010-1234-5678',1,5),13,'*') 
from dual;

-- 12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 

select sysdate, Months_between(sysdate, '1994-09-13'),
sysdate - to_date('1994-09-13','YY-MM-DD')
from dual;
  
-- 13.  employee ���̺��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ���

select hiredate, to_date('2050-12-24','YY-MM-DD') - hiredate from employee;
