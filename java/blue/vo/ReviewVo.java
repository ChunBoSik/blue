package com.spring.blue.vo;

public class ReviewVo {
  private int idx, orderIdx, score, productIdx;
  private String nickname, wdate, comment;
  //추가선언
  private String product, rfname;
  
  public ReviewVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getOrderIdx() {
    return orderIdx;
  }

  public void setOrderIdx(int orderIdx) {
    this.orderIdx = orderIdx;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public int getProductIdx() {
    return productIdx;
  }

  public void setProductIdx(int productIdx) {
    this.productIdx = productIdx;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getWdate() {
    return wdate;
  }

  public void setWdate(String wdate) {
    this.wdate = wdate;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public String getProduct() {
    return product;
  }

  public void setProduct(String product) {
    this.product = product;
  }

  public String getRfname() {
    return rfname;
  }

  public void setRfname(String rfname) {
    this.rfname = rfname;
  }

  @Override
  public String toString() {
    return "ReviewVo [idx=" + idx + ", orderIdx=" + orderIdx + ", score=" + score + ", productIdx=" + productIdx
        + ", nickname=" + nickname + ", wdate=" + wdate + ", comment=" + comment + ", product=" + product + ", rfname="
        + rfname + "]";
  }
  
}
