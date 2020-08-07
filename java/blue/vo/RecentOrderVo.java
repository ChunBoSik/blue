package com.spring.blue.vo;

public class RecentOrderVo {
  private int idx, totalPay, pointUse, post;
  private String nickname, name, gender, address, zipcode, tel, orderinfo, paymethod, card, bank, depositName, request, inforcheck, orderstate, orderdate, statedate;
  
  //추가선언
  private String rfname, product, optionIdx, indiname, optionNum, reviewSw;
  private int optionPrice, productPrice, item;
  
  public RecentOrderVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getTotalPay() {
    return totalPay;
  }

  public void setTotalPay(int totalPay) {
    this.totalPay = totalPay;
  }

  public int getItem() {
    return item;
  }

  public void setItem(int item) {
    this.item = item;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getZipcode() {
    return zipcode;
  }

  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getOrderinfo() {
    return orderinfo;
  }

  public void setOrderinfo(String orderinfo) {
    this.orderinfo = orderinfo;
  }

  public String getPaymethod() {
    return paymethod;
  }

  public void setPaymethod(String paymethod) {
    this.paymethod = paymethod;
  }

  public String getCard() {
    return card;
  }

  public void setCard(String card) {
    this.card = card;
  }

  public String getBank() {
    return bank;
  }

  public void setBank(String bank) {
    this.bank = bank;
  }

  public String getDepositName() {
    return depositName;
  }

  public void setDepositName(String depositName) {
    this.depositName = depositName;
  }

  public String getRequest() {
    return request;
  }

  public void setRequest(String request) {
    this.request = request;
  }

  public String getInforcheck() {
    return inforcheck;
  }

  public void setInforcheck(String inforcheck) {
    this.inforcheck = inforcheck;
  }

  public String getOrderstate() {
    return orderstate;
  }

  public void setOrderstate(String orderstate) {
    this.orderstate = orderstate;
  }

  public String getOrderdate() {
    return orderdate;
  }

  public void setOrderdate(String orderdate) {
    this.orderdate = orderdate;
  }

  public String getRfname() {
    return rfname;
  }

  public void setRfname(String rfname) {
    this.rfname = rfname;
  }

  public String getProduct() {
    return product;
  }

  public void setProduct(String product) {
    this.product = product;
  }

  public String getOptionIdx() {
    return optionIdx;
  }

  public void setOptionIdx(String optionIdx) {
    this.optionIdx = optionIdx;
  }

  public String getIndiname() {
    return indiname;
  }

  public void setIndiname(String indiname) {
    this.indiname = indiname;
  }

  public String getOptionNum() {
    return optionNum;
  }

  public void setOptionNum(String optionNum) {
    this.optionNum = optionNum;
  }

  public int getOptionPrice() {
    return optionPrice;
  }

  public void setOptionPrice(int optionPrice) {
    this.optionPrice = optionPrice;
  }

  public int getProductPrice() {
    return productPrice;
  }

  public void setProductPrice(int productPrice) {
    this.productPrice = productPrice;
  }
  
  

  public String getReviewSw() {
    return reviewSw;
  }

  public void setReviewSw(String reviewSw) {
    this.reviewSw = reviewSw;
  }

  
  
  public String getStatedate() {
    return statedate;
  }

  public void setStatedate(String statedate) {
    this.statedate = statedate;
  }
  
  public int getPointUse() {
    return pointUse;
  }

  public void setPointUse(int pointUse) {
    this.pointUse = pointUse;
  }

  public int getPost() {
    return post;
  }

  public void setPost(int post) {
    this.post = post;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  @Override
  public String toString() {
    return "RecentOrderVo [idx=" + idx + ", totalPay=" + totalPay + ", pointUse=" + pointUse + ", post=" + post
        + ", nickname=" + nickname + ", name=" + name + ", gender=" + gender + ", address=" + address + ", zipcode="
        + zipcode + ", tel=" + tel + ", orderinfo=" + orderinfo + ", paymethod=" + paymethod + ", card=" + card
        + ", bank=" + bank + ", depositName=" + depositName + ", request=" + request + ", inforcheck=" + inforcheck
        + ", orderstate=" + orderstate + ", orderdate=" + orderdate + ", statedate=" + statedate + ", rfname=" + rfname
        + ", product=" + product + ", optionIdx=" + optionIdx + ", indiname=" + indiname + ", optionNum=" + optionNum
        + ", reviewSw=" + reviewSw + ", optionPrice=" + optionPrice + ", productPrice=" + productPrice + ", item="
        + item + "]";
  }

}
