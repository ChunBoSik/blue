create table pds2 (
  idx      int not null auto_increment primary key, /* 고유번호 */
  nickname varchar(20) not null,  /* 별명 */
  fname    varchar(100) not null, /* 업로드시에 올린 파일명 */
  rfname   varchar(100) not null, /* 서버에 저장되는 실제 파일명 */
  title    varchar(100) not null, /* 파일에 대한 기본 설명(제목) */
  part     varchar(20)  not null, /* 파일 분류 */
  fdate    datetime  not null default now(), /* 파일 올린 날짜 */
  fsize    int not null,          /* 파일 크기 */
  downnum  int not null default 0, /* 다운로드 횟수 */
  opensw   varchar(10) not null default '공개', /* 공개 여부 */
  content  text                   /* 파일에 대한 상세 설명 */
);
/* drop table pds2; */
desc pds2;
/* delete from pds2; */

insert into pds2 values (default,'홍길동','123.jpg','20200618_1.jpg','풍경그림','여행',default,100,default,default,'제주도 풍경...');

select * from pds2 order by fdate desc;

