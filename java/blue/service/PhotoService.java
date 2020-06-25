package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.PhotoGalleryVo;
import com.spring.blue.vo.PhotoTitleVo;

public interface PhotoService {

  public PageMaker getPageMaker(Criteria cri, int i, String part);

  public ArrayList<PhotoTitleVo> photoTitleList(Criteria cri, String part);

  public void photoTitleInput(PhotoTitleVo ptVo);

  public int getPhotoTitleIdx();

  public void photoGalleryInput(PhotoGalleryVo pgVo);

  public PhotoTitleVo photoTitleInfor(int idx);

  public ArrayList<PhotoGalleryVo> photoGalleryInfor(int idx);

  public void photoGalleryDelFile(String rfname);

  public void photoGalleryDel(int idx);

  public void photoTitleUpd(PhotoTitleVo ptVo);

  public void photoDel(int idx);

  public ArrayList<PhotoTitleVo> photoTitleThumbList(Criteria cri, String part);

}
