package com.spring.blue.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.dao.PdsDao;
import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.PdsVo;

@Service
public class PdsServiceImp implements PdsService {
  @Autowired
  PdsDao pdsDao;

  @Override
  public ArrayList<PdsVo> pList(Criteria cri, String part) {
    return pdsDao.pList(cri, part);
  }

  @Override
  public void upLoad(MultipartFile file, PdsVo vo) {
    String saveFileName = "";
    
    try {
      //파일정보
      String oFileName = file.getOriginalFilename(); // 윈도우에서 업로드 시킨 파일명
      String oFileExt = oFileName.substring(oFileName.lastIndexOf(".")+1);
      String preFileName = oFileName.substring(0,oFileName.lastIndexOf("."));
      
      // 서버에 저장시킬 파일명(파일명과 날짜의 결합으로 파일명의 중복을 방지한다.)
      saveFileName = saveFileName(preFileName, oFileExt);
      
      // 실제로 서버에 파일을 저장시킨다.(파일 저장 메소드 이용)
        writeFile(file, saveFileName);
        
      // 서버에 저장된 파일의 정보를 DB에 저장시킨다.
      vo.setFname(oFileName);
      vo.setRfname(saveFileName);
      vo.setFsize((int) file.getSize());
      pdsDao.upLoad(vo);  // DB에 자료 저장시킨다.
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  }

  private boolean writeFile(MultipartFile file, String saveFileName) throws IOException {
    boolean result = false;
    byte[] data = file.getBytes();
    
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\pds\\";
    
    FileOutputStream fos = new FileOutputStream(uploadPath+saveFileName);
    fos.write(data);  // 실제 파일이 서버에 저장
    result = true;
    fos.close();
    
    return result;
  }

  // 파일이름의 중복을 방지하기위해 날짜와의 결합으로 파일명 편집하는 메소드
  private String saveFileName(String preFileName, String oFileExt) {
    String fileName = "";
    
    Calendar calendar = Calendar.getInstance();
    fileName += calendar.get(Calendar.YEAR);
    fileName += calendar.get(Calendar.MONTH);
    fileName += calendar.get(Calendar.DATE);
    fileName += calendar.get(Calendar.HOUR);
    fileName += calendar.get(Calendar.MINUTE);
    fileName += calendar.get(Calendar.SECOND);
    fileName += calendar.get(Calendar.MILLISECOND);
    fileName += "_" + preFileName + "." + oFileExt;
    
    return fileName;
  }

  @Override
  public PageMaker getPageMaker(Criteria cri, int i, String part) {
    int totRecCnt = pdsDao.totRecCnt(part);
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCriteria(cri);
    pageMaker.setBlockSize(i);
    pageMaker.setTotRecCnt(totRecCnt);
    
    return pageMaker;
  }

  @Override
  public PdsVo pContent(int idx) {
    return pdsDao.pContent(idx);
  }

  @Override
  public void pDown(PdsVo vo) {
    pdsDao.pDown(vo.getIdx());  // 다운로드 횟수 증가
    
    // 아래는 파일 다운로드 루틴
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\pds\\";
    
    FileInputStream fis = null;
    FileOutputStream fos = null;
    try {
      fis = new FileInputStream(uploadPath+vo.getRfname());
      fos = new FileOutputStream(uploadPath+"imsi/"+vo.getFname());
      
      byte[] buffer = new byte[1024];
      
      int readCnt = 0;
      while((readCnt=fis.read(buffer)) != -1) {
        fos.write(buffer, 0, readCnt);
      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    } finally { 
      try {
        if(fis != null) fis.close();
        if(fos != null) fos.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
  
}
