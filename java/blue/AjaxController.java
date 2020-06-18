package com.spring.blue;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.blue.service.AjaxService;
import com.spring.blue.vo.Goods1Vo;
import com.spring.blue.vo.Goods2Vo;
import com.spring.blue.vo.Goods3Vo;

@Controller
@RequestMapping("/ajax")
public class AjaxController {
  @Autowired
  AjaxService ajaxService;
  
  @RequestMapping(value="/ajaxTest", method=RequestMethod.GET)
  public String ajaxTestGet() {
    return "ajax/ajaxTest";
  }
  
  // Ajax처리 연습
  @RequestMapping(value="/ajaxTest", method=RequestMethod.POST)
  @ResponseBody
  public HashMap<Object, Object> ajaxTestPost(@RequestBody String data) {
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    
    System.out.println("data : " + data);
    
    ArrayList<String> list = new ArrayList<String>();
    if(data.equals("서울")) {
      list.add("종로구");
      list.add("영등포구");
      list.add("관악구");
      list.add("강남구");
      list.add("강북구");
      list.add("강서구");
      list.add("서대문구");
      list.add("강동구");
    }
    else if(data.equals("경기")) {
      list.add("성남시");
      list.add("수원시");
      list.add("화성시");
      list.add("의정부시");
      list.add("안성시");
      list.add("평택시");
      list.add("부천시");
      list.add("안양시");
      list.add("하남시");
    }
    else if(data.equals("충북")) {
      list.add("청주시");
      list.add("충주시");
      list.add("증평군");
      list.add("제천시");
      list.add("단양군");
      list.add("음성군");
      list.add("옥천군");
      list.add("진천군");
    }
    else if(data.equals("충남")) {
      list.add("천안시");
      list.add("조치원읍");
      list.add("서산시");
      list.add("태안군");
      list.add("홍성군");
      list.add("예산군");
      list.add("당진시");
      list.add("논산시");
      list.add("계룡시");
    }
    map.put("city", list);
    System.out.println("map=" + map);
    return map;
  }
  
  @RequestMapping(value="/goods", method=RequestMethod.GET)
  public String goodsGet(Model model) {
    ArrayList<Goods1Vo> vos = ajaxService.getProduct1();
    model.addAttribute("vos", vos);
    
    return "ajax/goods";
  }
  
  // 상품관리(DB에서 중분류 검색처리 루틴 - Ajax처리)
  @RequestMapping(value="/goods", method=RequestMethod.POST)
  @ResponseBody
  public HashMap<Object, Object> goodsPost(@RequestBody String product1) {
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    
    ArrayList<Goods2Vo> vos2 = ajaxService.getProduct2(product1);
    map.put("product2", vos2);
    
    //System.out.println("map:"+map);
    
    return map;
  }
  
//상품관리(DB에서소분류 검색처리 루틴 - Ajax처리)
 @RequestMapping(value="/goods2", method=RequestMethod.POST)
 @ResponseBody
 public HashMap<Object, Object> goods2Post(@RequestBody String product2) {
   HashMap<Object, Object> map = new HashMap<Object, Object>();
   
   ArrayList<Goods3Vo> vos3 = ajaxService.getProduct3(product2);
   map.put("product3", vos3);
   
   //System.out.println("map:"+map);
   
   return map;
 }
}
