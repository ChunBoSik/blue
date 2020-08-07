package com.spring.blue.vo;

public class CartVo {
  private int idx, optionIdx, optionNum, productIdx;
  private String nickname;
  
  //추가선언
  private String product;
  
  public CartVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getOptionIdx() {
    return optionIdx;
  }

  public void setOptionIdx(int optionIdx) {
    this.optionIdx = optionIdx;
  }

  public int getOptionNum() {
    return optionNum;
  }

  public void setOptionNum(int optionNum) {
    this.optionNum = optionNum;
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

  public String getProduct() {
    return product;
  }

  public void setProduct(String product) {
    this.product = product;
  }

  @Override
  public String toString() {
    return "CartVo [idx=" + idx + ", optionIdx=" + optionIdx + ", optionNum=" + optionNum + ", productIdx=" + productIdx
        + ", nickname=" + nickname + ", product=" + product + "]";
  }

}
