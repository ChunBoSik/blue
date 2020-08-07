package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.vo.IndividualVo;

public interface IndividualDao {

  public void input(@Param("vo") IndividualVo vo);

  public int maxPerPrice(@Param("sectname") String sectname);

  public int minPerPrice(@Param("sectname") String sectname);

  public ArrayList<IndividualVo> getIndiList(@Param("sectname") String sectname);

  public String getOptionName(@Param("optionIdx") int optionIdx);

  public int getOptionPrice(@Param("optionIdx") int optionIdx);

  public int getQuantity(@Param("optionIdx") String optionIdx);

  public String getIndiname(@Param("optionIdx") String optionIdx);




}
