package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.GuestVo;

public interface GuestService {

  public ArrayList<GuestVo> gList(Criteria cri);

  public void gInput(GuestVo vo);

  public PageMaker getPageMaker(Criteria cri, int i);

  public void gDel(int idx);

}
