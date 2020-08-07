package com.spring.blue.vo;

public class CartListVo {
  private int idx, optionIdx, optionNum, price, productIdx;
  private String nickname, product, thumbImg, optionName;
  
  public CartListVo() {}

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

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
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

  public String getThumbImg() {
    return thumbImg;
  }

  public void setThumbImg(String thumbImg) {
    this.thumbImg = thumbImg;
  }

  public String getOptionName() {
    return optionName;
  }

  public void setOptionName(String optionName) {
    this.optionName = optionName;
  }

  @Override
  public String toString() {
    return "CartListVo [idx=" + idx + ", optionIdx=" + optionIdx + ", optionNum=" + optionNum + ", price=" + price
        + ", productIdx=" + productIdx + ", nickname=" + nickname + ", product=" + product + ", thumbImg=" + thumbImg
        + ", optionName=" + optionName + "]";
  }

}
