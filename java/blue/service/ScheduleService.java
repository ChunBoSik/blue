package com.spring.blue.service;

import java.util.ArrayList;

import com.spring.blue.vo.ScheduleVo;

public interface ScheduleService {

  public ArrayList<ScheduleVo> scheduleContent(String ymd, String mid);

  public ScheduleVo getContent(String ymd, String mid);

  public void setContent(ScheduleVo vo);

  public void scheduleDel(int idx);

  public void setUpdate(ScheduleVo vo);

}
