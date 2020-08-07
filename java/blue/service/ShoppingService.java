package com.spring.blue.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.vo.CartVo;
import com.spring.blue.vo.CategoryVo;
import com.spring.blue.vo.DivisionVo;
import com.spring.blue.vo.OrderlistVo;
import com.spring.blue.vo.ReviewVo;
import com.spring.blue.vo.SectionVo;

public interface ShoppingService {

  public ArrayList<SectionVo> getProductSearch(String searchString);

  public String[] getCateName();

  public ArrayList<String> getdiviName(String selectCate);

  public void productInput(SectionVo vo, MultipartFile file);

  public ArrayList<SectionVo> getList(String selectState);

  public ArrayList<String> getIndiNameList(String sectname);

  public String[] getSectname();

  public ArrayList<CategoryVo> getCategoryList();
  
  public String[] checkCategory(CategoryVo vo);

  public void inputCategory(CategoryVo vo);

  public void deleteCategory(String category);

  public ArrayList<DivisionVo> getdivisionVo(String catename);

  public void deleteDivision(String divicode, String catename);

  public String[] checkDivision(DivisionVo vo);

  public void inputDivision(DivisionVo vo);

  public ArrayList<SectionVo> getShoppingList(String categoryname);

  public SectionVo getContent(int idx);

  public ArrayList<SectionVo> getRelList(String sectname);

  public int getProductIdx(String product);

  public CartVo checkCart(CartVo vo);

  public void updateCart(CartVo vo, int chkIdx);

  public void cartInput(CartVo vo);

  public ArrayList<CartVo> getCartList(String nickname);

  public String getProduct(String productIdx);

  public String getRfname(String product);

  public void updateNumber(String idx, String optionNum);

  public void cartDel(int idx);

  public CartVo getCartListIdx(int idx);

  public void updateSalenum(String product, int quantity);

  public void deleteCart(String nickname, int productIdx, String optionIdx);

  public void orderlistInput(OrderlistVo orderlistVo);

  public int countOrderState(String nickname, String orderstate);

  public ArrayList<OrderlistVo> mypageOrderList(String receiveflag, String nickname);

  public ArrayList<OrderlistVo> getOrderFromToDate(String nickname, String fromDate, String toDate);

  public OrderlistVo getOrderList(int idx);

  public ArrayList<ReviewVo> getReviewCheck(int productIdx, int orderIdx);

  public int getJoinday();

  public int getShoppingCnt();

  public int getBoardCnt();

  public int getGuestCnt();

  public int getPdsCnt();

  public ArrayList<OrderlistVo> orderlistState(String selectState);

  public OrderlistVo oneOrderList(int idx);

  public void updateOrderstate(int idx, String state);

  public void reviewInput(ReviewVo vo);

}
