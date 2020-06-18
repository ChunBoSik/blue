package com.spring.blue;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.service.GuestService;
import com.spring.blue.vo.GuestVo;

@Controller
@RequestMapping({"/guest","/gg"})
public class GuestController {
  String flag;
  
  @Autowired
  GuestService guestService;
  
  @RequestMapping(value="/gList", method=RequestMethod.GET)
  public String gListGet(Model model, Criteria cri) {
    ArrayList<GuestVo> vos = guestService.gList(cri);
    
    PageMaker pageMaker = guestService.getPageMaker(cri, 3); // 블럭의 시작과 끝페이지 값을 구하기 위해 , 현재 페이지의 정보와 블럭크기(3)를 넘겨준다.
    
    model.addAttribute("vos", vos);
    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("cri", cri);
    
    return "guest/gList";
  }
  
  @RequestMapping(value="/gList", method=RequestMethod.POST)
  public String gListPost(String delItems) {
    String[] idxs = delItems.split("/");
    //int i=0;
    
    for(String idx : idxs) {
      //i++;
      //System.out.println(i + ". idx : " + idx);
      guestService.gDel(Integer.parseInt(idx));
    }
    
    flag = "gSelectDelOk";
    
    return "redirect:/msg/" + flag; 
  }
  
  @RequestMapping(value="/gInput", method=RequestMethod.GET)
  public String gInputGet(int page, Model model) {
    model.addAttribute("page", page);
    return "guest/gInput";
  }
  
  @RequestMapping(value="/gInput", method=RequestMethod.POST)
  public String gInputPost(GuestVo vo) {
    String hostip;  // 접속자 ip얻어오기
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    hostip = request.getRemoteAddr();
    vo.setHostip(hostip);
    
    guestService.gInput(vo);
    
    flag = "gInputOk";
    
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/gDel", method=RequestMethod.GET)
  public String gDelGet(int idx) {
    guestService.gDel(idx);
    
    flag = "gDelOk";
    return "redirect:/msg/" + flag;
  }
  
}
