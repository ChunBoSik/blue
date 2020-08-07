package com.spring.blue.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HomeInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    // 컨트롤러 수행전에 처리할 내용을 기술한다.
    ///System.out.println("이곳은 홈 컨트롤러를 진입하기 전 입니다.");
    
    //세션이 있는지 확인
    HttpSession session = request.getSession();
    Object snick = session.getAttribute("snickname");
    if(snick == null) {
      response.sendRedirect(request.getContextPath()+"/msg/notLogin");
      return false;
    }
    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // 컨트롤러 수행후에 처리할 내용을 기술한다.
    //System.out.println("이곳은 홈 컨트롤러를 진입후 입니다.");
  }

}
