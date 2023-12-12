create table zipcode10(
zipcode number(6) not null constraint PK_ZIPCODE10_ZIPCODE primary key,
si_do varchar2(200) not null,
gu_gun varchar2(200) not null,
bungi varchar2(200) not null
)

-- user info.
create table member10(
m_id number(6) not null constraint PK_NUMBER10_M_ID primary key,
pass varchar2(200) not null,
name varchar2(200) not null,
email varchar2(200) not null,
zipcode number(6) null, constraint FK_MEMBER10_ZIPCODE foreign key(zipcode) references ZIPCODE10(zipcode) 
)


create table product10(
pro_id number(6) not null constraint PK_PRODUCT10_PRO_ID primary key,
pro_name varchar2(200) not null,
pro_price number(7,2) not null,
pro_cnt number(4) default 0 not null
)


create table order10(
ord_id number(6) not null constraint PK_ORDER10_ORD_ID primary key,
m_id number(4) not null,
pro_id number(4) not null,
constraint FK_ORDER10_M_ID foreign key(m_id) references member10(m_id),
constraint FK_PRODUCT10_PRO_ID foreign key(pro_id) references product10(pro_id)
)

-- 각 테이블에 레코드 5개씩 넣기
insert into zipcode10(zipcode, si_do, gu_gun, bungi) values(0,'A','aa','AAA');
insert into zipcode10(zipcode, si_do, gu_gun, bungi) values(1,'B','bb','BBB');
insert into zipcode10(zipcode, si_do, gu_gun, bungi) values(2,'C','cc','CCC');
insert into zipcode10(zipcode, si_do, gu_gun, bungi) values(3,'D','dd','DDD');
insert into zipcode10(zipcode, si_do, gu_gun, bungi) values(4,'E','ee','EEE');
commit;
select * from zipcode10;

insert into member10(m_id, pass, name, email, zipcode) values(00,'z','zz','z@z',0);
insert into member10(m_id, pass, name, email, zipcode) values(11,'y','yy','y@y',1);
insert into member10(m_id, pass, name, email, zipcode) values(22,'x','xx','x@x',2);
insert into member10(m_id, pass, name, email, zipcode) values(33,'w','ww','w@w',3);
insert into member10(m_id, pass, name, email, zipcode) values(44,'v','vv','v@v',4);
commit;
select * from member10;

insert into product10(pro_id, pro_name, pro_price, pro_cnt) values(000,'가',5000,50);
insert into product10(pro_id, pro_name, pro_price, pro_cnt) values(111,'나',10000,100);
insert into product10(pro_id, pro_name, pro_price, pro_cnt) values(222,'다',15000,150);
insert into product10(pro_id, pro_name, pro_price, pro_cnt) values(333,'라',20000,200);
insert into product10(pro_id, pro_name, pro_price, pro_cnt) values(444,'마',25000,250);
commit;
select * from product10;

insert into order10(ord_id, m_id, pro_id) values(0,00,000);
insert into order10(ord_id, m_id, pro_id) values(1,33,444);
insert into order10(ord_id, m_id, pro_id) values(2,11,222);
insert into order10(ord_id, m_id, pro_id) values(3,22,111);
insert into order10(ord_id, m_id, pro_id) values(4,44,333);
commit;
select * from order10;

-- ANSI join 이용해서 주문번호 테이블 기준으로 주문자명, 주문자 메일주소, 주문자주소, 주문제품명, 제품가격
select m.name, m.email, m.zipcode, o.pro_id
from member10 m left outer join order10 o on m.m_id=o.m_id;

drop table zipcode10;


