package com.spring.blue.service;

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

import com.spring.blue.dao.ShoppingDao;
import com.spring.blue.vo.CartVo;
import com.spring.blue.vo.CategoryVo;
import com.spring.blue.vo.DivisionVo;
import com.spring.blue.vo.OrderlistVo;
import com.spring.blue.vo.ReviewVo;
import com.spring.blue.vo.SectionVo;

@Service
public class ShoppingServiceImp implements ShoppingService {
  @Autowired
  ShoppingDao shoppingDao;
  
  @Override
  public ArrayList<SectionVo> getProductSearch(String searchString) {
    return shoppingDao.getProductSearch(searchString);
  }

  @Override
  public String[] getCateName() {
    return shoppingDao.getCateName();
  }

  @Override
  public ArrayList<String> getdiviName(String selectCate) {
    return shoppingDao.getdiviName(selectCate);
  }

  @Override
  public void productInput(SectionVo vo, MultipartFile file) {
    String saveFileName = ""; 
    
    try {
      // 파일정보
      String originFilename = file.getOriginalFilename(); // 윈도우 에서 업로드시 호출한 파일명
      String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length()); // 확장자 검출
      String prefixFilename = originFilename.substring(0, (originFilename.length()-extName.length())); // 확장자를 제외시킨 파일명
      //Long size = file.getSize(); // 파일 사이즈
      
      // 서버에 저장시킬 파일명(중복배제를 위해서 날짜시간으로 저장...)편집 메소드
      saveFileName = saveFileName(prefixFilename, extName);
      
      // 실제 서버에 저장시킬 메소드
      writeFile(file, saveFileName);
      // url = VAR_PATH + saveFileName;
      
      // DB에 자료를 저장하기위한 준비...
      vo.setFname(originFilename);
      vo.setRfname(saveFileName);
      vo.setFsize(file.getSize());
      shoppingDao.productInput(vo);
    }
    catch (IOException e) {
      throw new RuntimeException(e);
    }
  }
  
  private boolean writeFile(MultipartFile file, String saveFileName) throws IOException {
    boolean result = false;
    byte[] data = file.getBytes();
    
    HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
    String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\upload\\";
    
    FileOutputStream fos = new FileOutputStream(uploadPath+saveFileName);
    fos.write(data);  // 파일 저장...
    result = true;
    fos.close();
    
    return result;
  }
  
  private String saveFileName(String prefixFilename, String extName) {
    String fileName = "";
    
    Calendar calendar = Calendar.getInstance();
    fileName += calendar.get(Calendar.YEAR);
    fileName += calendar.get(Calendar.MONTH);
    fileName += calendar.get(Calendar.DATE);
    fileName += calendar.get(Calendar.HOUR);
    fileName += calendar.get(Calendar.MINUTE);
    fileName += calendar.get(Calendar.SECOND);
    fileName += calendar.get(Calendar.MILLISECOND);
    fileName += "_"+prefixFilename+extName;
    
    return fileName;
  }

  @Override
  public ArrayList<SectionVo> getList(String selectState) {
    return shoppingDao.getList(selectState);
  }

  @Override
  public ArrayList<String> getIndiNameList(String sectname) {
    return shoppingDao.getIndiNameList(sectname);
  }

  @Override
  public String[] getSectname() {
    return shoppingDao.getSectname();
  }

  @Override
  public ArrayList<CategoryVo> getCategoryList() {
    return shoppingDao.getCategoryList();
  }
  
  @Override
  public String[] checkCategory(CategoryVo vo) {
    return shoppingDao.checkCategory(vo);
  }

  @Override
  public void inputCategory(CategoryVo vo) {
    shoppingDao.inputCategory(vo);
  }

  @Override
  public void deleteCategory(String category) {
    shoppingDao.deleteCategory(category);
  }

  @Override
  public ArrayList<DivisionVo> getdivisionVo(String catename) {
    return shoppingDao.getdivisionVo(catename);
  }

  @Override
  public void deleteDivision(String divicode, String catename) {
    shoppingDao.deleteDivision(divicode, catename);
  }

  @Override
  public String[] checkDivision(DivisionVo vo) {
    return shoppingDao.checkDivision(vo);
  }

  @Override
  public void inputDivision(DivisionVo vo) {
    shoppingDao.inputDivision(vo);
  }

  @Override
  public ArrayList<SectionVo> getShoppingList(String categoryname) {
    return shoppingDao.getShoppingList(categoryname);
  }

  @Override
  public SectionVo getContent(int idx) {
    return shoppingDao.getContent(idx);
  }

  @Override
  public ArrayList<SectionVo> getRelList(String sectname) {
    return shoppingDao.getRelList(sectname);
  }

  @Override
  public int getProductIdx(String product) {
    return shoppingDao.getProductIdx(product);
  }

  @Override
  public CartVo checkCart(CartVo vo) {
    return shoppingDao.checkCart(vo);
  }

  @Override
  public void updateCart(CartVo vo, int chkIdx) {
    shoppingDao.updateCart(vo, chkIdx);
  }

  @Override
  public void cartInput(CartVo vo) {
    shoppingDao.cartInput(vo);
  }

  @Override
  public ArrayList<CartVo> getCartList(String nickname) {
    return shoppingDao.getCartList(nickname);
  }

  @Override
  public String getProduct(String productIdx) {
    return shoppingDao.getProduct(productIdx);
  }

  @Override
  public String getRfname(String product) {
    return shoppingDao.getRfname(product);
  }

  @Override
  public void updateNumber(String idx, String optionNum) {
    shoppingDao.updateNumber(idx, optionNum);
  }

  @Override
  public void cartDel(int idx) {
    shoppingDao.cartDel(idx);
  }

  @Override
  public CartVo getCartListIdx(int idx) {
    return shoppingDao.getCartListIdx(idx);
  }

  @Override
  public void updateSalenum(String product, int quantity) {
    shoppingDao.updateSalenum(product, quantity);
  }

  @Override
  public void deleteCart(String nickname, int productIdx, String optionIdx) {
    shoppingDao.deleteCart(nickname, productIdx, optionIdx);
  }

  @Override
  public void orderlistInput(OrderlistVo orderlistVo) {
    shoppingDao.orderlistInput(orderlistVo);
  }

  @Override
  public int countOrderState(String nickname, String orderstate) {
    return shoppingDao.countOrderState(nickname, orderstate);
  }

  @Override
  public ArrayList<OrderlistVo> mypageOrderList(String receiveflag, String nickname) {
    return shoppingDao.mypageOrderList(receiveflag, nickname);
  }

  @Override
  public ArrayList<OrderlistVo> getOrderFromToDate(String nickname, String fromDate, String toDate) {
    return shoppingDao.getOrderFromToDate(nickname, fromDate, toDate);
  }

  @Override
  public OrderlistVo getOrderList(int idx) {
    return shoppingDao.getOrderList(idx);
  }

  @Override
  public ArrayList<ReviewVo> getReviewCheck(int productIdx, int orderIdx) {
    return shoppingDao.getReviewCheck(productIdx, orderIdx);
  }

  @Override
  public int getJoinday() {
    return shoppingDao.getJoinday();
  }

  @Override
  public int getShoppingCnt() {
    return shoppingDao.getShoppingCnt();
  }

  @Override
  public int getBoardCnt() {
    return shoppingDao.getBoardCnt();
  }

  @Override
  public int getGuestCnt() {
    return shoppingDao.getGuestCnt();
  }

  @Override
  public int getPdsCnt() {
    return shoppingDao.getPdsCnt();
  }

  @Override
  public ArrayList<OrderlistVo> orderlistState(String selectState) {
    return shoppingDao.orderlistState(selectState);
  }

  @Override
  public OrderlistVo oneOrderList(int idx) {
    return shoppingDao.oneOrderList(idx);
  }

  @Override
  public void updateOrderstate(int idx, String state) {
    shoppingDao.updateOrderstate(idx, state);
  }

  @Override
  public void reviewInput(ReviewVo vo) {
    shoppingDao.reviewInput(vo);
  }

}
