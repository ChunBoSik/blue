<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="zxx">
<head>
  <title>장바구니</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script> 
  <link rel="stylesheet" href="${contextPath}/css/cart.css">
  <script>
    $(function(){
      $("[id^='optionNum']").change(function(){
        var idx = $(this).attr('id').replace("optionNum",""); //idx를 뽑아옴
        var optionNum = $(this).val();
        var alldata = { "idx" : idx,"optionNum" : optionNum};
        $.ajax({
          url : "${contextPath}/shopping/admin/shopping/product2/cartUpdate",
          type : "get",
          data : alldata,
          success : function(data) {
            //총상품금액 변경
            numChange(idx); 
          }
        }); 
      })
    
    })
    
    function numChange(idx){
      var totalPrice = document.getElementById("optionNum"+idx).value*document.getElementById("price"+idx).value;
      document.getElementById("totalPrice"+idx).value = totalPrice;
      document.getElementById("imsiTotalPrice"+idx).value = numberWithCommas(totalPrice);
      onTotal();
    } 
     
    function onTotal(){
      var total = 0;
      var maxIdx = document.getElementById("maxIdx").value;
      for(var i=1;i<=maxIdx;i++){
        if($("#totalPrice"+i).length != 0 && document.getElementById("idx"+i).checked){
          total = total + parseInt(document.getElementById("totalPrice"+i).value);
        }
      }
      var imsiTotal = total;
      document.getElementById("total").value=numberWithCommas(total);
      
      // 배송비 계산(50000원 초과이거나 주문금액이 0일때는 배송비가 0원이다.)
      if(total>=50000||total==0){
        document.getElementById("post").value=0;
      } else {
        document.getElementById("post").value=2500;
      }
      var lastPrice=parseInt(document.getElementById("post").value)+total;
      document.getElementById("lastPrice").value = numberWithCommas(lastPrice);
    }
    
    function onCheck(vossize){
      var maxIdx = document.getElementById("maxIdx").value;
      //체크하나해제하면 전체체크해제하기위해 변수설정
      var cnt=0;
      for(var i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked==false){
          cnt++;
        }
      }
      //하나라도 체크가 안되어있으면 전체체크해지
      if(cnt!=0){
        document.getElementById("allcheck").checked=false;
      } 
      //모두체크되어있을때만 전체체크
      else {
        document.getElementById("allcheck").checked=true;
      }
      onTotal();
    }
    
    function allCheck(){
      var maxIdx = document.getElementById("maxIdx").value;
      if(document.getElementById("allcheck").checked){
        for(var i=1;i<=maxIdx;i++){
          if($("#idx"+i).length != 0){
            document.getElementById("idx"+i).checked=true;
          }
        }
      }
      else {
        for(var i=1;i<=maxIdx;i++){
          if($("#idx"+i).length != 0){
            document.getElementById("idx"+i).checked=false;
          }
        }
      }
      onTotal();
    }
    
    // 구입품목 선택 삭제하기 
    function cartDel(idx){
      var ans = confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
      if(ans){
        location.href="${contextPath}/shopping/admin/shopping/product2/cartDel?idx="+idx;
      }
      
    }
    
    function order(){
      document.myform.action="${contextPath}/shopping/admin/shopping/product2/order";
      //체크된 장바구니에만 1의 값 부여
      var maxIdx = document.getElementById("maxIdx").value;
      for(var i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked){
          document.getElementById("check"+i).value="1";
        }
      }
      //배송비넘기기
      document.myform.post.value=document.getElementById("post").value;
      
      if(document.getElementById("lastPrice").value==0){
        alert("장바구니에서 상품을 선택해주세요!");
        return false;
      } 
      else {
        document.myform.submit();
      }
    }
    
    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  </script>
</head>
<body>
<%@include file="./naviMenu/mypagenav.jsp" %>
<%-- <jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include> --%>
<%-- <%@include file="./naviMenu/shopMenu.jsp" %> --%>
<p><br/></p>
<div class="container">

<!-- 헤드 -->
<div class="head"><h2>장바구니</h2></div>
<p><br/></p> 

<!-- 장바구니 헤드 -->
<form name="myform" method="post">
<table class="list table-bordered">
 <thead>
  <tr class="tablehead">
    <td><input type="checkbox" id="allcheck" onClick="allCheck()"/> 전체</td>
    <td colspan="2">상품</td>
    <td>수량</td>
    <td>총상품금액</td>
    <td></td>
  </tr>
  </thead>  
<!-- 장바구니목록 -->
  <c:set var="maxIdx" value="0"/>
  <c:forEach var="listVo" items="${listVos }">
    <tbody>
    <tr align="center">
      <td><input type="checkbox" id="idx${listVo.idx }" onClick="onCheck(${vos.size()})" /></td>
      <td><img src="${contextPath }/upload/${listVo.thumbImg}" class="thumb"/></td>
      <td align="left">
        <p>${listVo.product }</p>
        <p>${listVo.optionName }</p>
        <p><input type="text" id="price${listVo.idx }" value="${listVo.price }" class="inputBox" readonly/></p> 
      </td>
      <td><input type="number" value="${listVo.optionNum}" name="optionNum" id="optionNum${listVo.idx }" min="1" class="numBox" /></td> <!-- onChange="numChange(${listVo.idx })" -->
      <td>
        <h3><input type="text" id="imsiTotalPrice${listVo.idx }" value="<fmt:formatNumber value="${listVo.price*listVo.optionNum}" pattern="#,###"/>" class="inputBox" readonly/></h3>
        <input type="hidden" id="totalPrice${listVo.idx }" value="${listVo.price*listVo.optionNum}" class="inputBox"/>
      </td>
      <td>
        <input type="hidden" value="${listVo.idx }" name="idx"/>
        <input type="hidden" name="check" value="0" id="check${listVo.idx }"/>
        <input type="button" class="btn btn-secondary btn-sm" value="삭제" onClick="cartDel(${listVo.idx})"/>
      </td>
    </tr>
    </tbody>
    <c:set var="maxIdx" value="${listVo.idx}"/>
  </c:forEach>
  <input type="hidden" name="post" value="0" />
  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx }"/>
</table>
</form>
<p><br/></p>
<div align="center">
  <b>실제 주문 총 금액</b>(구매하실 상품에 체크해 주세요. 총 주문금액이 산출됩니다.)
</div>
<div class="last">
  <div class="inline">
    <span class="ft">상품금액</span><br/>
    <span class="inputFont"><input type="text" id="total" class="box" value="0" readonly/></span>
  </div>
  <div class="inline">
    <p><img src="${contextPath}/resources/images/plus4.png" class="math"/></p>
  </div>  
  <div class="inline">
    <span class="ft">배송비</span><br/>
    <span class="inputFont"><input type="text" id="post" class="box" value="0" readonly/></span>
  </div>
  <div class="inline">
    <p><img src="${contextPath }/resources/images/equal1.png" class="math"/></p>
  </div>    
  <div class="inline ll">
    <span class="ft">총주문금액</span><br/>
    <span class="inputFont"><input type="text" id="lastPrice" class="box" value="0" readonly/></span>
  </div>
</div>
<p><br/></p>
<div align="center">
  <button class="btn btn-secondary btn-lg" onClick="order()">구매하기</button>
  <button class="btn btn-secondary btn-lg" onClick="location.href='${contextPath}/shopping/admin/shopping/product2/shoppingList';">계속 쇼핑하기</button>
</div>

</div>
<p><br/><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>