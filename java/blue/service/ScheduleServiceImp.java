package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.ScheduleDao;
import com.spring.blue.vo.ScheduleVo;

@Service
public class ScheduleServiceImp implements ScheduleService {
  @Autowired
  ScheduleDao scheduleDao;

  @Override
  public ArrayList<ScheduleVo> scheduleContent(String ymd, String mid) {
    return scheduleDao.scheduleContent(ymd, mid);
  }

  @Override
  public ScheduleVo getContent(String ymd, String mid) {
    return scheduleDao.getContent(ymd, mid);
  }

  @Override
  public void setContent(ScheduleVo vo) {
    scheduleDao.setContent(vo);
  }

  @Override
  public void scheduleDel(int idx) {
    scheduleDao.scheduleDel(idx);
  }

  @Override
  public void setUpdate(ScheduleVo vo) {
    scheduleDao.setUpdate(vo);
  }
  
}
