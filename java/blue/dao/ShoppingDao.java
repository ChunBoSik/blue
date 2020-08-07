package com.spring.blue.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.vo.CartVo;
import com.spring.blue.vo.CategoryVo;
import com.spring.blue.vo.DivisionVo;
import com.spring.blue.vo.OrderlistVo;
import com.spring.blue.vo.ReviewVo;
import com.spring.blue.vo.SectionVo;

public interface ShoppingDao {

  public ArrayList<SectionVo> getProductSearch(@Param("searchString") String searchString);

  public String[] getCateName();

  public ArrayList<String> getdiviName(@Param("selectCate") String selectCate);

  public void productInput(@Param("vo") SectionVo vo);

  public ArrayList<SectionVo> getList(@Param("selectState") String selectState);

  public ArrayList<String> getIndiNameList(@Param("sectname") String sectname);

  public String[] getSectname();

  public ArrayList<CategoryVo> getCategoryList();
  
  public String[] checkCategory(@Param("vo") CategoryVo vo);

  public void inputCategory(@Param("vo") CategoryVo vo);

  public void deleteCategory(@Param("catecode") String catecode);

  public ArrayList<DivisionVo> getdivisionVo(@Param("catename") String catename);

  public void deleteDivision(@Param("divicode") String divicode, @Param("catename") String catename);

  public String[] checkDivision(@Param("vo") DivisionVo vo);

  public void inputDivision(@Param("vo") DivisionVo vo);

  public ArrayList<SectionVo> getShoppingList(@Param("categoryname") String categoryname);

  public SectionVo getContent(@Param("idx") int idx);

  public ArrayList<SectionVo> getRelList(@Param("sectname") String sectname);

  public int getProductIdx(@Param("product") String product);

  public CartVo checkCart(@Param("vo") CartVo vo);

  public void updateCart(@Param("vo") CartVo vo, @Param("chkIdx") int chkIdx);

  public void cartInput(@Param("vo") CartVo vo);

  public ArrayList<CartVo> getCartList(@Param("nickname") String nickname);

  public String getProduct(@Param("productIdx") String productIdx);

  public String getRfname(@Param("product") String product);

  public void updateNumber(@Param("idx") String idx, @Param("optionNum") String optionNum);

  public void cartDel(@Param("idx") int idx);

  public CartVo getCartListIdx(@Param("idx") int idx);

  public void updateSalenum(@Param("product") String product, @Param("quantity") int quantity);

  public void deleteCart(@Param("nickname") String nickname, @Param("productIdx") int productIdx, @Param("optionIdx") String optionIdx);

  public void orderlistInput(@Param("orderlistVo") OrderlistVo orderlistVo);

  public int countOrderState(@Param("nickname") String nickname, @Param("orderstate") String orderstate);

  public ArrayList<OrderlistVo> mypageOrderList(@Param("receiveflag") String receiveflag, @Param("nickname") String nickname);

  public ArrayList<OrderlistVo> getOrderFromToDate(@Param("nickname") String nickname, @Param("fromDate") String fromDate, @Param("toDate") String toDate);

  public OrderlistVo getOrderList(@Param("idx") int idx);

  public ArrayList<ReviewVo> getReviewCheck(@Param("productIdx") int productIdx, @Param("orderIdx") int orderIdx);

  public int getJoinday();

  public int getShoppingCnt();

  public int getBoardCnt();

  public int getGuestCnt();

  public int getPdsCnt();

  public ArrayList<OrderlistVo> orderlistState(@Param("selectState") String selectState);

  public OrderlistVo oneOrderList(@Param("idx") int idx);

  public void updateOrderstate(@Param("idx") int idx, @Param("state") String state);

  public void reviewInput(@Param("vo") ReviewVo vo);

}
