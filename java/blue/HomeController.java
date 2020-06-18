package com.spring.blue;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/","/home","/home.do"}, method = RequestMethod.GET)
	public String home(Model model) {
		return "main/home";
	}
	
	@ResponseBody
	@RequestMapping("/imageUpload")
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
	  
	  //String uploadPath = "D:\\JAVA_WEB\\springframework\\works\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\blue\\resources\\ckeditor\\images\\";
	  String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/ckeditor/images/";
    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));

    outStr.write(bytes);  // 실제로 서버에 저장됨
    
    String callback=request.getParameter("CKEditorFuncNum");
    PrintWriter out=response.getWriter();
    String fileUrl=request.getContextPath()+"/resources/ckeditor/images/"+fileName;

    out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
    
    out.flush();  //스트림 닫기
    outStr.close();
	}
	
}
