package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.BoardContVo;
import com.spring.blue.vo.BoardVo;
import com.spring.blue.vo.MemberVo;

public interface BoardDao {

  public ArrayList<BoardVo> bList(@Param("cri") Criteria cri);

  public void bInput(@Param("vo") BoardVo vo);

  public MemberVo nickCheck(@Param("snickname") String snickname);

  public int totRecCnt();

  public BoardVo bContent(@Param("idx") int idx);

  public void bReadNum(@Param("idx") int idx);

  public BoardVo pwdCheck(@Param("idx") int idx, @Param("pwd") String pwd);

  public void bDelete(@Param("idx") int idx, @Param("pwd") String pwd);

  public String contentSearch(@Param("idx") int idx);

  public ArrayList<BoardContVo> bContView(@Param("idx") int idx);

  public void bContInput(@Param("bContVo") BoardContVo bContVo);

  public void replyDel(@Param("idx") int idx);  // 댓글 삭제

  public BoardVo getPre(@Param("idx") int idx);

  public BoardVo getNext(@Param("idx") int idx);

}
