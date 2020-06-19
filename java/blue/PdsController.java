package com.spring.blue;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.service.PdsService;
import com.spring.blue.vo.PdsVo;

@Controller
@RequestMapping("/pds")
public class PdsController {
  String flag;
  
  @Autowired
  PdsService pdsService;
  
  @RequestMapping(value="/pList", method=RequestMethod.GET)
  public String pListGet(Model model, Criteria cri, String part) {
    part = part==null ? "" : part;
    
    // 페이징 처리를 위한 준비
    PageMaker pageMaker = pdsService.getPageMaker(cri, 3, part);
    
    // 자료실 자료 가져오기
    ArrayList<PdsVo> vos = pdsService.pList(cri, part);
    
    model.addAttribute("vos", vos);
    model.addAttribute("part", part);
    model.addAttribute("cri", cri);
    model.addAttribute("pageMaker", pageMaker);
    
    return "pds/pList";
  }
  
  @RequestMapping(value="/pInput", method=RequestMethod.GET)
  public String pInputGet() {
    return "pds/pInput";
  }
  
  @RequestMapping(value="/pInput", method=RequestMethod.POST)
  public String pInputPost(MultipartFile file, PdsVo vo) {
    pdsService.upLoad(file, vo);
    
    flag = "pInputOk";
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/pContent", method=RequestMethod.GET)
  public String pContentGet(Model model, int idx) {
    PdsVo vo = pdsService.pContent(idx);
    model.addAttribute("vo", vo);
    return "pds/pContent";
  }
  
  @RequestMapping(value="/pDown", method=RequestMethod.GET)
  public String pDownGet(HttpServletRequest request, PdsVo vo) throws IOException {
    String dir = request.getSession().getServletContext().getRealPath("/")+"/resources/pds/"+vo.getRfname();
    File delFile = new File(dir);
    
    if(vo.getRfname().equals("") || !delFile.exists()) {
      flag = "pDownNo";
      return "redirect:/msg/" + flag;
    }
    else {
      pdsService.pDown(vo);
      return "redirect:/pds/downAction?file="+java.net.URLEncoder.encode(vo.getFname(),"UTF-8");
    }
  }
  
  // 서버에 저장된 파일을 클라이언트로 다운처리하는 메소드
  @RequestMapping(value="/downAction", method=RequestMethod.GET)
  public void downActionGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String fileName = request.getParameter("file");
    String dir = request.getSession().getServletContext().getRealPath("/")+"/resources/pds/imsi/";
    
    File file = new File(dir + "/" + fileName);
    
    String downName = null; // 실제로 다운로드 받을 코드타입을 저장할 이름.
    if(request.getHeader("user-agent").indexOf("MSIE") == -1) { //브라우저가 익스플로러가 아닐경우 처리.
      downName = new String(fileName.getBytes("UTF-8"), "8859_1");
    }
    else {
      downName = new String(fileName.getBytes("EUC-KR"),"8859_1");
    }

    // 다운로드할 파일명과 파일형식을 헤더파일에 담아서 전송한다.
    response.setHeader("Content-Disposition", "attachment;filename="+downName);
    
    // 전송할 파일을 fileInputStream변수에 담아서 servletOutputStream을 이용해서 전송한다.
    FileInputStream fileInputStream = new FileInputStream(file);
    ServletOutputStream servletOutputStream = response.getOutputStream();
    
    // 아래는 실제파일을 1024Byte단위씩 끈어서 전송시켜주는 루틴
    byte bt[] = new byte[1024];
    int data = 0;
    
    while((data = (fileInputStream.read(bt, 0, bt.length))) != -1) {
      servletOutputStream.write(bt, 0, data);
    }
    
    servletOutputStream.flush();  // 1024단위로 보내고 마지막 남은 바이트를 전송.
    
    servletOutputStream.close(); // 사용한 객체를 모두 반환
    fileInputStream.close();
    
    System.out.println(fileName + " 파일 다운로드 완료!!!");
  }
}
