package com.spring.blue.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.AdminDao;
import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.MemberVo;

@Service
public class AdminServiceImp implements AdminService {
  @Autowired
  AdminDao adminDao;

  @Override
  public ArrayList<MemberVo> amList(Criteria cri) {
    return adminDao.amList(cri);
  }

  @Override
  public void levelCheck(String mid, String level) {
    adminDao.levelCheck(mid, level);
  }

  // 파일 삭제 메소드
  @Override
  public void imgDelete(String uploadPath) {
    File path = new File(uploadPath);
    
    File[] fileList = path.listFiles();
    
    for(int i=0; i<fileList.length; i++) {
      fileList[i].delete();
    }
  }
  
}
