package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.MemberVo;

public interface MemberService {

  public MemberVo idCheck(String mid);

  public MemberVo nickCheck(String nickname);

  public void mInput(MemberVo vo);

  public MemberVo mLogin(String mid);

  public ArrayList<MemberVo> mList(Criteria cri);

  public PageMaker getPageMaker(Criteria cri, int i);

  public void mDelete(String snickname);

  public void delOkCheck(int idx);

  public MemberVo getUpdateSearch(String snickname);

  public void mUpdate(MemberVo vo);

  public void pointPlus(String pointIn, String nickname);

  public void pointMinus(int pointUse, String nickname);

  public int getPoint(String nickname);

  public String getGender(String nickname);

}
