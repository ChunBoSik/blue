package com.spring.blue;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
import com.spring.blue.service.AdminService;
import com.spring.blue.service.MemberService;
import com.spring.blue.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
  String flag;
  
  @Autowired
  AdminService adminService;
  
  @Autowired
  MemberService memberService;
  
  @RequestMapping(value="/amList", method=RequestMethod.GET)
  public String amListGet(Model model, Criteria cri) {
    ArrayList<MemberVo> vos = adminService.amList(cri);
    
    PageMaker pageMaker = memberService.getPageMaker(cri, 3);
    
    model.addAttribute("vos", vos);
    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("cri", cri);
    return "admin/member/amList";
  }
  
  @RequestMapping(value="/levelCheck", method=RequestMethod.GET)
  public String levelCheckGet(String mid, String level, int page, int pageSize) {
    adminService.levelCheck(mid, level);
    
    //flag = "levelCheckOk";
    flag = "levelCheckOk$page="+page+"&pageSize="+pageSize;
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/file/fList", method=RequestMethod.GET)
  public String fListGet() {
    return "admin/file/fList";
  }
  
  @RequestMapping(value="/file/boardDelete", method=RequestMethod.GET)
  public String boardDeleteGet() {
    // board작업시 생성된 'ckeditor/images'폴더의 그림파일 삭제처리
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\ckeditor\\images\\";
    adminService.imgDelete(uploadPath);
    
    flag = "imgDeleteOk";
    
    return "redirect:/msg/" + flag;
  }
  
}
