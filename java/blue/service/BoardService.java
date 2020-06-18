package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.BoardContVo;
import com.spring.blue.vo.BoardVo;
import com.spring.blue.vo.MemberVo;

public interface BoardService {

  public ArrayList<BoardVo> bList(Criteria cri);

  public void bInput(BoardVo vo);

  public MemberVo nickCheck(String snickname);

  public PageMaker getPageMaker(Criteria cri, int i);

  public BoardVo bContent(int idx);

  public void bReadNum(int idx);

  public void imgCheck(String content, String uploadPath);

  public void bDelete(int idx, String pwd);

  public int pwdCheck(int idx, String pwd);

  public void bImgDelete(int idx, String uploadPath);

  public ArrayList<BoardContVo> bContView(int idx);

  public void bContInput(BoardContVo bContVo);

  public void replyDel(int idx);

  public BoardVo getPre(int idx);

  public BoardVo getNext(int idx);

}
