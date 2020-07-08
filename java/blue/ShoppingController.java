package com.spring.blue;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blue.service.ShoppingService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
  String flag;
  
  @Autowired
  ShoppingService shoppingService;
  
  @RequestMapping(value="/admin/shopping/adminMain", method=RequestMethod.GET)
  public String adminMainGet() {
    return "admin/shopping/adminMain";
  }
  
  @RequestMapping(value="/admin/shopping/left",method=RequestMethod.GET)
  public String shoppingLeftGet() {
    return "admin/shopping/left";
  }
  
  @RequestMapping(value="/admin/shopping/right",method=RequestMethod.GET)
  public String shppingRightGet() {
    return "admin/shopping/right";
  }
  
  @RequestMapping(value="/product", method=RequestMethod.GET)
  public String productGet() {
    return "admin/shopping/product/product";
  }
  
  @RequestMapping(value="/product", method=RequestMethod.POST)
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
  
  @RequestMapping(value="/cart", method=RequestMethod.GET)
  public String cartGet(HttpSession session, Model model) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    if(productList == null || productList.size() == 0) {
      flag = "productNo";
      return "redirect:/msg/" + flag;
    }
    else {
      Collections.sort(productList);  // ArrayList자료 정렬하기
      model.addAttribute("vos", productList);
      return "admin/shopping/product/cart";
    }
  }
  
  @RequestMapping(value="/productAdd", method=RequestMethod.GET)
  public String productAddGet(HttpSession session, String product) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.add(product);
    session.setAttribute("productList", productList);
    
    return "redirect:/shopping/cart";
  }
  
  @RequestMapping(value="/productDel", method=RequestMethod.GET)
  public String productDelGet(HttpSession session, String product) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.remove(product);
    
    return "redirect:/shopping/cart";
  }
  
  @RequestMapping(value="/productGroupDel", method=RequestMethod.GET)
  public String productGroupDelGet(HttpSession session, String product) {
    System.out.println("product : " + product);
    ArrayList<String> productArr = new ArrayList<String>();
    productArr.add(product);
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.removeAll(productArr);
    
    return "redirect:/shopping/cart";
  }
  
  @RequestMapping(value="/order", method=RequestMethod.GET)
  public String orderGet() {
    return "admin/shopping/product/order";
  }
  
  @RequestMapping(value="/order", method=RequestMethod.POST)
  public String paymentOkGet(HttpSession session) {
    session.removeAttribute("productList");
    
    flag = "paymentOk";
    return "redirect:/msg/" + flag;
  }

  @RequestMapping(value="/orderReset", method=RequestMethod.GET)
  public String orderReset(HttpSession session) {
    session.removeAttribute("productList");
    
    flag = "orderReset";
    return "redirect:/msg/" + flag;
  }
  
}
