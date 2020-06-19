package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.PdsVo;

public interface PdsDao {

  public ArrayList<PdsVo> pList(@Param("cri") Criteria cri, @Param("part") String part);

  public void upLoad(@Param("vo") PdsVo vo);

  public int totRecCnt(@Param("part") String part);

  public PdsVo pContent(@Param("idx") int idx);

  public void pDown(@Param("idx") int idx);

}
