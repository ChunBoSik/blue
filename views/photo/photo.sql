create table photoTitle (
  idx int not null auto_increment primary key,  /* 고유번호 */
  nickname varchar(20) not null,                /* 닉네임 */
  part varchar(20) not null,                    /* 분류 */
  title text not null,                          /* 그림목록 제목 */
  thumbnail varchar(100) not null,              /* 썸네일(대표그림) */
  content text not null                         /* 포토갤러리 상세내역 */
);

select * from photoTitle order by idx desc;

create table photoGallery (
  idx  int not null auto_increment primary key,  /* 포토갤러리 고유번호 */
  photoIdx  int not null,                        /* photoTitle의 고유번호필드 */
  rfname varchar(100) not null,                  /* 서버에 저장될 파일명 */
  foreign key(photoIdx) references photoTitle(idx)
  on update cascade
  on delete RESTRICT
);

/* drop table photoGallery; */

select * from photoGallery order by idx desc;

/* delete from photoGallery; */

