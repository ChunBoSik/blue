package com.spring.blue.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.blue.dao.PhotoDao;
import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.PhotoGalleryVo;
import com.spring.blue.vo.PhotoTitleVo;

@Service
public class PhotoServiceImp implements PhotoService {
  @Autowired
  PhotoDao photoDao;

  @Override
  public PageMaker getPageMaker(Criteria cri, int i, String part) {
    int totRecCnt = photoDao.totRecCnt(part);
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCriteria(cri);
    pageMaker.setBlockSize(i);
    pageMaker.setTotRecCnt(totRecCnt);
    
    return pageMaker;
  }

  @Override
  public ArrayList<PhotoTitleVo> photoTitleList(Criteria cri, String part) {
    return photoDao.photoTitleList(cri, part);
  }

  @Override
  public void photoTitleInput(PhotoTitleVo ptVo) {
    photoDao.photoTitleInput(ptVo);
  }

  @Override
  public int getPhotoTitleIdx() {
    return photoDao.getPhotoTitleIdx();
  }

  @Override
  public void photoGalleryInput(PhotoGalleryVo pgVo) {
    photoDao.photoGalleryInput(pgVo);
  }

  @Override
  public PhotoTitleVo photoTitleInfor(int idx) {
    return photoDao.photoTitleInfor(idx);
  }

  @Override
  public ArrayList<PhotoGalleryVo> photoGalleryInfor(int idx) {
    return photoDao.photoGalleryInfor(idx);
  }

  // 서버의 파일 삭제 메소드
  @Override
  public void photoGalleryDelFile(String rfname) {
    // 서버에 파일이 존재하면 삭제처리한다.
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/photo/"+rfname;
    File file = new File(uploadPath);
    
    if(file.exists()) {
      file.delete();
    }
  }

  @Override
  public void photoGalleryDel(int idx) {
    photoDao.photoGalleryDel(idx);  // photoIdx와 일치하는 photoGallery테이블의 자료 지우기
  }

  @Override
  public void photoTitleUpd(PhotoTitleVo ptVo) {
    photoDao.photoTitleUpd(ptVo);
  }

  @Override
  public void photoDel(int idx) {
    ArrayList<PhotoGalleryVo> pgVos = photoGalleryInfor(idx);
    for(PhotoGalleryVo vo : pgVos) {
      photoGalleryDelFile(vo.getRfname()); // photoGallery테이블에 등록되어 있는 사진들중 idx와 일치하는 사진을 모두 삭제시킨다.
    }
    
    photoDao.photoDel(idx);  // idx와 일치하는 photoGallery와 photoTitle테이블 의 자료 지우기
  }

  @Override
  public ArrayList<PhotoTitleVo> photoTitleThumbList(Criteria cri, String part) {
    return photoDao.photoTitleThumbList(cri, part);
  }
}
