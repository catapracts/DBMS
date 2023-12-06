create Table member
(
 idx number not null,
 name varchar2(50) not null,
 id varchar2(50) not null,
 pw varchar2(50) not null,
 addr varchar2(50) null
);
 
 select * from member;
 
 insert into member (idx, name, id, pw, addr)
 values (1,'aaa','aa','1234','addr');
 
 insert into member (idx, name, id, pw, addr)
 values (2,'bbb','bb','5678','addr1');
 
 insert into member (idx, name, id, pw, addr)
 values (3,'ccc','cc','9012','addr2');
 
 commit