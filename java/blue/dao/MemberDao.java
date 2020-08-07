package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.MemberVo;

public interface MemberDao {

  public MemberVo idCheck(@Param("mid") String mid);

  public MemberVo nickCheck(@Param("nickname") String nickname);

  public void mInput(@Param("vo") MemberVo vo);

  public MemberVo mLogin(@Param("mid") String mid);

  public ArrayList<MemberVo> mList(@Param("cri") Criteria cri);

  public int totRecCnt();

  public void mDelete(@Param("snickname") String snickname);

  public void delOkCheck(@Param("idx") int idx);

  public MemberVo getUpdateSearch(@Param("snickname") String snickname);

  public void mUpdate(@Param("vo") MemberVo vo);

  public void pointMinus(@Param("pointUse") int pointUse, @Param("nickname") String nickname);

  public void pointPlus(@Param("pointIn") String pointIn, @Param("nickname") String nickname);

  public int getPoint(@Param("nickname") String nickname);

  public String getGender(@Param("nickname") String nickname);

}
