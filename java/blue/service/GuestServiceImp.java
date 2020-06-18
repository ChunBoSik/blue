package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.GuestDao;
import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.GuestVo;

@Service
public class GuestServiceImp implements GuestService {
  @Autowired
  GuestDao guestDao;

  @Override
  public void gInput(GuestVo vo) {
    guestDao.gInput(vo);
  }

  @Override
  public ArrayList<GuestVo> gList(Criteria cri) {
    return guestDao.gList(cri);
  }

  @Override
  public PageMaker getPageMaker(Criteria cri, int i) {
    int totRecCnt = guestDao.totRecCnt();  // 전체 레코드 갯수 구하기
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCriteria(cri);
    pageMaker.setBlockSize(i);
    pageMaker.setTotRecCnt(totRecCnt);
    
    return pageMaker;
  }

  @Override
  public void gDel(int idx) {
    guestDao.gDel(idx);
  }
  
  
}
