package com.spring.blue.vo;

public class PhotoTitleVo {
  private int idx;
  private String nickname, part, title, thumbnail, content;
  
  public PhotoTitleVo() {}
  
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
  public String getPart() {
    return part;
  }
  public void setPart(String part) {
    this.part = part;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getThumbnail() {
    return thumbnail;
  }
  public void setThumbnail(String thumbnail) {
    this.thumbnail = thumbnail;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  
  @Override
  public String toString() {
    return "PhotoTitleVo [idx=" + idx + ", nickname=" + nickname + ", part=" + part + ", title=" + title
        + ", thumbnail=" + thumbnail + ", content=" + content + "]";
  }
}
