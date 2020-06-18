package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.vo.Goods1Vo;
import com.spring.blue.vo.Goods2Vo;
import com.spring.blue.vo.Goods3Vo;

public interface AjaxService {

  public ArrayList<Goods1Vo> getProduct1();

  public ArrayList<Goods2Vo> getProduct2(String product1);

  public ArrayList<Goods3Vo> getProduct3(String product2);


}
