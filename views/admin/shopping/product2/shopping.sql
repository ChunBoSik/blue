/* 상품 테이블 */
/*
CREATE TABLE product (
  idx int NOT NULL AUTO_INCREMENT,        /* 고유번호 */
  title varchar(100) NOT NULL,            /* 상품명 */
  price int NOT NULL,                     /* 상품가격 */
  part varchar(20) NOT NULL,              /* 상품분류 */
  p_option varchar(200) DEFAULT NULL,     /* 상품옵션 */
  subContent text NOT NULL,               /* 초기설명 */
  content text NOT NULL,                  /* 제품상세설명 */
  pdate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, /* 제품등록날짜 */
  fsize int NOT NULL,                     /* 그림크기 */
  fname varchar(100) NOT NULL,             /* 올린그림 이름 */
  rfname varchar(100) NOT NULL,            /* 서버에 저장된 그림 이름 */
  sales int NOT NULL DEFAULT 0,            /* 세일 여부 */
  PRIMARY KEY (idx)
);
drop table product;
select * from product;
*/

/* 대분류 */
create table category(
  catecode char(2)  not null,     /* 대분류 코드 */
  catename varchar(20) not null,  /* 대분류 이름 */
  primary key(catename)           /* 기본키를 대분류이름으로 한다 */
);

insert into category values ('A','전자제품');
insert into category values ('B','의류');
insert into category values ('C','신발류');
insert into category values ('D','기타류');

desc category;
drop table category;
select * from category;

/* 중분류 */
create table division(
  divicode char(2) not null,     /* 중분류 코드 */
  diviname varchar(20) not null, /* 중분류 이름 */
  catename varchar(20) not null, /* 대분류 이름 */
  primary key(diviname),         /* 기본키는 중분류이름이고, 외래키는 '대분류'중 '대분류명'으로 지정 */
  foreign key(catename) references category(catename) on update cascade on delete cascade
);

insert into division values ('01','냉장고','전자제품');
insert into division values ('02','에어컨','전자제품');
insert into division values ('03','세탁기','전자제품');
insert into division values ('01','원피스','의류');
insert into division values ('02','상의','의류');
insert into division values ('03','하의','의류');
insert into division values ('01','운동화','신발류');
insert into division values ('02','등산화','신발류');
insert into division values ('03','구두','신발류');
insert into division values ('01','식품','기타류');
insert into division values ('02','생활','기타류');

select * from division;
select diviname from division where catename='전자제품' order by divicode;
drop table division;
desc division;

/* 소(세)분류(상품명) */
create table section(
  idx int not null auto_increment, /* 고유번호 */
  product varchar(50) not null,    /* 상품명 */
  sectname varchar(50) not null,   /* 상품-제조사 */
  diviname varchar(20) not null,   /* 중분류명 */
  catename varchar(20) not null,   /* 대분류명 */
  fname     varchar(60) not null,  /* 썸네일 업로드시에 파일이름 */
  rfname    varchar(60) not null,  /* 썸네일 서버에 저장되는 실제 파일명 */
  fsize     int not null,          /* 썸네일 파일 크기 */
  content text not null,           /* 상품상세사진-한장으로 길게 처리 */
  mainprice int not null,          /* 상품 기본가격 */
  detail varchar(50) not null,     /* 상품 간단 설명 */
  salenum int not null default 0,  /* 판매수량 */
  primary key(idx),                /* 기본키는 고유번호 */
  unique (product),                /* 상품명은 중복불과, 외래키는 중분류의 중분류명과 대분류의 대분류명 */
  foreign key (diviname) references division (diviname) on update cascade on delete cascade,
  foreign key (catename) references category (catename) on update cascade on delete cascade
);

/* delete from section; */
drop table section;
desc section;
select * from section;

/* 옵션 설정 */
create table individual (
  idx int auto_increment,        /* 고유번호 */
  indiname varchar(50) not null, /* 옵션 이름 */
  sectname varchar(50) not null, /* 소분류(상품-제조사 이름) */
  perprice int not null,         /* 1개당 가격 */
  price int not null,            /* 상품 옵션 가격 */
  quantity int not null default 0, /* 수량 */
  primary key(idx)               /* 기본키는 고유번호 */
);

drop table individual;
desc individual;
select * from individual;

/* 장바구니 */
create table cart(
  idx int auto_increment,
  nickname varchar(20) not null,
  productIdx int not null,
  optionIdx int not null,
  optionNum int not null,
  primary key(idx, nickname),
  foreign key(productIdx) references section(idx) on update cascade on delete cascade
);
/*  ,
  foreign key(nickname) references membership(nickname) on update cascade on delete cascade */
  
show tables;
desc cart;

select * from cart;

drop table cart;


create table orderlist (
  idx int not null auto_increment,
  nickname varchar(20) not null,
  name varchar(20) not null,
  address varchar(355) not null,
  zipcode varchar(7) not null,
  tel varchar(20) not null,
  orderinfo varchar(400) not null,
  totalPay int not null,
  paymethod char(1) not null,
  card varchar(10),
  bank varchar(10),
  depositName varchar(20),
  request varchar(50),
  inforcheck char(1) not null default 'y',
  orderstate varchar(20) not null default '결제완료',
  orderdate datetime not null default now(),
  statedate datetime not null default now(),
  pointUse int not null,
  post int not null,
  primary key(idx)
  /* foreign key(nickname) references membership(nickname) on update cascade on delete cascade */
);

select * from orderlist where nickname='관리자' and orderdate >= now()-7;

/* drop table orderlist; */

create table review (
  idx int auto_increment,
  orderIdx int not null,
  productIdx int not null,
  nickname varchar(20) not null,
  wdate datetime default now(),
  score int default 5 not null,
  comment varchar(100) not null,
  primary key(idx),
  /* foreign key(nickname)   references membership(nickname) on update cascade on delete cascade, */
  foreign key(orderIdx)   references orderlist(idx)       on update cascade on delete cascade,
  foreign key(productIdx) references section(idx)         on update cascade on delete cascade
);
select * from membership;
desc review;
select * from review;
/* drop table review; */

select productIdx from review where score=(select max(score) from review) limit 1;
select * from review group by productIdx order by avg(score) desc limit 5;
select section.idx from individual, section where individual.sectname=section.sectname order by individual.perprice limit 5;

