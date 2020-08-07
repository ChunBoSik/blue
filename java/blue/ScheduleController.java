package com.spring.blue;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blue.service.ScheduleService;
import com.spring.blue.vo.ScheduleVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
  @Autowired
  ScheduleService scheduleService;
  
  @RequestMapping(value="/calendar", method=RequestMethod.GET)
  public String calendarGet(HttpSession session, Model model, HttpServletRequest request) {
    String mid = session.getAttribute("smid")==null ? "" : session.getAttribute("smid").toString();
    
    //Calendar calCur = Calendar.getInstance();  // 오늘날짜
    Calendar cal = Calendar.getInstance();     // 화면에 표시할 날짜
    int yy = request.getParameter("yy")==null?cal.get(Calendar.YEAR):Integer.parseInt(request.getParameter("yy"));
    int mm = request.getParameter("mm")==null?cal.get(Calendar.MONTH):Integer.parseInt(request.getParameter("mm"));
    
    String ymd=cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
    ArrayList<ScheduleVo> vos = scheduleService.scheduleContent(ymd, mid);
    
    model.addAttribute("yy", yy);
    model.addAttribute("mm", mm);
    model.addAttribute("vos", vos);
    
    return "schedule/calendar";
  }
  
  @RequestMapping(value="/content", method=RequestMethod.GET)
  public String contentGet(HttpSession session, Model model, String ymd) {
    String mid = (String) session.getAttribute("smid");
    ScheduleVo vo = scheduleService.getContent(ymd, mid);
    
    model.addAttribute("ymd", ymd);
    model.addAttribute("vo", vo);
    
    return "schedule/content";
  }
  
  @RequestMapping(value="/content", method=RequestMethod.POST)
  public String contentPost(ScheduleVo vo, String ymd) {
    if(vo.getSw().equals("input")) {
      scheduleService.setContent(vo);  // 스케줄 등록
    }
    else {
      scheduleService.setUpdate(vo);   // 스케줄 갱신
    }
    int yy = Integer.parseInt(vo.getSdate().substring(0, 4));
    int mm = Integer.parseInt(vo.getSdate().substring(5, 7))-1;
    
    return "redirect:/msg/setContentOk$yy="+yy+"&mm="+mm;
  }
  
  @RequestMapping(value="/scheduleDel", method=RequestMethod.GET)
  public String scheduleDelGet(int idx) {
    scheduleService.scheduleDel(idx);
    
    return "redirect:/msg/scheduleDelOk";
  }
}
