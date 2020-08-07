create table schedule (
  idx     int  not null  auto_increment primary key, /* 고유번호 */
  mid     varchar(20) not null,                      /* 고유아이디 */
  sdate   datetime not null default now(),           /* 일정 등록날짜 */
  memory  char(2),     /* 기념일(1:모임, 2:업무, 3:가족, 4:친지, 0:기타) */
  title   varchar(100) not null,                     /* 일정 제목 */
  content text not null                              /* 일정 내역 */
);

desc schedule;

/* drop table schedule; */
/* delete from schedule; */

insert into schedule values (default,'hkd1234','2020-07-19','2','시장','청주에서 9시에!');

select * from schedule order by idx desc;

delete from schedule where idx=11;
