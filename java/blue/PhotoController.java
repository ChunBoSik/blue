package com.spring.blue;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.service.PhotoService;
import com.spring.blue.vo.PhotoGalleryVo;
import com.spring.blue.vo.PhotoTitleVo;

@Controller
@RequestMapping("/photo")
public class PhotoController {
  String flag;
  
  @Autowired
  PhotoService photoService;
  
  @RequestMapping(value="/photoList", method=RequestMethod.GET)
  public String photoListGet(Model model, PhotoTitleVo ptVo, Criteria cri, String part) {
    part = part==null ? "" : part;
    PageMaker pageMaker = photoService.getPageMaker(cri, 3, part);
    ArrayList<PhotoTitleVo> ptVos = photoService.photoTitleList(cri, part);
    
    model.addAttribute("vos", ptVos);
    model.addAttribute("part", part);
    model.addAttribute("cri", cri);
    model.addAttribute("pageMaker", pageMaker);
    
    return "photo/photoList";
  }
  @RequestMapping(value="/photoArray", method=RequestMethod.GET)
  public String photoArrayGet(Model model, PhotoTitleVo ptVo, Criteria cri, String part) {
    part = part==null ? "" : part;
    PageMaker pageMaker = photoService.getPageMaker(cri, 3, part);
    ArrayList<PhotoTitleVo> ptVos = photoService.photoTitleList(cri, part);
    
    model.addAttribute("vos", ptVos);
    model.addAttribute("part", part);
    model.addAttribute("cri", cri);
    model.addAttribute("pageMaker", pageMaker);
    
    return "photo/photoArray";
  }
  @RequestMapping(value="/photoThumbnail", method=RequestMethod.GET)
  public String photoThumbnailGet(Model model, PhotoTitleVo ptVo, Criteria cri, String part) {
    part = part==null ? "" : part;
    PageMaker pageMaker = photoService.getPageMaker(cri, 3, part);
    ArrayList<PhotoTitleVo> ptVos = photoService.photoTitleThumbList(cri, part);
    
    model.addAttribute("vos", ptVos);
    model.addAttribute("part", part);
    model.addAttribute("cri", cri);
    model.addAttribute("pageMaker", pageMaker);
    
    return "photo/photoThumbnail";
  }
  
  @RequestMapping(value="/photoInput", method=RequestMethod.GET)
  public String photoInputGet() {
    return "photo/photoInput";
  }
  
  @RequestMapping(value="/photoInput", method=RequestMethod.POST)
  public String photoInputPost(PhotoTitleVo ptVo) {
    // 썸네일 처리하기
    if(ptVo.getContent().indexOf("src=\"") == -1) {
      flag = "photoInputNo";
      return "redirect:/msg/" + flag;
    }
    int position = 27;
    String nextImg = ptVo.getContent().substring(ptVo.getContent().indexOf("src=\"")+position);
    String thumbnail = nextImg.substring(0, nextImg.indexOf("\""));
    ptVo.setThumbnail(thumbnail);
    
    photoService.photoTitleInput(ptVo);  // 갤러리 목록집에 초기 정보만 저장
    
    int idx = photoService.getPhotoTitleIdx(); // 방금 저장된 photoTitle의 고유 idx값 구해오기
    
    PhotoGalleryVo pgVo = new PhotoGalleryVo();
    pgVo.setPhotoIdx(idx);
    pgVo.setRfname(thumbnail);
    
    photoService.photoGalleryInput(pgVo);  // 첫번째 썸네일 그림 자료를 photoGallery에저장
    
    boolean sw = true;
    
    while(sw) {
      if(nextImg.indexOf("src=\"") == -1) {
        sw = false;
      }
      else {
        nextImg = nextImg.substring(nextImg.indexOf("src=\"")+position);
        thumbnail = nextImg.substring(0, nextImg.indexOf("\""));
        pgVo.setRfname(thumbnail);
        
        photoService.photoGalleryInput(pgVo);
      }
    }
    
    flag = "photoInputOk";
    return "redirect:/msg/" + flag;
  }
  
  @ResponseBody
  @RequestMapping("/photoUpload")
  public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
    // http header 설정
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    
    // 업로드할 파일이름 처리(fileName)
    String fileName=upload.getOriginalFilename();
    
