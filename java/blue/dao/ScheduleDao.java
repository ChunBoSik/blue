package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.blue.vo.ScheduleVo;

public interface ScheduleDao {

  public ArrayList<ScheduleVo> scheduleContent(@Param("ymd") String ymd, @Param("mid") String mid);

  public ScheduleVo getContent(@Param("ymd") String ymd, @Param("mid") String mid);

  public void setContent(@Param("vo") ScheduleVo vo);

  public void scheduleDel(@Param("idx") int idx);

  public void setUpdate(@Param("vo") ScheduleVo vo);

}
