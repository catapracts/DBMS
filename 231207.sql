-- dual = 간단하게 테스트용으로 만든 테이블, 원래 존재하는 건 아님
select upper ('Oracle') from dual;
select * from employee;
select ename, upper(ename), rower(rname), intcap(ename) from employee;
-- colum값은 대소문자 구분
select*from employee where ename='smith';
select*from employee where ename=upper('smith');

select length('Oracle mania') from dual;
select length('오라클매니아') from dual;
select lengthb('Oracle mania') from dual;
select lengthb('오라클매니아') from dual;
select ename, length(ename) from employee;
select ename, lengthb(ename) from employee;

select 'Oracle', 'Mania' from dual;
select concat('Oracle', 'Mania') from dual;
select concat(ename, job) from employee;
select ename || job from employee;
select ename || '' || job as 이름과직책 from employee;

select substr('OracleMania',4,3) from dual;
select ename 원본이름, substr(ename,2,3) from employee;
select*from employee;
select ename 사원이름, substr(hiredate,4,2) 입사월 from employee;
select ename 사원이름, substr(hiredate,4,2) 입사월 from employee where substr(hiredate,4,2)='02';
select ename 사원이름, substr(hiredate,1,2) 입사년, substr(hiredate,4,2) 입사월, substr(hiredate,7,5) 입사일 
from employee;
select ename 사원이름, substr(hiredate,1,2) 입사년, substr(hiredate,4,2) 입사월, substr(hiredate,7,5) 입사일 
from employee
where substr(hiredate,1,2)='81' and substr(hiredate,4,2)='02';

-- 검색 안 되면 0으로 출력
select (instr('Oracle Mania', 'a'))from dual;
select (instr('Oracle Mania', 'a',4))from dual;
select ename 이름, instr(ename, 'M') as M의위치 from employee;

select '770824-123456' 주민번호, LPAD('770824-1',20,'*') as "LPAD" from dual;
select '770824-123456' 주민번호, RPAD('770824-1',20,'*') as "LPAD" from dual;
select*from employee;
select ename 이름, rpad(substr(hiredate,1,2),8,'*') from employee;

select '          OracleMania           ' from dual;
select * from employee where ename = '       SMITH';
select * from employee where ename = RTRIM('       SMITH');
select '          OracleMania           ' as 원본, LTRIM('          OracleMania           ') as 왼쪽공백제거,
RTRIM('          OracleMania           ') as 오른쪽공백제거, 
TRIM('          OracleMania           ') as 모든공백제거
from dual;
select*from employee where ename = upper(trim('       SMITH'))

-- 숫자처리함수 / 많이 쓴다.
select 98.7654 as 원본, round(98.7654) as R1, round(98.7654,2) as R2, 
round(98.7654,-2) as R3, round(98.7654,-1) as R4, round(98.7654,-3) as R5
from dual;

select salary 월급, salary*0.033 소득세, round(salary*0.033) R1, round(salary*0.033,2) R2,
round(salary - (salary*0.033),2) as 실수령액 from employee;

select trunc(98.7654)t1, trunc(98.7654,2)t2, trunc(98.7654,-1)t3,
trunc(98.7654,-2)t4 from dual;

select MOD(3, 2) from dual;

select sysdate from dual;
select sysdate 현재날짜, sysdate-1 어제날짜, sysdate+1 다음날짜 from dual;
select sysdate-100 100일전날짜 from dual;
select sysdate+100 100일후날짜 from dual;

desc employee;
select ename 이름, (sysdate-hiredate) 총출근일수 from employee;
select ename 이름, trunc(sysdate-hiredate) 총출근일수 from employee;
select hiredate 원본날짜, trunc(hiredate, 'MONTH'), round(hiredate, 'MONTH') from employee;
select ename 이름, hiredate 입사일, months_between(sysdate, hiredate) 개월수 from employee;
select sysdate 오늘날짜, add_months(sysdate, 100) "100개월후", sysdate+100 "100일후" from employee;
select last_day(sysdate) from employee;
select hiredate 입사일, last_day(hiredate) 마지막날짜 from employee;

select sysdate from dual;
select TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;
select hiredate 입사일, TO_CHAR(hiredate, 'YY-MM-DD MON DAY HH:MI:SS')입사일2 from employee;
select TO_CHAR(sysdate, 'YYYY-MM-DD MON DAY HH:MI:SS') from dual;
select TO_CHAR(9876, '000.000') from dual;
select TO_CHAR(9876, '999.999') from dual;
select salary "월급", to_char(salary, 'L999.999') "월급(한국)" from employee;

select to_date('1998-10-10','YYYY-MM-DD') from dual;
select to_date('1998-01-01','YYYY-MM-DD'), add_months(to_date('1998-01-01','YYYY-MM-DD') ,100) from dual;
select to_date('1998-01-01','YYYY-MM-DD')+100 "100일 후 날짜", 
add_months(to_date('1998-01-01','YYYY/MM/DD') ,100) "100개월 후 날짜"
from dual;
select to_date(770814,'YYMMDD') from dual;
