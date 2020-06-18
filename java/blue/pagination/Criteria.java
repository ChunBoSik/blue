package com.spring.blue.pagination;

public class Criteria {
  private int pageSize;  // 한페이지 분량
  private int page;      // 현재 페이지번호
  
  public Criteria() {
    page = 1;
    pageSize = 5;
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public int getPage() {
    return page;
  }

  public void setPage(int page) {
    if(page <= 0)
      this.page = 1;
    else
      this.page = page;
  }
  
  // 이동할 페이지의 시작 인덱스번호를 구한다.
  public int getPageStartIndexNum() {
    return (page - 1) * pageSize;
  }
}
