/* membership.sql(회원관리) */
create table membership (
	idx      int  not null auto_increment,
	mid      varchar(20) not null,
	pwd      varchar(100) not null,
	name     varchar(20) not null,
	nickname varchar(20) not null,        /* 별명 */
	gender   char(2) default '남자',       /* 성별 */
	tel      varchar(15),
	hobby    varchar(50) default '',      /* 취미 */
	email    varchar(50),
	joinday  datetime    default now(),   /* 가입일 */
	userinfor char(2)    default 'OK',    /* 정보공개(OK/NO) */
	level    int     default 4,           /* 회원등급(4:준회원/3:정회원/2:우수회원/1:특별회원/0:관리자) */
	userdel  char(2)     default 'NO',    /* 회원탈퇴 유무(OK/NO) */
	content  text,                        /* 자기소개 */
	point int not null default 0,         /* 상품구매시 포인트 저장 */
  zipcode     varchar(7)   not null,  /* 우편번호(추가) */
  addr_master varchar(255) not null,  /* 기본주소(추가) */
  addr_detail varchar(100),           /* 연락처(상세주소)-추가 */
  primary key(idx, nickname),  /* 기본키(고유번호,별명) */
  unique(mid, nickname)        /* 중복불허 */
);
desc membership;
alter table membership modify pwd varchar(100) not null;
alter table membership modify level int not null default 4;
alter table membership add column zipcode varchar(7) not null;
alter table membership add column addr_master varchar(255) not null;
alter table membership add column addr_detail varchar(100);

insert into membership values (default,'hkd1234','1234','홍길동','홍장군',
      default,'010-3423-2704','등산','cjsk1126@naver.com',
      default,default,0,default,'관리자입니다.',default);
insert into membership values (default,'kms1234','1234','김말숙','김천사',
      default,'010-3333-2222','낚시','kms1234@naver.com',
      default,default,default,default,'안녕하세요',default);
insert into membership values (default,'lkj1234','1234','이기자','이보소',
      default,'010-3333-2222','낚시','kms1234@naver.com',
      default,default,3,default,'안녕하세요',default);
      
/* delete from membership where mid='hkd1234'; */
update membership set userinfor='OK' where idx=5;
update membership set userinfor='OK' where idx=5;
update membership set level=3 where idx=16;
update membership set level=0 where idx=16; /* 관리자(레벨:0) */
update membership set userdel='NO' where idx=8;

SELECT count(*) FROM membership WHERE date_format(joinday, '%Y-%m-%d') = curdate();
select * from membership;

