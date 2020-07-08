package com.spring.blue.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PdsInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    System.out.println("자료실 진입 전 입니다.");
    
    HttpSession session = request.getSession();
    
    Object slevel = session.getAttribute("slevel");
    if(slevel == null) {
      response.sendRedirect(request.getContextPath()+"/member/mLogin");
      return false;
    }
    
    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    System.out.println("자료실 진입 후 입니다.");
  }

}
