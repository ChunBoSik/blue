package com.spring.blue.vo;

public class CategoryVo {
  private String catecode, catename;
  
  public CategoryVo() {}

  public String getCatecode() {
    return catecode;
  }

  public void setCatecode(String catecode) {
    this.catecode = catecode;
  }

  public String getCatename() {
    return catename;
  }

  public void setCatename(String catename) {
    this.catename = catename;
  }

  @Override
  public String toString() {
    return "CategoryVo [catecode=" + catecode + ", catename=" + catename + "]";
  }
  
}
