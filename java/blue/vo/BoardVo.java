package com.spring.blue.vo;

public class BoardVo {
  private int idx;
  private String name, email, homepage, title, pwd, wdate;
  private int readnum;
  private String hostip;
  private String content;
  private int replyNum;
  
  public BoardVo() {}
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getHomepage() {
    return homepage;
  }
  public void setHomepage(String homepage) {
    this.homepage = homepage;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getPwd() {
    return pwd;
  }
  public void setPwd(String pwd) {
    this.pwd = pwd;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public int getReadnum() {
    return readnum;
  }
  public void setReadnum(int readnum) {
    this.readnum = readnum;
  }
  public String getHostip() {
    return hostip;
  }
  public void setHostip(String hostip) {
    this.hostip = hostip;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getReplyNum() {
    return replyNum;
  }
  public void setReplyNum(int replyNum) {
    this.replyNum = replyNum;
  }

  @Override
  public String toString() {
    return "BoardVo [idx=" + idx + ", name=" + name + ", email=" + email + ", homepage=" + homepage + ", title=" + title
        + ", pwd=" + pwd + ", wdate=" + wdate + ", readnum=" + readnum + ", hostip=" + hostip + ", content=" + content
        + ", replyNum=" + replyNum + "]";
  }
}
