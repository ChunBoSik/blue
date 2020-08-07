package com.spring.blue.vo;

public class ScheduleVo {
  private int idx;
  private String mid;
  private String sdate;
  private String memory;
  private String title;
  private String content;
  
  private String sw;  // 입력인지 갱신인지?...구분변수
  
  public ScheduleVo() {}

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getMid() {
    return mid;
  }

  public void setMid(String mid) {
    this.mid = mid;
  }

  public String getSdate() {
    return sdate;
  }

  public void setSdate(String sdate) {
    this.sdate = sdate;
  }

  public String getMemory() {
    return memory;
  }

  public void setMemory(String memory) {
    this.memory = memory;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getSw() {
    return sw;
  }

  public void setSw(String sw) {
    this.sw = sw;
  }

  @Override
  public String toString() {
    return "ScheduleVo [idx=" + idx + ", mid=" + mid + ", sdate=" + sdate + ", memory=" + memory + ", title=" + title
        + ", content=" + content + ", sw=" + sw + "]";
  }
}
