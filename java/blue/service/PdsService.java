package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.vo.PdsVo;

public interface PdsService {

  public ArrayList<PdsVo> pList(String part);

  public void upLoad(MultipartFile file, PdsVo vo);

}
