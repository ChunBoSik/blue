package com.spring.blue.vo;

public class DivisionVo {
  private String divicode, diviname, catename;
  
  public DivisionVo() {}

  public String getDivicode() {
    return divicode;
  }

  public void setDivicode(String divicode) {
    this.divicode = divicode;
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

  @Override
  public String toString() {
    return "DivisionVo [divicode=" + divicode + ", diviname=" + diviname + ", catename=" + catename + "]";
  }
  
}
