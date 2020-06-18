/* guest.sql */
create table guest (
  idx  int not null auto_increment primary key,  /* 고유번소 */
  name varchar(20) not null,    /* 방문자 성명 */
  email varchar(50),            /* 이메일 주소 */
  homepage varchar(50),         /* 홈페이지(블로그)주소 */
  vdate datetime not null default now(), /* 방문날짜 */
  hostip varchar(40) not null, /* 방문자 IP */
  content text not null        /* 방문소감 */
);

delete from guest where idx=3;

desc guest;

insert into guest values (default,'홍길동','cjsk1126@naver.com','blog.daum.net/cjsk1126',default,'218.236.203.76','방명록 서비스 개시....');

select * from guest;

select * from guest order by idx desc;

select * from guest order by idx desc limit 0, 5; /* limit 시작인덱스, 출력건수 */

