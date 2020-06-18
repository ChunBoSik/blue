/* 대분류 */
create table goods1 (
  product1 varchar(50) not null primary key
);
insert into goods1 values ('전자제품');
insert into goods1 values ('신발류');
insert into goods1 values ('의류');
select * from goods1;

/* 중분류 */
create table goods2 (
  product1 varchar(50) not null, /* 대분류명 */
  product2 varchar(50) not null primary key,
  foreign key(product1) references goods1(product1)
  on update cascade
  on delete restrict
);
drop table goods2;
insert into goods2 values ('전자제품','LG');
insert into goods2 values ('전자제품','삼성');
insert into goods2 values ('전자제품','현대');
insert into goods2 values ('신발류','나이키');
insert into goods2 values ('신발류','아디다스');
insert into goods2 values ('신발류','블랙야크');
insert into goods2 values ('의류','크로커다일');
insert into goods2 values ('의류','노스페이스');
insert into goods2 values ('의류','K2');
select * from goods2;

/* 소분류 */
create table goods3 (
  product1 varchar(50) not null,  /* 대분류 */
  product2 varchar(50) not null,  /* 중분류 */
  product3 varchar(50) not null,
  foreign key(product1) references goods1(product1)
  on update cascade
  on delete restrict,
  foreign key(product2) references goods2(product2)
  on update cascade
  on delete restrict
);

insert into goods3 values ('전자제품','삼성','냉장고');
insert into goods3 values ('전자제품','삼성','선풍기');
insert into goods3 values ('전자제품','삼성','세탁기');
insert into goods3 values ('전자제품','삼성','오디오');
insert into goods3 values ('전자제품','LG','냉장고');
insert into goods3 values ('전자제품','LG','오디오');
insert into goods3 values ('전자제품','LG','전자레인지');
insert into goods3 values ('전자제품','LG','TV');
insert into goods3 values ('전자제품','LG','컴퓨터');
insert into goods3 values ('전자제품','LG','프린터');
insert into goods3 values ('전자제품','현대','냉장고');
insert into goods3 values ('전자제품','현대','청소기');
insert into goods3 values ('전자제품','현대','정수기');
insert into goods3 values ('전자제품','현대','드라이기');
insert into goods3 values ('신발류','나이키','등산화');
insert into goods3 values ('신발류','나이키','운동화');
insert into goods3 values ('신발류','나이키','실내화');
insert into goods3 values ('신발류','나이키','조깅화');
insert into goods3 values ('신발류','아디다스','농구화');
insert into goods3 values ('신발류','아디다스','실내화');
insert into goods3 values ('신발류','아디다스','등산화');
insert into goods3 values ('신발류','블랙야크','농구화');
insert into goods3 values ('신발류','블랙야크','등산화');
insert into goods3 values ('신발류','블랙야크','실내화');
insert into goods3 values ('의류','크로커다일','스커트');
insert into goods3 values ('의류','노스페이스','자켓');
insert into goods3 values ('의류','K2','언더웨어');
insert into goods3 values ('의류','노스페이스','패딩');
insert into goods3 values ('의류','노스페이스','원피스');
insert into goods3 values ('의류','크로커다일','바지');
insert into goods3 values ('의류','노스페이스','티셔츠');
insert into goods3 values ('의류','크로커다일','블라우스');

select * from goods3;