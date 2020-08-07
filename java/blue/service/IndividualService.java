package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.vo.IndividualVo;

public interface IndividualService {

  public void input(IndividualVo vo);

  public int maxPerPrice(String sectname);

  public int minPerPrice(String sectname);

  public ArrayList<IndividualVo> getIndiList(String sectname);

  public String getOptionName(int optionIdx);

  public int getOptionPrice(int optionIdx);

  public int getQuantity(String optionIdx);

  public String getIndiname(String optionIdx);




}
