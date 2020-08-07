package com.spring.blue;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blue.service.IndividualService;
import com.spring.blue.service.MemberService;
import com.spring.blue.service.ShoppingService;
import com.spring.blue.vo.CartListVo;
import com.spring.blue.vo.CartVo;
import com.spring.blue.vo.CategoryVo;
import com.spring.blue.vo.DivisionVo;
import com.spring.blue.vo.IndividualVo;
import com.spring.blue.vo.MemberVo;
import com.spring.blue.vo.OrderlistVo;
import com.spring.blue.vo.RecentOrderVo;
import com.spring.blue.vo.ReviewVo;
import com.spring.blue.vo.SectionVo;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
  String flag;
  
  @Autowired
  ShoppingService shoppingService;
  
  @Autowired
  IndividualService individualService;
  
  @Autowired
  MemberService memberService;
  
  @RequestMapping(value="/admin/shopping/adminMain", method=RequestMethod.GET)
  public String adminMainGet() {
    return "admin/shopping/adminMain";
  }
  
  @RequestMapping(value="/admin/shopping/left",method=RequestMethod.GET)
  public String shoppingLeftGet() {
    return "admin/shopping/left";
  }
  
  @RequestMapping(value="/admin/shopping/right",method=RequestMethod.GET)
  public String shppingRightGet() {
    return "admin/shopping/right";
  }
  
  @RequestMapping(value="/admin/shopping/productInput", method=RequestMethod.GET)
  public String productGet() {
    return "admin/shopping/product/productInput";
  }
  
  @RequestMapping(value="/admin/shopping/productList", method=RequestMethod.POST)
  public String productPost(HttpSession session, String product) throws UnsupportedEncodingException {
    ArrayList<String> productList = (ArrayList<String>) (session.getAttribute("productList"));
    
    if(session.getAttribute("productList")==null) {
      productList = new ArrayList<String>();
    }
    productList.add(product);
    session.setAttribute("productList", productList);
    
    flag = "adminPorductOk$"+java.net.URLEncoder.encode(product,"UTF-8");
    return "redirect:/msg/" + flag;
  }
  
  @RequestMapping(value="/cart", method=RequestMethod.GET)
  public String cartGet(HttpSession session, Model model) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    if(productList == null || productList.size() == 0) {
      flag = "adminProductNo";
      return "redirect:/msg/" + flag;
    }
    else {
      Collections.sort(productList);  // ArrayList자료 정렬하기
      model.addAttribute("vos", productList);
      return "admin/shopping/product/cart";
    }
  }
  
  @RequestMapping(value="/productAdd", method=RequestMethod.GET)
  public String productAddGet(HttpSession session, String product) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.add(product);
    session.setAttribute("productList", productList);
    
    return "redirect:/shopping/cart";
  }
  
  @RequestMapping(value="/productDel", method=RequestMethod.GET)
  public String productDelGet(HttpSession session, String product) {
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.remove(product);
    
    return "redirect:/shopping/cart";
  }
  
  @RequestMapping(value="/productGroupDel", method=RequestMethod.GET)
  public String productGroupDelGet(HttpSession session, String product) {
    System.out.println("product : " + product);
    ArrayList<String> productArr = new ArrayList<String>();
    productArr.add(product);
    ArrayList<String> productList = (ArrayList) (session.getAttribute("productList"));
    productList.removeAll(productArr);
    
    return "redirect:/shopping/cart";
  }
  
  @RequestMapping(value="/order", method=RequestMethod.GET)
  public String orderGet() {
    return "admin/shopping/product/order";
  }
  
  @RequestMapping(value="/order", method=RequestMethod.POST)
  public String paymentOkGet(HttpSession session) {
    session.removeAttribute("productList");
    
    flag = "paymentOk";
    return "redirect:/msg/" + flag;
  }

  @RequestMapping(value="/orderReset", method=RequestMethod.GET)
  public String orderReset(HttpSession session) {
    session.removeAttribute("productList");
    
    flag = "orderReset";
    return "redirect:/msg/" + flag;
  }
  
  /* 여기서부터 shopping/product2 */
  @RequestMapping(value="/admin/shopping/adminContent", method=RequestMethod.GET)
  public String adminContentGet(HttpSession session, Model model) {
    int slevel = session.getAttribute("slevel").toString()==null ? 5 : Integer.parseInt(session.getAttribute("slevel").toString());
    if(slevel != 0) return "/member/mLogin";
    
    int boardCnt = shoppingService.getBoardCnt();
    int guestCnt = shoppingService.getGuestCnt();
    int joindayCnt = shoppingService.getJoinday();
    int pdsCnt = shoppingService.getPdsCnt();
    int shoppingCnt = shoppingService.getShoppingCnt();
    
    model.addAttribute("boardCnt", boardCnt);
    model.addAttribute("guestCnt", guestCnt);
    model.addAttribute("joindayCnt", joindayCnt);
    model.addAttribute("pdsCnt", pdsCnt);
    model.addAttribute("shoppingCnt", shoppingCnt);
    
    return "admin/shopping/product2/adminContent";
  }

  @RequestMapping(value="/admin/shopping/product2/productList", method=RequestMethod.GET)
  public String productListGet(Model model, String state) {
    //상태별 정렬
    String selectState = state==null ? "" : state;
    model.addAttribute("state", selectState);
    
    ArrayList<SectionVo> vos = shoppingService.getList(selectState);
    model.addAttribute("vos", vos);
    //대분류 목록담기
    String[] catename = shoppingService.getCateName();
    model.addAttribute("catename", catename);
    
    return "admin/shopping/product2/productList";
  }
  
  /* ======================================================================================== */
  
  @RequestMapping(value="/admin/shopping/product2/productList", method=RequestMethod.POST)
  public String productListPost(Model model, String searchString) {
    ArrayList<SectionVo> vos = shoppingService.getProductSearch(searchString);
    model.addAttribute("vos", vos); 
    //대분류 목록담기
    String[] catenames = shoppingService.getCateName();
    model.addAttribute("catename", catenames);
    
    return "admin/shopping/product2/productList";
  }
  
  @RequestMapping(value="/admin/shopping/product2/product", method=RequestMethod.GET)
  public String product2Get(Model model) {
    String[] catename = shoppingService.getCateName();
    model.addAttribute("catename", catename);
    
    return "admin/shopping/product2/product";
  }
  
  @RequestMapping(value="/admin/shopping/product2/product",method=RequestMethod.POST)
  public String productPost(SectionVo vo,MultipartFile file) {
    shoppingService.productInput(vo,file);
    
    return "redirect:/msg/productInputOk";
  }
  
  @RequestMapping(value="/admin/shopping/product2/indiname", method=RequestMethod.POST)
  @ResponseBody
  public Map<Object, Object> indinamePost(@RequestBody String data){
    Map<Object, Object> map = new HashMap<Object, Object>();
    
    ArrayList<String> indiname = shoppingService.getIndiNameList(data);

    map.put("indiname",indiname);
    return map;
  }
  
  @RequestMapping(value="/admin/shopping/product2/diviname", method=RequestMethod.POST)
  @ResponseBody
  public Map<Object, Object> divinamePost(@RequestBody String selectCate){
    Map<Object, Object> map = new HashMap<Object, Object>();
    
    ArrayList<String> diviname = shoppingService.getdiviName(selectCate);
    map.put("diviname",diviname);
    return map;
  }
  
  @RequestMapping(value="/admin/shopping/product2/option",method=RequestMethod.GET)
  public String optionGet(Model model) {
    String[] sectname = shoppingService.getSectname();
    
    model.addAttribute("sectname", sectname);
    return "admin/shopping/product2/option";
  }
  
  @RequestMapping(value="/admin/shopping/product2/option",method=RequestMethod.POST)
  public String optionPost(IndividualVo vo,String[] indiname, int[] price, int[] perprice,int[] quantity, String sectname) {
    for(int i=0;i<indiname.length;i++) {
      vo.setIndiname(indiname[i]);
      vo.setPerprice(perprice[i]);
      vo.setPrice(price[i]);
      vo.setQuantity(quantity[i]);
      vo.setSectname(sectname);
      
      individualService.input(vo);
    }
    
    return "redirect:/msg/optionInput";
  }
  
  @RequestMapping(value="/admin/shopping/product2/category", method=RequestMethod.GET)
  public String categoryGet(Model model) {
    ArrayList<CategoryVo> vos = shoppingService.getCategoryList();
    model.addAttribute("vos", vos);
    
    return "admin/shopping/product2/category";
  }
  
  @RequestMapping(value="/admin/shopping/product2/category", method=RequestMethod.POST)
  public String categoryPost(String[] catecode, String[] catename, CategoryVo vo) {
    for(int i=0;i<catecode.length;i++) {
      vo.setCatecode(catecode[i]);
      vo.setCatename(catename[i]);
      //자료가 중복되는지 확인
      String[] check = shoppingService.checkCategory(vo);
      if(check.length==0) {
        shoppingService.inputCategory(vo);
      }
      else {
        return "redirect:/msg/inputCategoryFail";
      }
      
    }
    return "redirect:/msg/inputCategory";
  }
  
  @RequestMapping(value="/admin/shopping/product2/deleteCategory", method=RequestMethod.POST)
  public String deleteCategoryPost(String[] deletecheck) {
    for(int i=0;i<deletecheck.length;i++) {
      shoppingService.deleteCategory(deletecheck[i]);
    }
    
    return "redirect:/msg/deleteCategory";
  }
  
  @RequestMapping(value="/admin/shopping/product2/division", method=RequestMethod.GET)
  public String divisionGet(Model model) {
    String[] catename = shoppingService.getCateName();
    model.addAttribute("catename", catename);
    
    return "admin/shopping/product2/division";
  }

  @RequestMapping(value="/admin/shopping/product2/getDivisionVo", method=RequestMethod.POST)
  @ResponseBody
  public Map<Object, Object> getDivisionVoPost(@RequestBody String data){
    Map<Object, Object> map = new HashMap<Object, Object>();

    ArrayList<DivisionVo> diviVos = shoppingService.getdivisionVo(data);
    map.put("diviVos",diviVos);
    return map;
  }

  @RequestMapping(value="/admin/shopping/product2/deleteDivision", method=RequestMethod.POST)
  public String deleteDivisionPost(String divicodeAry, String catename) {
    String[] divicode = divicodeAry.split("/");
    for(int i=0;i<divicode.length;i++) {
      shoppingService.deleteDivision(divicode[i],catename);
    }
    
    return "redirect:/msg/deleteDivision";
  }
  
  @RequestMapping(value="/admin/shopping/product2/division", method=RequestMethod.POST)
  public String divisionPost(String[] divicode, String[] diviname, String catename2, DivisionVo vo) {
    for(int i=0;i<divicode.length;i++) {
      vo.setDivicode(divicode[i]);
      vo.setDiviname(diviname[i]);
      vo.setCatename(catename2);
      //기존자료와 divicode가 중복되는지 diviname이 중복되는지 검사함
      String[] check = shoppingService.checkDivision(vo);
      if(check.length==0) {
        shoppingService.inputDivision(vo);
      }
      else {
        return "redirect:/msg/inputDivisionFail";
      }
    }
    return "redirect:/msg/inputDivision";
  }
  
  @RequestMapping(value="/admin/shopping/product2/shoppingList", method=RequestMethod.GET)
  public String shoppingListGet(Model model, String categoryname) {
    categoryname = categoryname == null ? "신 상 품" : categoryname;
    //if(categoryname == "") categoryname = "전체";
    model.addAttribute("categoryname", categoryname);
    
    String[] catename = shoppingService.getCateName();
    model.addAttribute("catename", catename);

    ArrayList<SectionVo> vos = shoppingService.getShoppingList(categoryname);
    model.addAttribute("vos", vos);
    return "admin/shopping/product2/shoppingList";
  }
  
  @RequestMapping(value="/admin/shopping/product2/mContent", method=RequestMethod.GET)
  public String mContentGet(int idx, Model model) {
    //상품정보불러오기    
    SectionVo sectionVo = shoppingService.getContent(idx);
    //상품 옵션 불러오기
    ArrayList<IndividualVo> Opvos = individualService.getIndiList(sectionVo.getSectname());
    //연관 상품 불러오기
    ArrayList<SectionVo> relVos = shoppingService.getRelList(sectionVo.getSectname());
    
    
    model.addAttribute("sectionVo", sectionVo);
    model.addAttribute("Opvos", Opvos);
    model.addAttribute("relVos", relVos);
    
    //리뷰불러오기
//    ArrayList<ReviewVo> reviewVos = menuService.getReviewList(idx);
//    model.addAttribute("reviewVos", reviewVos);    
    
    //상품문의 불러오기
//    ArrayList<ProinquiryVo> proinquiryVos = menuService.getProinquiryList(idx);
//    model.addAttribute("proinquiryVos", proinquiryVos); 
   
    return "admin/shopping/product2/mContent";
  }
  
  @RequestMapping(value="/admin/shopping/product2/mContent", method=RequestMethod.POST)
  public String mContentPost(String sw, String idx, String nickname, String product, int[] optionIdx, int[] optionNum) {
    int productIdx = shoppingService.getProductIdx(product);
    for(int i=0;i<optionIdx.length;i++) {
      CartVo vo = new CartVo();
      vo.setNickname(nickname);
      vo.setProductIdx(productIdx);
      vo.setOptionIdx(optionIdx[i]);
      vo.setOptionNum(optionNum[i]);

      //카트에 중복 물품이 있는지 확인
      CartVo chkVo = shoppingService.checkCart(vo);
      
      //중복될 시 카트 수량변경
      if(chkVo!=null) { 
        shoppingService.updateCart(vo,chkVo.getIdx()); 
      }
      //중복되지 않으면 새로 생성
      else {
        shoppingService.cartInput(vo);
      }

    }
    
    if(sw.equals("cart")) {
      return "redirect:/shopping/admin/shopping/product2/cart";
    } else {
      String flag = "cartInput$idx="+idx;
      return "redirect:/msg/"+flag;
    }
  }
  
  @RequestMapping(value="/admin/shopping/product2/cart",method=RequestMethod.GET)
  public String mypageGet(HttpSession session, Model model) {
    String nickname = (String)session.getAttribute("snickname");
    ArrayList<CartVo> vos = shoppingService.getCartList(nickname);
    
    //다른 테이블을 참고하여 더 많은 데이터를 담음
    ArrayList<CartListVo> listVos = new ArrayList<CartListVo>();

    for(int i=0;i<vos.size();i++) {
      CartListVo listVo = new CartListVo();
      listVo.setIdx(vos.get(i).getIdx());
      listVo.setOptionIdx(vos.get(i).getOptionIdx());
      listVo.setOptionName(individualService.getOptionName(vos.get(i).getOptionIdx()));
      listVo.setOptionNum(vos.get(i).getOptionNum());
      listVo.setPrice(individualService.getOptionPrice(vos.get(i).getOptionIdx()));
      listVo.setProduct(shoppingService.getProduct(Integer.toString(vos.get(i).getProductIdx())));
      listVo.setThumbImg(shoppingService.getRfname(listVo.getProduct()));
      listVo.setNickname(nickname);
      listVos.add(listVo);
    }
    
    model.addAttribute("listVos", listVos);
    return "admin/shopping/product2/cartlist";
  }
  
  @RequestMapping(value="/admin/shopping/product2/cartUpdate",method=RequestMethod.GET)
  @ResponseBody
  public void cartUpdateGet(@RequestParam("idx") String idx, @RequestParam("optionNum") String optionNum) {
    //장바구니의 아이템갯수가 변경될때마다 DB바꾸기
    shoppingService.updateNumber(idx,optionNum);
  }
  
  @RequestMapping(value="/admin/shopping/product2/cartDel", method=RequestMethod.GET)
  public String cartDelGet(int idx) {
    shoppingService.cartDel(idx);
    
    return "redirect:/shopping/admin/shopping/product2/cart";
  }
  
  @RequestMapping(value="/admin/shopping/product2/order",method=RequestMethod.POST)
  public String orderPost(HttpSession session, int[] idx, String[] check,String post, Model model) {

    String nickname = (String)session.getAttribute("snickname");
    //세션 닉네임으로 정보불러오기
    MemberVo memberVo = memberService.nickCheck(nickname);
    
    //장바구니에서 넘어온 물건들 띄우기
    //다른 VO를 참고하여 더 많은 데이터를 담음
    ArrayList<CartListVo> listVos = new ArrayList<CartListVo>();
    int totalP = 0;
    for(int i=0;i<idx.length;i++) {
      if(check[i].equals("1")) { //체크한 아이템만 담기
        CartVo cartVo = shoppingService.getCartListIdx(idx[i]); //cart테이블의 고유번호로 정보조회
        CartListVo listVo = new CartListVo();
        listVo.setIdx(cartVo.getIdx()); //Cart테이블 고유 idx
        listVo.setOptionIdx(cartVo.getOptionIdx());
        listVo.setOptionName(individualService.getOptionName(cartVo.getOptionIdx()));
        listVo.setOptionNum(cartVo.getOptionNum()); //변경한 갯수대로 주문하기
        listVo.setPrice(individualService.getOptionPrice(cartVo.getOptionIdx()));
        listVo.setProduct(shoppingService.getProduct(Integer.toString(cartVo.getProductIdx())));
        listVo.setThumbImg(shoppingService.getRfname(listVo.getProduct()));
        listVo.setNickname(nickname);
        
        //상품가격합 계산
        totalP += listVo.getPrice()*listVo.getOptionNum();
        listVos.add(listVo);        
      }
    }    
    
    //상품가격 합
    model.addAttribute("totalP", totalP);
    model.addAttribute("listVos", listVos);
    model.addAttribute("memberVo", memberVo);
    model.addAttribute("post", post);
    
    return "admin/shopping/product2/order";
  }
  
  @RequestMapping(value="/admin/shopping/product2/orderDone",method=RequestMethod.POST)
  public String orderPost(HttpSession session, String[] product,String[] optionIdx, String[] optionNum, OrderlistVo orderlistVo, String pointIn) {
    String nickname = (String)session.getAttribute("snickname");
    orderlistVo.setNickname(nickname);
    String orderinfo="";
    for(int i=0;i<product.length;i++) {
      int productIdx = shoppingService.getProductIdx(product[i]);//productIdx를 product로 조회
      orderinfo += Integer.toString(productIdx)+"/"+optionIdx[i]+"/"+optionNum[i]+"%";
      
      //판매량 업데이트
      
      //1.옵션에 따른 상품갯수 불러오기
      int quantity = individualService.getQuantity(optionIdx[i]); //옵션 idx에 따른
      //2.옵션상품갯수 * 구매갯수
      quantity = quantity*Integer.parseInt(optionNum[i]); 
      //3.section테이블 판매량 업데이트
      shoppingService.updateSalenum(product[i], quantity);
      
      //같은 상품 장바구니 지우기
      shoppingService.deleteCart(nickname, productIdx, optionIdx[i]);
    }
    orderlistVo.setOrderinfo(orderinfo);
    shoppingService.orderlistInput(orderlistVo);
    
    //회원 포인트 차감
    int pointUse = orderlistVo.getPointUse();
    if(pointUse>0) {
      memberService.pointMinus(orderlistVo.getPointUse(), nickname);
    }
    
    //회원 포인트 적립
    memberService.pointPlus(pointIn,nickname);
    
    return "redirect:/msg/orderDone";
  }
  
  @RequestMapping(value="/admin/shopping/product2/recentorder", method=RequestMethod.GET)
  public String recentOrderGet(String flag, HttpSession session, Model model) {
    String nickname = (String)session.getAttribute("snickname");
    
    //null처리
    String receiveflag = flag==null ? "1w" : flag;
    
    //공통으로 사용하기 위해 선언
    ArrayList<RecentOrderVo> recentVos = new ArrayList<RecentOrderVo>();
    int payed = shoppingService.countOrderState(nickname,"결제완료");
    int shipping = shoppingService.countOrderState(nickname,"배송중");
    int delivered = shoppingService.countOrderState(nickname,"배송완료");
    int point = memberService.getPoint(nickname);
    String gender = memberService.getGender(nickname);

    ArrayList<OrderlistVo> vos = shoppingService.mypageOrderList(receiveflag,nickname);

    //화면에 더많은 정보를 뿌리기 위해 recentVos에 담는다
    for(int i=0;i<vos.size();i++) {
      RecentOrderVo recentVo = new RecentOrderVo();
      String orderinfo = vos.get(i).getOrderinfo();
      String[] orderinfos = orderinfo.split("/");
      String[] items = orderinfo.split("%");
      
      // 대표상품 첫번째값만 필요 "/"로 구분한 첫번째(productIdx) 두번째(optionIdx) 세번째(optionNum)
      String productIdx = orderinfos[0];
      String optionIdx = orderinfos[1];
      String optionNum = orderinfos[2].substring(0,1);
      
      //화면에 필요한 것만 담아보낸다.
      recentVo.setIdx(vos.get(i).getIdx()); //주문번호
      recentVo.setOrderdate(vos.get(i).getOrderdate());  //주문날짜
      recentVo.setTotalPay(vos.get(i).getTotalPay());  //주문총액
      recentVo.setProduct(shoppingService.getProduct(productIdx)); //주문상품이름
      recentVo.setRfname(shoppingService.getRfname(recentVo.getProduct()));  //상품썸네일파일이름
      recentVo.setIndiname(individualService.getIndiname(optionIdx)); //상품옵션이름
      recentVo.setOptionNum(optionNum);  //옵션수량
      recentVo.setOrderstate(vos.get(i).getOrderstate());  //주문상태
      recentVo.setItem(items.length);  //총주문갯수
      recentVo.setStatedate(vos.get(i).getStatedate());
      recentVos.add(recentVo);
    }
    
    
    model.addAttribute("recentVos", recentVos);
    model.addAttribute("payed", payed);
    model.addAttribute("shipping", shipping);
    model.addAttribute("delivered", delivered);
    model.addAttribute("point", point);
    model.addAttribute("gender", gender);
    return "admin/shopping/product2/recentorder";
  }
  
  @RequestMapping(value="/admin/shopping/product2/recentorder", method=RequestMethod.POST)
  public String recentOrderPost(String fromDate, String toDate, HttpSession session, Model model) {
    String nickname = (String)session.getAttribute("snickname");
    int point = memberService.getPoint(nickname);
    String gender = memberService.getGender(nickname);

    //당일을 조회하기 위해 date형식을 datetime형식으로 바꿔줌
    toDate = toDate+" 23:59:99";

    //공통으로 사용하기 위해 선언
    ArrayList<OrderlistVo> vos = new ArrayList<OrderlistVo>();
    ArrayList<RecentOrderVo> recentVos = new ArrayList<RecentOrderVo>();
    int payed = shoppingService.countOrderState(nickname,"결제완료");
    int shipping = shoppingService.countOrderState(nickname,"배송중");
    int delivered = shoppingService.countOrderState(nickname,"배송완료");
    
    vos = shoppingService.getOrderFromToDate(nickname,fromDate,toDate);
    //화면에 더많은 정보를 뿌리기 위해 recentVos에 담는다
    for(int i=0;i<vos.size();i++) {
      RecentOrderVo recentVo = new RecentOrderVo();
      String orderinfo = vos.get(i).getOrderinfo();
      String[] orderinfos = orderinfo.split("/");
      String[] items = orderinfo.split("%");
      
      // 대표상품 첫번째값만 필요 "/"로 구분한 첫번째(productIdx) 두번째(optionIdx) 세번째(optionNum)
      String productIdx = orderinfos[0];
      String optionIdx = orderinfos[1];
      String optionNum = orderinfos[2].substring(0,1);
      
      //화면에 필요한 것만 담아보낸다.
      recentVo.setIdx(vos.get(i).getIdx()); //주문번호
      recentVo.setOrderdate(vos.get(i).getOrderdate());  //주문날짜
      recentVo.setTotalPay(vos.get(i).getTotalPay());  //주문총액
      recentVo.setProduct(shoppingService.getProduct(productIdx)); //주문상품이름
      recentVo.setRfname(shoppingService.getRfname(recentVo.getProduct()));  //상품썸네일파일이름
      recentVo.setIndiname(individualService.getIndiname(optionIdx)); //상품옵션이름
      recentVo.setOptionNum(optionNum);  //옵션수량
      recentVo.setOrderstate(vos.get(i).getOrderstate());  //주문상태
      recentVo.setItem(items.length);  //총주문갯수
      recentVo.setStatedate(vos.get(i).getStatedate());
      recentVos.add(recentVo); 
    }
    
    model.addAttribute("recentVos", recentVos);
    model.addAttribute("payed", payed);
    model.addAttribute("shipping", shipping);
    model.addAttribute("delivered", delivered);
    model.addAttribute("fromDate", fromDate);
    //값 다시 출력하기위해 date형식으로 잘라줌
    toDate = toDate.substring(0,10);
    model.addAttribute("toDate", toDate);
    model.addAttribute("point", point);
    model.addAttribute("gender", gender);
    
    return "admin/shopping/product2/recentorder";
  }
  
  @RequestMapping(value="/admin/shopping/product2/myorder", method=RequestMethod.GET)
  public String myorderGet(int idx,Model model) {
    //먼저 주문번호로 정보를 가져온다.
    OrderlistVo vo = shoppingService.getOrderList(idx);
    
    //정보를 담을 arraylist선언
    ArrayList<RecentOrderVo> ProductVos = new ArrayList<RecentOrderVo>();
    
    
    //상품정보들을 분류한다
    String[] orderinfos = vo.getOrderinfo().split("%");

    
    for(int i=0; i<orderinfos.length;i++) {
      String[] oneOrder = orderinfos[i].split("/");

      String productIdx = oneOrder[0];
      String optionIdx = oneOrder[1];
      String optionNum = oneOrder[2].substring(0,1);

      //각 주문정보를 vo에 담아준다
      RecentOrderVo roVo = new RecentOrderVo();
      roVo.setProduct(shoppingService.getProduct(productIdx));
      roVo.setRfname(shoppingService.getRfname(roVo.getProduct()));
      roVo.setIndiname(individualService.getIndiname(optionIdx));
      roVo.setOptionNum(optionNum);
      roVo.setOptionPrice(individualService.getOptionPrice(Integer.parseInt(optionIdx)));
      roVo.setProductPrice(Integer.parseInt(roVo.getOptionNum())*roVo.getOptionPrice());
      
      //리뷰중복찾기
      ArrayList<ReviewVo> reviewVos = shoppingService.getReviewCheck(Integer.parseInt(productIdx),idx);
      
      if(reviewVos.size()==0) {
        roVo.setReviewSw("리뷰등록");
      } else {
        roVo.setReviewSw("중복");
      }
      
      ProductVos.add(roVo);
    }
    
    model.addAttribute("ProductVos", ProductVos);
    model.addAttribute("vo", vo);
    return "admin/shopping/product2/orderContent";
  }

  @RequestMapping(value="/admin/shopping/product2/orderList",method=RequestMethod.GET)
  public String orderlistGet(Model model, String state) {
    
    //주문상태별 조회하기(전체조회시 공백처리)
    String selectState = state==null? "" : state;

    ArrayList<OrderlistVo> vos = shoppingService.orderlistState(selectState);
    
    ArrayList<RecentOrderVo> recentVos = new ArrayList<RecentOrderVo>();

    //화면에 더많은 정보를 뿌리기 위해 recentVos에 담는다
    for(int i=0;i<vos.size();i++) {
      RecentOrderVo recentVo = new RecentOrderVo();
      String orderinfo = vos.get(i).getOrderinfo();
      String[] orderinfos = orderinfo.split("/");
      String[] items = orderinfo.split("%");
      
      // 대표상품 첫번째값만 필요 "/"로 구분한 첫번째(productIdx) 두번째(optionIdx) 세번째(optionNum)
      String productIdx = orderinfos[0];
      String optionIdx = orderinfos[1];
      String optionNum = orderinfos[2].substring(0,1);
      
      //화면에 필요한 것만 담아보낸다.
      recentVo.setIdx(vos.get(i).getIdx()); //주문번호
      recentVo.setNickname(vos.get(i).getNickname()); //주문자
      recentVo.setName(vos.get(i).getName()); //배송이름
      recentVo.setOrderdate(vos.get(i).getOrderdate());  //주문날짜
      recentVo.setTotalPay(vos.get(i).getTotalPay());  //주문총액
      recentVo.setProduct(shoppingService.getProduct(productIdx)); //주문상품이름
      recentVo.setIndiname(individualService.getIndiname(optionIdx)); //상품옵션이름
      recentVo.setOptionNum(optionNum);  //옵션수량
      recentVo.setOrderstate(vos.get(i).getOrderstate());  //주문상태
      recentVo.setItem(items.length);  //총주문갯수
      recentVo.setPaymethod(vos.get(i).getPaymethod());  //총주문갯수
      recentVos.add(recentVo);  
    }
    
    model.addAttribute("state", selectState);
    model.addAttribute("recentVos", recentVos);
    return "admin/shopping/product2/orderList";
  }
  
  @RequestMapping(value="/admin/shopping/product2/orderstate/{flag}",method=RequestMethod.GET)
  public String orderstateGet(@PathVariable String flag,Model model,int idx) {
    OrderlistVo vo = shoppingService.oneOrderList(idx);
    String state="";
    if(flag.equals("payed")) {
      state="배송중";
    } else if(flag.equals("shipping")) {
      state="배송완료";
    } 
    shoppingService.updateOrderstate(idx,state);
    
    flag = "orderStateUpdate";
    
    return "redirect:/msg/"+flag;
  }
  
  @RequestMapping(value="/admin/shopping/product2/allStateUpdate", method=RequestMethod.POST)
  public String allStateUpdateGet(String[] updatecheck, String allState) {
    
    for(int i=0;i<updatecheck.length;i++) {
      shoppingService.updateOrderstate(Integer.parseInt(updatecheck[i]),allState);
    }
    
    flag = "allStateUpdate";
    
    return "redirect:/msg/" + flag;
  }

  @RequestMapping(value="/admin/shopping/product2/delivery",method=RequestMethod.GET)
  public String deliveryGet(int idx, Model model) {
    OrderlistVo vo = shoppingService.oneOrderList(idx);
    
    model.addAttribute("vo", vo);
    
    return "admin/shopping/product2/delivery";
  }

  @RequestMapping(value="/admin/shopping/product2/orderinfo",method=RequestMethod.GET)
  public String orderinfoGet(int idx, Model model) {
    OrderlistVo vo = shoppingService.oneOrderList(idx);
    
    //정보를 담을 arraylist선언
    ArrayList<RecentOrderVo> ProductVos = new ArrayList<RecentOrderVo>();
    
    
    //상품정보들을 분류한다
    String[] orderinfos = vo.getOrderinfo().split("%");

    
    for(int i=0; i<orderinfos.length;i++) {
      String[] oneOrder = orderinfos[i].split("/");

      String productIdx = oneOrder[0];
      String optionIdx = oneOrder[1];
      String optionNum = oneOrder[2].substring(0,1);

      //각 주문정보를 vo에 담아준다
      RecentOrderVo roVo = new RecentOrderVo();
      roVo.setProduct(shoppingService.getProduct(productIdx));
      roVo.setRfname(shoppingService.getRfname(roVo.getProduct()));
      roVo.setIndiname(individualService.getIndiname(optionIdx));
      roVo.setOptionNum(optionNum);
      roVo.setOptionPrice(individualService.getOptionPrice(Integer.parseInt(optionIdx)));
      roVo.setProductPrice(Integer.parseInt(roVo.getOptionNum())*roVo.getOptionPrice());
      ProductVos.add(roVo);
    }
    
    model.addAttribute("ProductVos", ProductVos);
    model.addAttribute("vo", vo);
    
    return "admin/shopping/product2/orderinfo";
  }
  
  @RequestMapping(value="/admin/shopping/product2/payment",method=RequestMethod.GET)
  public String paymentGet(int idx, Model model) {
    OrderlistVo vo = shoppingService.oneOrderList(idx);
    
    model.addAttribute("vo", vo);
    
    return "admin/shopping/product2/payment";
  }
  
  @RequestMapping(value="/admin/shopping/product2/review", method=RequestMethod.GET)
  public String reviewGet(String product, int orderIdx, Model model) {
    model.addAttribute("product", product);
    model.addAttribute("orderIdx", orderIdx);
    return "member/reviewInput";
  }

  @RequestMapping(value="/admin/shopping/product2/review", method=RequestMethod.POST)
  public String reviewPost(ReviewVo vo) {
    vo.setProductIdx(shoppingService.getProductIdx(vo.getProduct()));
    shoppingService.reviewInput(vo);
    //리뷰 작성시 50P 적립
    memberService.pointPlus("50", vo.getNickname());
    
    String flag = "reviewInput$idx="+vo.getOrderIdx();
    return "redirect:/msg/"+flag;
  }
  
}
