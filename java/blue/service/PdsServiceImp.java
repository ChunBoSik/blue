package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.PdsDao;
import com.spring.blue.vo.PdsVo;

@Service
public class PdsServiceImp implements PdsService {
  @Autowired
  PdsDao pdsDao;

  @Override
  public ArrayList<PdsVo> pList(String part) {
    return pdsDao.pList(part);
  }
  
  
}
