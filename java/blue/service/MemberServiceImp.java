package com.spring.blue.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.MemberDao;
import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.MemberVo;

@Service
public class MemberServiceImp implements MemberService {
  @Autowired
  MemberDao memberDao;

  @Override
  public MemberVo idCheck(String mid) {
    return memberDao.idCheck(mid);
  }

  @Override
  public MemberVo nickCheck(String nickname) {
    return memberDao.nickCheck(nickname);
  }

  @Override
  public void mInput(MemberVo vo) {
    memberDao.mInput(vo);
  }

  @Override
  public MemberVo mLogin(String mid) {
    return memberDao.mLogin(mid);
  }

  @Override
  public ArrayList<MemberVo> mList(Criteria cri) {
    return memberDao.mList(cri);
  }

  @Override
  public PageMaker getPageMaker(Criteria cri, int i) {
    int totRecCnt = memberDao.totRecCnt();
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCriteria(cri);
    pageMaker.setBlockSize(i);
    pageMaker.setTotRecCnt(totRecCnt);
    
    return pageMaker;
  }

  @Override
  public void mDelete(String snickname) {
    memberDao.mDelete(snickname);
  }

  @Override
  public void delOkCheck(int idx) {
    memberDao.delOkCheck(idx);
  }

  @Override
  public MemberVo getUpdateSearch(String snickname) {
    return memberDao.getUpdateSearch(snickname);
  }

  @Override
  public void mUpdate(MemberVo vo) {
    memberDao.mUpdate(vo);
  }

  @Override
  public void pointPlus(String pointIn, String nickname) {
    memberDao.pointPlus(pointIn, nickname);
  }

  @Override
  public void pointMinus(int pointUse, String nickname) {
    memberDao.pointMinus(pointUse, nickname);
  }

  @Override
  public int getPoint(String nickname) {
    return memberDao.getPoint(nickname);
  }

  @Override
  public String getGender(String nickname) {
    return memberDao.getGender(nickname);
  }
  
}
