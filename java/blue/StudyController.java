package com.spring.blue;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/study")
public class StudyController {
  String flag;
  
  @RequestMapping(value="/checkTest", method=RequestMethod.GET)
  public String checkTestGet() {
    return "study/checkTest";
  }
  
  @RequestMapping(value="/loginCheck", method=RequestMethod.GET)
  public String loginCheckGet() {
    return "study/loginCheck";
  }
  
  @RequestMapping(value="/shopping/product", method=RequestMethod.GET)
  public String productGet() {
    // DB에서 상품목록 가져오기...
    return "study/shopping/product/product";
  }
  
  @RequestMapping(value="/shopping/product", method=RequestMethod.POST)
  public String productPost(HttpSession session, String product) throws UnsupportedEncodingException {
    ArrayList<String> productList = (ArrayList<String>) (session.getAttribute("productList"));
    
    if(session.getAttribute("productList")==null) {
      productList = new ArrayList<String>();
    }
    productList.add(product);
    session.setAttribute("productList", productList);
    
    flag = "porductOk$"+java.net.URLEncoder.encode(product,"UTF-8");
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/shopping/cart", method=RequestMethod.GET)
  public String cartGet(HttpSession session, Model model) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    if(productList == null || productList.size() == 0) {
      flag = "productNo";
      return "redirect:/msg/" + flag;
    }
    else {
      Collections.sort(productList);  // ArrayList자료 정렬하기
      model.addAttribute("vos", productList);
      return "study/shopping/product/cart";
    }
  }
  
  @RequestMapping(value="/shopping/productAdd", method=RequestMethod.GET)
  public String productAddGet(HttpSession session, String product) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.add(product);
    session.setAttribute("productList", productList);
    
    return "redirect:/study/shopping/cart";
  }
  
  @RequestMapping(value="/shopping/productDel", method=RequestMethod.GET)
  public String productDelGet(HttpSession session, String product) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.remove(product);
    
    return "redirect:/study/shopping/cart";
  }
  
  @RequestMapping(value="/shopping/productGroupDel", method=RequestMethod.GET)
  public String productGroupDelGet(HttpSession session, String product) {
    //System.out.println("product : " + product);
    ArrayList<String> productArr = new ArrayList<String>();
    productArr.add(product);
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.removeAll(productArr);
    
    return "redirect:/study/shopping/cart";
  }
  
  @RequestMapping(value="/shopping/order", method=RequestMethod.GET)
  public String orderGet() {
    return "study/shopping/product/order";
  }
  
  @RequestMapping(value="/shopping/order", method=RequestMethod.POST)
  public String paymentOkGet(HttpSession session) {
    session.removeAttribute("productList");
    
    flag = "paymentOk";
    return "redirect:/msg/" + flag;
  }

  @RequestMapping(value="/shopping/orderReset", method=RequestMethod.GET)
  public String orderReset(HttpSession session) {
    session.removeAttribute("productList");
    
    flag = "orderReset";
    return "redirect:/msg/" + flag;
  }
  
}
