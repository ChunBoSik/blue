package com.spring.blue.vo;

public class PdsVo {
  private int idx;
  private String nickname, fname, rfname, title, part, fdate;
  private int fsize, downnum;
  private String opensw, content;
  
  public PdsVo() {}
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
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
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getPart() {
    return part;
  }
  public void setPart(String part) {
    this.part = part;
  }
  public String getFdate() {
    return fdate;
  }
  public void setFdate(String fdate) {
    this.fdate = fdate;
  }
  public int getFsize() {
    return fsize;
  }
  public void setFsize(int fsize) {
    this.fsize = fsize;
  }
  public int getDownnum() {
    return downnum;
  }
  public void setDownnum(int downnum) {
    this.downnum = downnum;
  }
  public String getOpensw() {
    return opensw;
  }
  public void setOpensw(String opensw) {
    this.opensw = opensw;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  
  @Override
  public String toString() {
    return "PdsVo [idx=" + idx + ", nickname=" + nickname + ", fname=" + fname + ", rfname=" + rfname + ", title="
        + title + ", part=" + part + ", fdate=" + fdate + ", fsize=" + fsize + ", downnum=" + downnum + ", opensw="
        + opensw + ", content=" + content + "]";
  }
}
