package com.spring.blue.pagination;

public class PageMaker {
  private Criteria criteria; // 페이지 설정값이 담겨있는 객체(페이지번호, 페이지크기, 시작인덱스번호)
  private int totRecCnt; // 총 레코드 건수(총 자료의 갯수)
  private int blockStartPage, blockEndPage; // 현재 블록의 시작/끝 페이지번호
  private int blockSize;  // 한개 블록 크기
  private boolean preBtn, nextBtn; // 이전/다음블록버튼 보이기/가리기
  
  public Criteria getCriteria() {
    return criteria;
  }
  public void setCriteria(Criteria criteria) {
    this.criteria = criteria;
  }
  public int getTotRecCnt() {
    return totRecCnt;
  }
  
  public void setTotRecCnt(int totRecCnt) {
    this.totRecCnt = totRecCnt;
    calcBlock();  // 현재블록의 시작페이지번호와, 마지막페이지 번호를 구하는 메소드(calcBlock) 호출
  }
  
  private void calcBlock() {
    blockEndPage = (int)Math.ceil(criteria.getPage()/(double)blockSize) * blockSize;
    blockStartPage = blockEndPage - blockSize + 1;
    
//    System.out.println("blockStartPage="+blockStartPage);
//    System.out.println("blockEndPage="+blockEndPage);
    
    // 한개의 블록이 꽉 채워지지 않았을경우에는 현재블록의 마지막 페이지를 다시 구해준다.
    int tempBlockEndPage = (int)Math.ceil(totRecCnt/(double)criteria.getPageSize());
    if(tempBlockEndPage < blockEndPage) blockEndPage = tempBlockEndPage;
    
    preBtn = blockStartPage==1 ? false : true;
    nextBtn = blockEndPage*criteria.getPageSize() >= totRecCnt ? false : true;
  }
  
  public int getBlockStartPage() {
    return blockStartPage;
  }
  public void setBlockStartPage(int blockStartPage) {
    this.blockStartPage = blockStartPage;
  }
  public int getBlockEndPage() {
    return blockEndPage;
  }
  public void setBlockEndPage(int blockEndPage) {
    this.blockEndPage = blockEndPage;
  }
  public int getBlockSize() {
    return blockSize;
  }
  public void setBlockSize(int blockSize) {
    this.blockSize = blockSize;
  }
  public boolean isPreBtn() {
    return preBtn;
  }
  public void setPreBtn(boolean preBtn) {
    this.preBtn = preBtn;
  }
  public boolean isNextBtn() {
    return nextBtn;
  }
  public void setNextBtn(boolean nextBtn) {
    this.nextBtn = nextBtn;
  }
  
  
}