    // 파일 중복을 피하기위해, 파일명을 날짜와 시간의 결합으로 만들어준다.
    Date date = new Date();
    SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
    fileName = imsi.format(date)+"_"+fileName;
    byte[] bytes = upload.getBytes();
    
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/photo/";
    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));

    outStr.write(bytes);  // 실제로 서버에 저장됨
    
    String callback=request.getParameter("CKEditorFuncNum");
    PrintWriter out=response.getWriter();
    String fileUrl=request.getContextPath()+"/resources/photo/"+fileName;

    out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
    
    out.flush();  //스트림 닫기
    outStr.close();
  }
  
  @RequestMapping(value="/photoContent", method=RequestMethod.GET)
  public String photoContentGet(Model model, int idx, Criteria cri, String backPart) {
    PhotoTitleVo ptVo = photoService.photoTitleInfor(idx); // 사진그룹 정보
    ArrayList<PhotoGalleryVo> pgVos = photoService.photoGalleryInfor(idx);
    
    model.addAttribute("pgVos", pgVos);
    model.addAttribute("ptVo", ptVo);
    model.addAttribute("backPart", backPart);
    model.addAttribute("cri", cri);
    
    return "photo/photoContent";
  }
  
  @RequestMapping(value="/photoUpd", method=RequestMethod.GET)
  public String photoUpdGet(Model model, int idx, Criteria cri, String backPart) {
    PhotoTitleVo ptVo = photoService.photoTitleInfor(idx); // 사진그룹 정보
    
    model.addAttribute("ptVo", ptVo);
    model.addAttribute("backPart", backPart);
    model.addAttribute("cri", cri);
    return "photo/photoUpd";
  }
  
  @RequestMapping(value="/photoUpd", method=RequestMethod.POST)
  public String photoUpdPost(PhotoTitleVo ptVo, int idx, Criteria cri, String backPart) throws UnsupportedEncodingException {
    // 그림파일이 없으면 수정처리 불가
    if(ptVo.getContent().indexOf("src=\"") == -1) {
      flag = "photoUpdNo$idx="+idx+"&page="+cri.getPage()+"&backPart="+java.net.URLEncoder.encode(backPart,"UTF-8"); //한글매개변수 값 전송시는 encoding한다.
      return "redirect:/msg/" + flag;
    }

    // 원본 photoTitle테이블의 자료를 읽어와서 수정자료의 content와 비교한다.
    PhotoTitleVo ptoVo = photoService.photoTitleInfor(idx);
    if(!ptoVo.getContent().equals(ptVo.getContent())) { // 내용이 변경되었을경우만 수정처리한다.
      ArrayList<PhotoGalleryVo> pgVos = photoService.photoGalleryInfor(idx);
      for(PhotoGalleryVo vo : pgVos) {
        if(ptVo.getContent().indexOf(vo.getRfname()) == -1) {
          photoService.photoGalleryDelFile(vo.getRfname());
        }
      }
    }
    else {  // 포토갤러리의 내용을 하나도 수정하지 않알을 경우는 바로 돌려보낸다.
      flag = "photoUpdReset$idx="+idx+"&page="+cri.getPage()+"&backPart="+java.net.URLEncoder.encode(backPart,"UTF-8");
      return "redirect:/msg/" + flag;
    }
    
    // DB작업
    // photoGallery테이블의 photoIdx 정보를 삭제한다.
    photoService.photoGalleryDel(ptVo.getIdx());
    
    // 새롭게 사진 작업처리(즉, 썸네일 자료부터 다시 올릴 준비를 한다. 즉, photoInput작업을 재시행하는것과 같다.)
    // 썸네일 처리하기(photoInput메소드 내용 복사후 필요한 부분만 수정처리)
    int position = 27;
    String nextImg = ptVo.getContent().substring(ptVo.getContent().indexOf("src=\"")+position);
    String thumbnail = nextImg.substring(0, nextImg.indexOf("\""));
    ptVo.setThumbnail(thumbnail);
    
    PhotoGalleryVo pgVo = new PhotoGalleryVo();
    pgVo.setPhotoIdx(idx);
    pgVo.setRfname(thumbnail);
    
    photoService.photoGalleryInput(pgVo);  // 첫번째 썸네일 그림 자료를 photoGallery에저장
    
    boolean sw = true;
    
    while(sw) {
      if(nextImg.indexOf("src=\"") == -1) {
        sw = false;
      }
      else {
        nextImg = nextImg.substring(nextImg.indexOf("src=\"")+position);
        thumbnail = nextImg.substring(0, nextImg.indexOf("\""));
        pgVo.setRfname(thumbnail);
        
        photoService.photoGalleryInput(pgVo);
      }
    }
    
    photoService.photoTitleUpd(ptVo);
    
    flag = "photoUpdOk$idx="+idx+"&page="+cri.getPage()+"&backPart="+java.net.URLEncoder.encode(backPart,"UTF-8");
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/photoDel", method=RequestMethod.GET)
  public String photoDelGet(int idx) {
    photoService.photoDel(idx);
    
    flag = "photoDelOk";
    return "redirect:/msg/" + flag;
  }
}