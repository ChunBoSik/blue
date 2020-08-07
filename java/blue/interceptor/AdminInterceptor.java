package com.spring.blue.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    //세션이 있는지 확인
    HttpSession session = request.getSession();
    int slevel = (Integer) session.getAttribute("slevel");
    System.out.println("slevel=" + slevel);
//    if(slevel==0) {
//      return false;
//    }
//    else 
    if(slevel != 0 ) {
      response.sendRedirect(request.getContextPath()+"/msg/notAdmin");
      return false;
    }
    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    super.postHandle(request, response, handler, modelAndView);
  }

  
}
