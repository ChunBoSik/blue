package com.spring.blue;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.service.BoardService;
import com.spring.blue.vo.BoardContVo;
import com.spring.blue.vo.BoardVo;
import com.spring.blue.vo.MemberVo;

@Controller
@RequestMapping("/board")
public class BoardController {
  String flag;
  
  @Autowired
  BoardService boardService;
  
  @RequestMapping(value="/bList", method=RequestMethod.GET)
  public String bListGet(Model model, Criteria cri) {
    ArrayList<BoardVo> vos = boardService.bList(cri);
    
    PageMaker pageMaker = boardService.getPageMaker(cri, 3);
    
    model.addAttribute("pageMaker", pageMaker);
    model.addAttribute("cri", cri);
    model.addAttribute("vos", vos);
    
    
    return "board/bList";
  }
  
  @RequestMapping(value="/bInput", method=RequestMethod.GET)
  public String bInputGet(Model model, HttpSession session, int page) {
    String snickname = session.getAttribute("snickname").toString();
    MemberVo vo = boardService.nickCheck(snickname);
    
    model.addAttribute("page", page);
    model.addAttribute("email", vo.getEmail());
    model.addAttribute("snickname", snickname);
    
    return "board/bInput";
  }
  
  @RequestMapping(value="bInput", method=RequestMethod.POST)
  public String bInputPost(BoardVo vo) {
    String hostip;  // 접속자 ip얻어오기
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    hostip = request.getRemoteAddr();
    vo.setHostip(hostip);
    
    // 'images'폴더에 저장된 그림파일중 ckeditor에서 실제로 저장시킬 그림파일만 선별하여 '/images/src/'폴더로 복사한다.
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\ckeditor\\images\\";
    boardService.imgCheck(vo.getContent(), uploadPath);
    
    // content필드에는 실제로 저장된 파일의 경로를 변경시켜서 저장해준다. 
    vo.setContent(vo.getContent().replace("/resources/ckeditor/images/", "/resources/ckeditor/images/src/"));
    
    // 잘 정비된 자료를 DB에 저장한다.
    boardService.bInput(vo);
    
    flag = "bInputOk";
    
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/bContent", method=RequestMethod.GET)
  public String bContentGet(int idx, int page, Model model, String contSw) {
    // 글 조회수 증가...
    boardService.bReadNum(idx);
    
    // 글 내용 보기
    BoardVo vo = boardService.bContent(idx);
    
    model.addAttribute("vo", vo);
    model.addAttribute("page", page);
    model.addAttribute("contSw", contSw);
    
    // 해당 게시글의 댓글 가져오기
    contSw = contSw==null ? "" : contSw;
    if(contSw.equals("yes")) {
      ArrayList<BoardContVo> bContVos = boardService.bContView(idx);
      model.addAttribute("bContVos", bContVos);
    }
    
    // 이전글/다음글 처리루틴
    BoardVo preVo = boardService.getPre(idx);   // 이전글 검색
    BoardVo nextVo = boardService.getNext(idx); // 다음글 검색
    
    if(preVo == null) {  // 이전글이 없다.
      model.addAttribute("preVoTitle", "이전글 없음...");
    }
    else {
      model.addAttribute("preVoIdx", preVo.getIdx());
      model.addAttribute("preVoTitle", preVo.getTitle());
    }
    
    if(nextVo != null) {  // 다음글이 있다.
      model.addAttribute("nextVoIdx", nextVo.getIdx());
      model.addAttribute("nextVoTitle", nextVo.getTitle());
    }
    else {
      model.addAttribute("nextVoTitle", "다음글 없음...");
    }
    
    
    return "board/bContent";
  }
  
  // 게시글 내용 삭제시 처리되는 메소드
  @RequestMapping(value="/bContent", method=RequestMethod.POST)
  public String bDeleteGet(BoardVo vo, int page) {
    int res = boardService.pwdCheck(vo.getIdx(), vo.getPwd());
    
    if(res != 1) {
      flag = "bDeleteNo$idx="+vo.getIdx()+"&page="+page;
      return "redirect:/msg/" + flag;
    }
    
    
    // 저장된 파일삭제('images/src'폴더)
    // 'images'폴더에 저장된 그림파일중, 현재 게시글에 포함된 그림파일 삭제
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\ckeditor\\images\\src\\";
    boardService.bImgDelete(vo.getIdx(), uploadPath);
    
    // 실제 그림파일의 삭제가 끝나고 나면, 게시글을 DB에서 삭제처리
    boardService.bDelete(vo.getIdx(), vo.getPwd());
    
    flag = "bDeleteOk";
    return "redirect:/msg/" + flag;
  }
  
  // 댓글 입력처리
  @RequestMapping(value="bContInput", method=RequestMethod.POST)
  public String bContInputGet(BoardContVo bContVo, Model model, int page) {
    String hostip;  // 접속자 ip얻어오기
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    hostip = request.getRemoteAddr();
    bContVo.setHostip(hostip);
    
    boardService.bContInput(bContVo);  // 댓글 저장하기
    
    model.addAttribute("idx", bContVo.getBoard_idx());
    model.addAttribute("page", page);
    
    return "redirect:/board/bContent?contSw=yes";
  }
  
  // 댓글 삭제처리
  @ResponseBody
  @RequestMapping(value="/replyDel", method=RequestMethod.GET)
  public int replyDel(int idx) {
    boardService.replyDel(idx);
    return 1;
  }
}

