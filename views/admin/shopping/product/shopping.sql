/* 상품 테이블 */
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

select * from product;
