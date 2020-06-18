package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.AjaxDao;
import com.spring.blue.vo.Goods1Vo;
import com.spring.blue.vo.Goods2Vo;
import com.spring.blue.vo.Goods3Vo;

@Service
public class AjaxServiceImp implements AjaxService {
  @Autowired
  AjaxDao ajaxDao;

  @Override
  public ArrayList<Goods1Vo> getProduct1() {
    return ajaxDao.getProduct1();
  }

  @Override
  public ArrayList<Goods2Vo> getProduct2(String product1) {
    return ajaxDao.getProduct2(product1);
  }

  @Override
  public ArrayList<Goods3Vo> getProduct3(String product2) {
    return ajaxDao.getProduct3(product2);
  }
  
}
