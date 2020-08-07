package com.spring.blue;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.service.MemberService;
import com.spring.blue.vo.MemberVo;

@Controller
@RequestMapping("/member")
public class MemberController {
  String flag;
  
  @Autowired
  MemberService memberService;
  
  @Autowired
  BCryptPasswordEncoder passwordEncoder;
  
  @RequestMapping(value="/mLogin", method=RequestMethod.GET)
  public String mLoginGet() {
    return "membership/mLogin";
  }

  @RequestMapping(value="/mLogin", method=RequestMethod.POST)
  public String mLoginPost(String mid, String pwd, HttpSession session) {
    MemberVo vo = memberService.mLogin(mid);
    
    if(vo != null && passwordEncoder.matches(pwd, vo.getPwd()) && vo.getUserdel().equals("NO")) {
      String strlevel;
      if(vo.getLevel()==0) strlevel="관리자";
      else if(vo.getLevel()==1) strlevel="특별회원";
      else if(vo.getLevel()==2) strlevel="우수회원";
      else if(vo.getLevel()==3) strlevel="정회원";
      else if(vo.getLevel()==4) strlevel="준회원";
      else strlevel="비회원";
      
      session.setAttribute("smid", vo.getMid());
      session.setAttribute("snickname", vo.getNickname());
      session.setAttribute("slevel", vo.getLevel());
      session.setAttribute("strlevel", strlevel);
      flag = "mLoginOk";
    }
    else {
      flag = "mLoginNo";
    }
    
    return "redirect:/msg/"+flag;
  }
  
  @RequestMapping(value="/mLogout", method=RequestMethod.GET)
  public String mLogoutGet() {
    flag = "mLogout";
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/mInput", method=RequestMethod.GET)
  public String mInputGet() {
    return "membership/mInput";
  }
  
  @RequestMapping(value="/mInput", method=RequestMethod.POST)
  public String mInputPost(MemberVo vo) {
    // 아이디 중복체크
    if(memberService.idCheck(vo.getMid()) != null) {
      flag = "mInputNo";
      return "redirect:/msg/"+flag;
    }
    
    // 닉네임 중복체크
    if(memberService.nickCheck(vo.getNickname()) != null) {
      flag = "mInputNo";
      return "redirect:/msg/"+flag;
    }

    // 아이디와 비밀번호가 중복되지않을때 아래 처리한다.
    // 비밀번호 암호화처리
    String encPwd = passwordEncoder.encode(vo.getPwd());
    vo.setPwd(encPwd);
    
    memberService.mInput(vo);  // DB에 회원자료 저장(신입회원등록)
    
    flag = "mInputOk";
    return "redirect:/msg/"+flag;
  }
  
  // 아이디 중복체크
  @RequestMapping(value="/idCheck", method=RequestMethod.GET)
  @ResponseBody
  public int idCheck(String mid) {
    MemberVo vo = memberService.idCheck(mid);
    
    int result = 0;
    if(vo != null) {  // 아이디가 중복되었을 경우...
      return 1;
    }
    
    return result;
  }
  
  // 닉네임 중복체크
  @RequestMapping(value="/nickCheck", method=RequestMethod.GET)
  @ResponseBody
  public int nickCheckGet(String nickname) {
    MemberVo vo = memberService.nickCheck(nickname);
    
    int result = 0;
    if(vo != null) return 1;
    return result;
  }
  
  @RequestMapping(value="/mList", method=RequestMethod.GET)
  public String mListGet(Model model, Criteria cri) {
    ArrayList<MemberVo> vos = memberService.mList(cri);
    
    PageMaker pageMaker = memberService.getPageMaker(cri, 3);
    
    model.addAttribute("vos", vos);
    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("cri", cri);
    return "membership/mList";
  }
  
  // 관리자가 선택한 회원 강제 탈퇴처리
  @RequestMapping(value="/mList", method=RequestMethod.POST)
  public String mLoginPost(String delItems) {
    String[] idxs = delItems.split("/");
    //int i=0;
    
    for(String idx : idxs) {
      //i++;
      //System.out.println(i + ". idx : " + idx);
      memberService.delOkCheck(Integer.parseInt(idx));
    }
    
    flag = "mSelectDelOk";
    
    return "redirect:/msg/" + flag; 
  }
  
  // 삭제 신청회원 userdel에 'OK'처리
  @RequestMapping(value="/mDelete", method=RequestMethod.GET)
  public String mDeleteGet(HttpSession session) {
    String snickname = (String)session.getAttribute("snickname");
    
    memberService.mDelete(snickname);
    
    flag = "mDeleteOk";
    return "redirect:/msg/" + flag;
  }
  
  // DB에서 회원명단 완전히 삭제처리
  @RequestMapping(value="/delOkCheck", method=RequestMethod.GET)
  public String delOkCheckGet(int idx) {
    memberService.delOkCheck(idx);
    
    flag = "delOkCheck";
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/mUpdate", method=RequestMethod.GET)
  public String mUpdateGet(HttpSession session, MemberVo vo, Model model) {
    String snickname = (String) session.getAttribute("snickname");
    vo = memberService.getUpdateSearch(snickname);
    model.addAttribute("vo", vo);
    
    return "membership/mUpdate";
  }
  
  @RequestMapping(value="/mUpdate", method=RequestMethod.POST)
  public String mUpdatePost(MemberVo vo, String onickname, String opwd, HttpSession session) {
    // 기존 닉네임과 다르면 닉네임을 중복체크한후 같은 닉네임을 사용할시는 수정처리하지 않는다.
    if(!onickname.equals(vo.getNickname())) {
      if(memberService.nickCheck(vo.getNickname()) != null) {
        flag = "mUpdateNickNo";
        return "redirect:/msg/"+flag;
      }
    }
    
    // 비밀번호가 일치하지 않으면 수정처리하지 않는다.
    if(!passwordEncoder.matches(vo.getPwd(), opwd)) {
      flag = "mUpdatePassNo";
      return "redirect:/msg/"+flag;
    }
    
    // 닉네임에도 문제가 없고, 기존 비밀번호와도 일치한다면 수정처리 한다.
    String encPwd = passwordEncoder.encode(vo.getPwd()); // 비밀번호를 다시 암호화 처리
    vo.setPwd(encPwd);
    memberService.mUpdate(vo);
    
    // 정보가 변경되었다면, 닉네임도 변경되었을 가능성이 있기에, 닉네임을 세션닉네임에 다시 셋팅해준다.
    session.setAttribute("snickname", vo.getNickname());
    
    flag = "mUpdateOk";
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/mInfor", method=RequestMethod.GET)
  public String mInforGet(String mid, Model model) {
    MemberVo vo= memberService.idCheck(mid);
    
    String strlevel = "";
    if(vo.getLevel()==0) strlevel="관리자";
    else if(vo.getLevel()==1) strlevel="특별회원";
    else if(vo.getLevel()==2) strlevel="우수회원";
    else if(vo.getLevel()==3) strlevel="정회원";
    else  strlevel="준회원";
    
    vo.setStrlevel(strlevel);
    
    model.addAttribute("vo", vo);
    
    return "membership/mInfor";
  }
}

