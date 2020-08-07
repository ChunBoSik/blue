package com.spring.blue.vo;

public class OrderlistVo {
  private int idx, totalPay,pointUse,post;
  private String nickname, name, address, zipcode, tel, orderinfo, paymethod, card, bank, depositName, request, inforcheck, orderstate, orderdate, statedate;
  
  public OrderlistVo() {}

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

  @Override
  public String toString() {
    return "OrderlistVo [idx=" + idx + ", totalPay=" + totalPay + ", pointUse=" + pointUse + ", post=" + post
        + ", nickname=" + nickname + ", name=" + name + ", address=" + address + ", zipcode=" + zipcode + ", tel=" + tel
        + ", orderinfo=" + orderinfo + ", paymethod=" + paymethod + ", card=" + card + ", bank=" + bank
        + ", depositName=" + depositName + ", request=" + request + ", inforcheck=" + inforcheck + ", orderstate="
        + orderstate + ", orderdate=" + orderdate + ", statedate=" + statedate + "]";
  }

}
