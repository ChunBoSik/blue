package com.spring.blue.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blue.dao.BoardDao;
import com.spring.blue.pagination.Criteria;
import com.spring.blue.pagination.PageMaker;
import com.spring.blue.vo.BoardContVo;
import com.spring.blue.vo.BoardVo;
import com.spring.blue.vo.MemberVo;

@Service
public class BoardServiceImp implements BoardService {
  @Autowired
  BoardDao boardDao;

  @Override
  public ArrayList<BoardVo> bList(Criteria cri) {
    return boardDao.bList(cri);
  }

  @Override
  public void bInput(BoardVo vo) {
    boardDao.bInput(vo);
  }

  @Override
  public MemberVo nickCheck(String snickname) {
    return boardDao.nickCheck(snickname);
  }

  @Override
  public PageMaker getPageMaker(Criteria cri, int i) {
    int totRecCnt = boardDao.totRecCnt();
    
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCriteria(cri);
    pageMaker.setBlockSize(i);
    pageMaker.setTotRecCnt(totRecCnt);
    
    return pageMaker;
  }

  @Override
  public BoardVo bContent(int idx) {
    return boardDao.bContent(idx);
  }

  @Override
  public void bReadNum(int idx) {
    boardDao.bReadNum(idx);
  }

  @Override
  public void imgCheck(String content, String uploadPath) {
    if(content.indexOf("src=\"/") == -1) return; //content안에 그림파일이 없으면 아래 내용을 수행하지않고 복귀한다.
    
    int position = 37;
    boolean sw = true;
    
    String nextImg = content.substring(content.indexOf("src=\"/")+position);
    
    while(sw) {
      String imgFile = nextImg.substring(0, nextImg.indexOf("\""));  // 실제 그림파일명 추출
      
      String oriFilePath = uploadPath+imgFile; // 원본파일의 경로+실제파일명
      String copyFilePath = uploadPath+"src/"+imgFile; // 복사될파일의 경로+실제파일명
      
      fileCopyCheck(oriFilePath, copyFilePath);
      
      // nextImg변수안에 또 'src='문구가 있는지 검색하여 있다면 다시 앞의 작업을 반복시킨다.
      if(nextImg.indexOf("src=\"") == -1)
        sw = false;
      else
        nextImg = nextImg.substring(nextImg.indexOf("src=\"/")+position);
      
    }
  }

  
  // 아래는 파일을 'images'폴더에서 'images/src'폴더로 복사하는 루틴
  private void fileCopyCheck(String oriFilePath, String copyFilePath) {
    File oriFile = new File(oriFilePath);
    File copyFile = new File(copyFilePath);
    
    try {
      FileInputStream fis = new FileInputStream(oriFile);
      FileOutputStream fos = new FileOutputStream(copyFile);
      
      byte[] buffer = new byte[1024];
      int readCnt = 0;
      while((readCnt=fis.read(buffer)) != -1) {
        fos.write(buffer, 0, readCnt);
      }
      fos.flush();
      
      fis.close();
      fos.close();
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @Override
  public void bDelete(int idx, String pwd) {
    boardDao.bDelete(idx, pwd);
  }

  @Override
  public int pwdCheck(int idx, String pwd) {
    BoardVo vo = boardDao.pwdCheck(idx, pwd);
    
    if(vo == null) return 0;
    else return 1;
  }

  // 게시글 삭제시 게시글에 저정되어 있는 그림파일 삭제메소드
  @Override
  public void bImgDelete(int idx, String uploadPath) {
    String content = boardDao.contentSearch(idx);
    
    if(content.indexOf("src=\"/") == -1) return; //content안에 그림파일이 없으면 아래 내용을 수행하지않고 복귀한다.
    
    int position = 41;
    boolean sw = true;
    
    String nextImg = content.substring(content.indexOf("src=\"/")+position);
    System.out.println("nextImg=" + nextImg);
    
    while(sw) {
      String imgFile = nextImg.substring(0, nextImg.indexOf("\""));  // 실제 그림파일명 추출
      
      System.out.println("imgFile = " + imgFile);
      
      String delFilePath = uploadPath+imgFile; // 삭제될파일의 경로+실제파일명
      
      fileDeleteCheck(delFilePath);
      
      // nextImg변수안에 또 'src='문구가 있는지 검색하여 있다면 다시 앞의 작업을 반복시킨다.
      if(nextImg.indexOf("src=\"") == -1)
        sw = false;
      else
        nextImg = nextImg.substring(nextImg.indexOf("src=\"/")+position);
      
    }
  }

  // 게시물 삭제시 실제로 파일이 삭제되는 곳.. 
  private void fileDeleteCheck(String delFilePath) {
    System.out.println("delFilePath="+delFilePath);
    File delFile = new File(delFilePath);
    
    if(delFile.exists()) delFile.delete();
  }

  @Override
  public ArrayList<BoardContVo> bContView(int idx) {
    return boardDao.bContView(idx);
  }

  @Override
  public void bContInput(BoardContVo bContVo) {
    boardDao.bContInput(bContVo);
  }

  @Override
  public void replyDel(int idx) {
    boardDao.replyDel(idx);
  }

  // 이전글 검색
  @Override
  public BoardVo getPre(int idx) {
    return boardDao.getPre(idx);
  }

  // 다음글 검색
  @Override
  public BoardVo getNext(int idx) {
    return boardDao.getNext(idx);
  }

}
