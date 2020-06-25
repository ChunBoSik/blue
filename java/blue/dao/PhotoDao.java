package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.PhotoGalleryVo;
import com.spring.blue.vo.PhotoTitleVo;

public interface PhotoDao {

  public int totRecCnt(@Param("part") String part);

  public ArrayList<PhotoTitleVo> photoTitleList(@Param("cri") Criteria cri, @Param("part") String part);

  public void photoTitleInput(@Param("ptVo") PhotoTitleVo ptVo);

  public int getPhotoTitleIdx();

  public void photoGalleryInput(@Param("pgVo") PhotoGalleryVo pgVo);

  public PhotoTitleVo photoTitleInfor(@Param("idx") int idx);

  public ArrayList<PhotoGalleryVo> photoGalleryInfor(@Param("idx") int idx);

  public void photoGalleryDel(@Param("idx") int idx);

  public void photoTitleUpd(@Param("ptVo") PhotoTitleVo ptVo);

  public void photoDel(@Param("idx") int idx);

  public ArrayList<PhotoTitleVo> photoTitleThumbList(@Param("cri") Criteria cri, @Param("part") String part);

}
