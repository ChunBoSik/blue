package com.spring.blue;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MsgController {
  @RequestMapping(value="/msg/{flag}", method=RequestMethod.GET)
  public String msgGet(@PathVariable String flag, Model model, HttpSession session) {
    String snickname = session.getAttribute("snickname")==null ? "" : session.getAttribute("snickname").toString();
    String strlevel = session.getAttribute("strlevel")==null ? "" : session.getAttribute("strlevel").toString();
    
    if(flag.equals("gInputOk")) {
      model.addAttribute("msg", "방문소감이 입력되었습니다.");
      model.addAttribute("url", "/guest/gList");
    }
    else if(flag.equals("gDelOk")) {
      model.addAttribute("msg", "게시글이 삭제되었습니다.");
      model.addAttribute("url", "/guest/gList");
    }
    else if(flag.equals("gSelectDelOk")) {
      model.addAttribute("msg", "선택된 게시글이 삭제되었습니다.");
      model.addAttribute("url", "/guest/gList");
    }
    else if(flag.equals("mInputOk")) {
      model.addAttribute("msg", "회원에 가입되었습니다.");
      model.addAttribute("url", "/member/mLogin");
    }
    else if(flag.equals("mInputNo")) {
      model.addAttribute("msg", "아이디/닉네임이 중복이라 가입하실수 없습니다.");
      model.addAttribute("url", "/member/mInput");
    }
    else if(flag.equals("mLoginOk")) {
      model.addAttribute("msg", snickname+"님("+strlevel+") 로그인 되었습니다.");
      model.addAttribute("url", "/");
    }
    else if(flag.equals("mLoginNo")) {
      model.addAttribute("msg", "로그인 실패!!!");
      model.addAttribute("url", "/member/mLogin");
    }
    else if(flag.equals("mLogout")) {
      session.invalidate();
      model.addAttribute("msg", snickname+"님 로그아웃 되었습니다.");
      model.addAttribute("url", "/");
    }
    else if(flag.equals("mDeleteOk")) {
      session.invalidate();
      model.addAttribute("msg", snickname+"님 탈퇴처리 되었습니다.");
      model.addAttribute("url", "/");
    }
    else if(flag.equals("delOkCheck")) {
      model.addAttribute("msg", "회원명단에서 삭제처리 되었습니다.");
      model.addAttribute("url", "/member/mList");
    }
    else if(flag.equals("mSelectDelOk")) {
      model.addAttribute("msg", "선택한 회원이 명단에서 삭제처리 되었습니다.");
      model.addAttribute("url", "/member/mList");
    }
    else if(flag.equals("mUpdateNickNo")) {
      model.addAttribute("msg", "같은 닉네임이 존재하기에 회원정보수정이 되지 않았습니다.");
      model.addAttribute("url", "/member/mUpdate");
    }
    else if(flag.equals("mUpdatePassNo")) {
      model.addAttribute("msg", "비밀번호가 틀리기에 회원정보수정이 되지 않았습니다.");
      model.addAttribute("url", "/member/mUpdate");
    }
    else if(flag.equals("mUpdateOk")) {
      model.addAttribute("msg", "회원 정보가 수정 되었습니다.");
      model.addAttribute("url", "/member/mUpdate");
    }
    else if(flag.equals("bInputOk")) {
      model.addAttribute("msg", "게시글이 저장 되었습니다.");
      model.addAttribute("url", "/board/bList");
    }
    else if(flag.equals("imgDeleteOk")) {
      model.addAttribute("msg", "ckeditor 임시 그림파일(images폴더)이 삭제되었습니다.");
      model.addAttribute("url", "/admin/file/fList");
    }
    else if(flag.equals("bDeleteOk")) {
      model.addAttribute("msg", "게시글이 삭제 되었습니다.");
      model.addAttribute("url", "/board/bList");
    }
    else if(flag.equals("pInputOk")) {
      model.addAttribute("msg", "자료실에 자료가 등록 되었습니다.");
      model.addAttribute("url", "/pds/pList");
    }
    
    
    
    // 아래는 특정 매개변수가 추가로 넘어오는루틴들....
    //else if(flag.equals("levelCheckOk")) {
    else if(flag.substring(0,9).equals("bDeleteNo")) {
      System.out.println("dddd: " + flag.substring(10));
      model.addAttribute("msg", "게시글의 비밀번호가 틀립니다.");
      model.addAttribute("url", "board/bContent?"+flag.substring(10));
    }
    else if(flag.substring(0,12).equals("levelCheckOk")) {
      model.addAttribute("msg", "회원 등급이 수정 되었습니다.");
      //model.addAttribute("url", "admin/amList");
      model.addAttribute("url", "admin/amList?"+flag.substring(13));
    }
    
    return "include/msg";
  }
}
