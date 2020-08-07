package com.spring.blue.vo;

public class SectionVo {
  private int idx, mainprice, salenum;
  private long fsize;
  private String product, sectname, diviname, catename, fname, rfname, content, detail;

  public SectionVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public int getMainprice() {
    return mainprice;
  }

  public void setMainprice(int mainprice) {
    this.mainprice = mainprice;
  }

  public int getSalenum() {
    return salenum;
  }

  public void setSalenum(int salenum) {
    this.salenum = salenum;
  }

  public long getFsize() {
    return fsize;
  }

  public void setFsize(long fsize) {
    this.fsize = fsize;
  }

  public String getProduct() {
    return product;
  }

  public void setProduct(String product) {
    this.product = product;
  }

  public String getSectname() {
    return sectname;
  }

  public void setSectname(String sectname) {
    this.sectname = sectname;
  }

  public String getDiviname() {
    return diviname;
  }

  public void setDiviname(String diviname) {
    this.diviname = diviname;
  }

  public String getCatename() {
    return catename;
  }

  public void setCatename(String catename) {
    this.catename = catename;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getRfname() {
    return rfname;
  }

  public void setRfname(String rfname) {
    this.rfname = rfname;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }

  @Override
  public String toString() {
    return "SectionVo [idx=" + idx + ", mainprice=" + mainprice + ", salenum=" + salenum + ", fsize=" + fsize
        + ", product=" + product + ", sectname=" + sectname + ", diviname=" + diviname + ", catename=" + catename
        + ", fname=" + fname + ", rfname=" + rfname + ", content=" + content + ", detail=" + detail + "]";
  }

}
