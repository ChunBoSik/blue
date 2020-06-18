package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.vo.PdsVo;

public interface PdsDao {

  public ArrayList<PdsVo> pList(@Param("part") String part);

  public void upLoad(@Param("vo") PdsVo vo);

}
