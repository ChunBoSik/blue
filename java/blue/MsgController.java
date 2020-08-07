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
    else if(flag.equals("pDownNo")) {
      model.addAttribute("msg", "해당파일이 존재하지 않습니다.");
      model.addAttribute("url", "/pds/pList");
    }
    else if(flag.equals("photoInputOk")) {
      model.addAttribute("msg", "포토갤러리에 자료가 올려졌습니다.");
      model.addAttribute("url", "/photo/photoList");
    }
    else if(flag.equals("photoInputNo")) {
      model.addAttribute("msg", "포토갤러리에 사진이 없습니다.");
      model.addAttribute("url", "/photo/photoInput");
    }
    else if(flag.equals("photoDelOk")) {
      model.addAttribute("msg", "포토갤러리의 사진 내역이 삭제 되었습니다.");
      model.addAttribute("url", "/photo/photoList");
    }
    else if(flag.equals("mailSendOk")) {
      model.addAttribute("msg", "성공적으로 메일이 발송되었습니다.");
      model.addAttribute("url", "/mail/mailForm");
    }
//    else if(flag.equals("setContentOk")) {
//      model.addAttribute("msg", "스케줄이 등록되었습니다.");
//      model.addAttribute("url", "/schedule/calendar");
//    }
    else if(flag.equals("notAdmin")) {
      model.addAttribute("msg", "관리자만 접근이 가능한 페이지입니다!");
      model.addAttribute("url", "member/mLogin");
    }
    else if(flag.equals("notLogin")) {
      model.addAttribute("msg", "회원만 이용 가능합니다. 로그인 해주세요!");
      model.addAttribute("url", "member/mLogin");
    }
    else if(flag.equals("scheduleDelOk")) {
      model.addAttribute("msg", "선택한 일정이 삭제되었습니다.");
      model.addAttribute("url", "/schedule/calendar");
    }
    else if(flag.equals("productNo")) {
      model.addAttribute("msg", "장바구니에 구매하신 물품이 없습니다.");
      model.addAttribute("url", "study/shopping/product");
    }
    else if(flag.equals("orderReset")) {
      model.addAttribute("msg", "주문이 취소 되었습니다.");
      model.addAttribute("url", "study/shopping/product");
    }
    else if(flag.equals("paymentOk")) {
      model.addAttribute("msg", "결제가 완료 되었습니다.\\n구매상품은 '주문조회'에서 확인하세요!");
      model.addAttribute("url", "study/shopping/product");
    }
    else if(flag.equals("adminProductInputOk")) {
      model.addAttribute("msg", "물품이 등록되지 않았습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product/productList");
    }
    else if(flag.equals("adminProductInputNo")) {
      model.addAttribute("msg", "물품이 등록되지 않았습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product/productInput");
    }
    else if(flag.equals("productInputOk")) {
      model.addAttribute("msg", "상품이 등록되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/productList");
    }
    else if(flag.equals("optionInput")) {
      model.addAttribute("msg", "상품옵션이 등록되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/productList");
    }
    else if(flag.equals("inputCategory")) {
      model.addAttribute("msg", "대분류가 등록되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/category");
    }
    else if(flag.equals("deleteCategory")) {
      model.addAttribute("msg", "대분류가 삭제되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/category");
    }
    else if(flag.equals("inputCategoryFail")) {
      model.addAttribute("msg", "대분류코드 또는 대분류이름은 중복될 수 없습니다. 다시 등록하세요.");
      model.addAttribute("url", "shopping/admin/shopping/product2/category");
    }
    else if(flag.equals("deleteDivision")) {
      model.addAttribute("msg", "중분류가 삭제되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/division");
    }
    else if(flag.equals("inputDivision")) {
      model.addAttribute("msg", "중분류가 등록되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/division");
    }
    else if(flag.equals("inputDivisionFail")) {
      model.addAttribute("msg", "중분류코드 또는 중분류이름은 중복될 수 없습니다. 다시 등록하세요.");
      model.addAttribute("url", "shopping/admin/shopping/product2/division");
    }
    else if(flag.equals("orderDone")) {
      model.addAttribute("msg", "주문이 완료되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/recentorder");
    }
    else if(flag.equals("orderStateUpdate")) {
      model.addAttribute("msg", "주문상태가 변경되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/orderList");
    }
    else if(flag.equals("allStateUpdate")) {
      model.addAttribute("msg", "주문상태가 일괄변경되었습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/orderList");
    }
    
    
    
    // 아래는 특정 매개변수가 추가로 넘어오는루틴들....
    //else if(flag.equals("levelCheckOk")) {
    else if(flag.substring(0,9).equals("bDeleteNo")) {
      model.addAttribute("msg", "게시글의 비밀번호가 틀립니다.");
      model.addAttribute("url", "board/bContent?"+flag.substring(10));
    }
    else if(flag.substring(0,9).equals("porductOk")) {
      model.addAttribute("msg", "구매품목("+flag.substring(10)+")이 장바구니에 담겼습니다.");
      model.addAttribute("url", "study/shopping/cart");
    }
    else if(flag.substring(0,10).equals("photoUpdOk")) {
      model.addAttribute("msg", "갤러리의 내용이 수정되었습니다.");
      model.addAttribute("url", "photo/photoContent?"+flag.substring(11));
    }
    else if(flag.substring(0,10).equals("photoUpdNo")) {
      model.addAttribute("msg", "포토갤러리에 한장 이상의 사진이 필요합니다.");
      model.addAttribute("url", "photo/photoUpd?"+flag.substring(11));
    }
    else if(flag.substring(0,13).equals("photoUpdReset")) {
      model.addAttribute("msg", "포토갤러리에 수정된 내역이 없습니다.");
      model.addAttribute("url", "photo/photoUpd?"+flag.substring(14));
    }
    else if(flag.substring(0,12).equals("levelCheckOk")) {
      model.addAttribute("msg", "회원 등급이 수정 되었습니다.");
      model.addAttribute("url", "admin/amList?"+flag.substring(13));
    }
    else if(flag.substring(0,12).equals("setContentOk")) {
      model.addAttribute("msg", "스케줄이 등록되었습니다.");
      model.addAttribute("url", "schedule/calendar?"+flag.substring(13));
    }
    else if(flag.substring(0, 9).equals("cartInput")) {
      model.addAttribute("msg", "상품이 장바구니에 담겼습니다.");
      model.addAttribute("url", "shopping/admin/shopping/product2/mContent?"+flag.substring(10));
    }
    else if(flag.substring(0, 11).equals("reviewInput")) {
      model.addAttribute("msg", "리뷰 감사합니다. 50P가 적립되었습니다!^^");
      model.addAttribute("url", "shopping/admin/shopping/product2/myorder?"+flag.substring(12));
    }
    
    return "include/msg";
  }
}
