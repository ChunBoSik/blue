create table board (
  idx   int not null auto_increment primary key, /* 고유번호 */
  name  varchar(20) not null,   /* 글쓴이 */
  email varchar(60),            /* 이메일 */
  homepage varchar(60),         /* 홈페이지(블로그)주소 */
  title varchar(100) not null,  /* 글제목 */
  pwd   varchar(100),            /* 비밀번호 */
  wdate datetime default now(), /* 글 올린 날자 */
  readnum int not null default 0, /* 글 조회수 */
  hostip varchar(50) not null,  /* 글쓴곳에서의 hostIp */
  content text not null         /* 글 내용 */
);

desc board;

alter table board modify pwd varchar(100);

insert into board values (default,'관리자','cjsk1126@hanmail.net','blog.daum.net/cjsk1126','게시판 서비스를 시작합니다.','1234',default,default,'218.236.203.76','게시판 서비스....');
insert into board values (default,'홍길동','hkd1234@hanmail.net','blog.daum.net/hkd1234','안녕하세요!!','1234',default,default,'218.236.203.76','자주 애용하겠습니다.');

update board set pwd='1234' where pwd='';
update board set content=replace(content,'/blue/resources/ckeditor/images','/blue/resources/ckeditor/images/src/') where idx <= 57;

select * from board;
select count(*) from board;
select idx,name,title from board;

select * from board order by idx desc;

-- 댓글처리 테이블(board_cont)
create table board_cont (
  idx    int not null auto_increment primary key, /* 댓글 고유번호 */
  board_idx int not null,         /* 해당 게시글의 고유번호 */
  nickname  varchar(20) not null, /* 댓글쓴 사람의 별명 */
  wdate     datetime not null default now(), /* 댓글 올린 날짜 */
  hostip    varchar(50) not null, /* 댓글 작성자의 IP */
  content   text not null,        /* 댓글 내용 */
  foreign key(board_idx) references board(idx)
  on update cascade
  on delete RESTRICT   /* 원본 테이블의 기본키가 삭제/수정되지 못하도록 한다 */
);
desc board_cont;
insert into board_cont values (default,63,'이기자',default,'1.1.1.1','안녕');
select * from board_cont order by idx desc;
delete from board where idx=39;
delete from board_cont where idx=2;


select * from board_cont where board_idx=63;
select * from board where idx=63;
select count(*) from board_cont where board_idx=63;

select idx,name from board;
select board.*,(select count(*) from board_cont where board_idx=board.idx) as count from board order by idx desc;
select a.*,(select count(*) from board_cont where board_idx=a.idx) as count from board a order by idx desc;


select * from board where idx = (select max(idx) from board where idx < 62); /* 다음글 */
select * from board where idx = (select min(idx) from board where idx > 50); /* 이전글 */


