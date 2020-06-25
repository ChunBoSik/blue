package com.spring.blue.vo;

public class PhotoGalleryVo {
  private int idx, photoIdx;
  private String fname, rfname;
  
  public PhotoGalleryVo() {}
  
  public int getIdx() {
    return idx;
  }
  public void setIdx(int idx) {
    this.idx = idx;
  }
  public int getPhotoIdx() {
    return photoIdx;
  }
  public void setPhotoIdx(int photoIdx) {
    this.photoIdx = photoIdx;
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
  
  @Override
  public String toString() {
    return "PhotoGalleryVo [idx=" + idx + ", photoIdx=" + photoIdx + ", fname=" + fname + ", rfname=" + rfname + "]";
  }
}
