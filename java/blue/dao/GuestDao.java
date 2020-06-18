package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.GuestVo;

public interface GuestDao {

  public ArrayList<GuestVo> gList(@Param("cri") Criteria cri);

  public void gInput(@Param("vo") GuestVo vo);

  public int totRecCnt();

  public void gDel(@Param("idx") int idx);

}
