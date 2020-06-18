package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.vo.Goods1Vo;
import com.spring.blue.vo.Goods2Vo;
import com.spring.blue.vo.Goods3Vo;

public interface AjaxDao {

  public ArrayList<Goods1Vo> getProduct1();

  public ArrayList<Goods2Vo> getProduct2(@Param("product1") String product1);

  public ArrayList<Goods3Vo> getProduct3(@Param("product2") String product2);


}
