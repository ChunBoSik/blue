package com.spring.blue.vo;

public class IndividualVo {
  private int idx, perprice, price, quantity;
  private String indiname, sectname;
  
  public IndividualVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getPerprice() {
    return perprice;
  }

  public void setPerprice(int perprice) {
    this.perprice = perprice;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public String getIndiname() {
    return indiname;
  }

  public void setIndiname(String indiname) {
    this.indiname = indiname;
  }

  public String getSectname() {
    return sectname;
  }

  public void setSectname(String sectname) {
    this.sectname = sectname;
  }
  
  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  @Override
  public String toString() {
    return "IndividualVo [idx=" + idx + ", perprice=" + perprice + ", price=" + price + ", quantity=" + quantity
        + ", indiname=" + indiname + ", sectname=" + sectname + "]";
  }

}
