package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.MemberVo;

public interface AdminDao {

  public ArrayList<MemberVo> amList(@Param("cri") Criteria cri);

  public void levelCheck(@Param("mid") String mid, @Param("level") String level);

}
