package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.vo.MemberVo;

public interface AdminService {

  public ArrayList<MemberVo> amList(Criteria cri);

  public void levelCheck(String mid, String level);

  public void imgDelete(String uploadPath);

}
