-- 회원 등급별 마일리지율 정보
create table grade_pt_rade
(
 mem_grade varchar2(20) not null primary key,
 grade_pt_rate number(3,2)
)

-- 오늘의 와인 정보
create table today
(
 today_code varchar2(6) not null primary key,
 today_sens_value number(3),
 today_intell_value number(3),
 today_phy_value number(3)
)

-- 국가
create table nation
(
 nation_code varchar2(26) not null primary key,
 nation_name varchar2(50) not null
)

-- 와인 테마
create table theme
(
 theme_code varchar2(6) not null primary key,
 theme_name varchar2(50) not null
)

-- 관리자 정보
create table manager
(
 manager_id varchar2(30) not null primary key,
 manager_pwd varchar2(20) not null,
 manager_tel varchar2(20)
)

-- 와인 종류
create table wine_type
(
 wine_type_code varchar2(6) not null primary key,
 wine_type_name varchar2(50)
)

-- 회원 정보
create table member
(
 mem_id varchar2(6) not null primary key,
 mem_grade varchar2(20),
  constraint FK_grade_pt_rade_mem_grade foreign key (mem_grade) references grade_pt_rade(mem_grade),
 mem_pw varchar2(20) not null,
 mem_birth date not null, constraint default(sysdate),
 mem_tel varchar2(20),
 mem_pt varchar2(10) not null, constraint default(0)
)

-- 와인 정보
create table wine
(
 wine_code varchar2(26) not null primary key,
 wine_name varchar2(100) not null,
 wine_url blob,
 nation_code varchar2(6),
  constraint FK_nation_nation_code foreign key (nation_code) references nation(nation_code),
 wine_type_code varchar2(6),
  constraint FK_wine_type_wine_type_code foreign key (wine_type_code) references wine_type(wine_type_code),
 wine_sugar_code number(2),
 wine_price number(15) not null, constraint default(0),
 wine_vintage date,
 theme_code varchar2(6),
  constraint FK_theme_theme_code foreign key (theme_code) references theme(theme_code),
 today_code varchar2(6),
  constraint FK_today_today_code foreign key (today_code) references today(today_code)
)

-- 재고 정보
create table stock_management
(
 stock_code varchar2(6) not null primary key,
 wine_code varchar2(6),
  constraint FK_wine_wine_code foreign key (wine_code) references wine(wine_code),
 manager_id varchar2(30),
  constraint FK_manager_manager_id foreign key (manager_id) references manager(manager_id),
 ware_date date not null, constraint default(sysdate),
 stock_amount number(5) not null, constraint default(0)
)

-- 구매 정보
create table sale
(
 sale_date date not null, constraint default(sysdate), primary key,
 wine_code varchar2(6) not null,
  constraint FK_wine_wine_code foreign key (wine_code) references wine(wine_code),
 mem_id varchar2(30) not null,
  constraint FK_member_mem_id foreign key (mem_id) references member(mem_id),
 mem_birth date not null, constraint default(sysdate),
 mem_tel varchar2(20),
 mem_pt varchar2(10) not null, constraint default(0)
)
