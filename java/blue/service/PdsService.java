package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.PdsVo;

public interface PdsService {

  public ArrayList<PdsVo> pList(Criteria cri, String part);

  public void upLoad(MultipartFile file, PdsVo vo);

  public PageMaker getPageMaker(Criteria cri, int i, String part);

  public PdsVo pContent(int idx);

  public void pDown(PdsVo vo);

}
