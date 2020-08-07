package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.IndividualDao;
import com.spring.blue.vo.IndividualVo;

@Service
public class IndividualServiceImp implements IndividualService {

  @Autowired
  IndividualDao individualDao;

  @Override
  public void input(IndividualVo vo) {
    individualDao.input(vo);
  }

  @Override
  public int maxPerPrice(String sectname) {
    return individualDao.maxPerPrice(sectname);
  }

  @Override
  public int minPerPrice(String sectname) {
    return individualDao.minPerPrice(sectname);
  }

  @Override
  public ArrayList<IndividualVo> getIndiList(String sectname) {
    return individualDao.getIndiList(sectname);
  }

  @Override
  public String getOptionName(int optionIdx) {
    return individualDao.getOptionName(optionIdx);
  }

  @Override
  public int getOptionPrice(int optionIdx) {
    return individualDao.getOptionPrice(optionIdx);
  }

  @Override
  public int getQuantity(String optionIdx) {
    return individualDao.getQuantity(optionIdx);
  }

  @Override
  public String getIndiname(String optionIdx) {
    return individualDao.getIndiname(optionIdx);
  }

}
