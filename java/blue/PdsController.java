package com.spring.blue;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.service.PdsService;
import com.spring.blue.vo.PdsVo;

@Controller
@RequestMapping("/pds")
public class PdsController {
  String flag;
  
  @Autowired
  PdsService pdsService;
  
  @RequestMapping(value="/pList", method=RequestMethod.GET)
  public String pListGet(Model model, Criteria cri, String part) {
    part = part==null ? "" : part;
    
    // 페이징 처리를 위한 준비
    //PageMaker pageMaker = pdsService.getPageMaker(cri, 3, part);
    
    // 자료실 자료 가져오기
    //pdsService.pList(cri, part);
    ArrayList<PdsVo> vos = pdsService.pList(part);
    
    model.addAttribute("vos", vos);
    model.addAttribute("part", part);
    model.addAttribute("cri", cri);
    //model.addAttribute("pageMaker", pageMaker);
    
    return "pds/pList";
  }
  
  @RequestMapping(value="/pInput", method=RequestMethod.GET)
  public String pInputGet() {
    return "pds/pInput";
  }
  
  @RequestMapping(value="/pInput", method=RequestMethod.POST)
  public String pInputPost(MultipartFile file, PdsVo vo) {
    pdsService.upLoad(file, vo);
    
    flag = "pInputOk";
    return "redirect:/msg/" + flag;
  }
}
