<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <title>주문목록</title>
  <style>
    .next{
      clear:both;
      margin-top:20px;
    }  
   
  </style>
  <script>
	  function delivery(idx) {
	    var winX = 600;
	    var winY = 400;
	    var url="${contextPath}/shopping/admin/shopping/product2/delivery?idx="+idx;
	    var x = ((window.screen.width)/2) - (winX/2);
	    var y = (window.screen.height/2) - (winY/2);
	    window.open(url,"deliveryWin","width="+winX+",height="+winY+",left="+x+",top="+y); // 1.url , 2.창이름 , 3.옵션(크기,각종설정)
	  }
	  
	  function orderinfo(idx){
      var winX = 1000;
      var winY = 500;
      var url="${contextPath}/shopping/admin/shopping/product2/orderinfo?idx="+idx;
      var x = ((window.screen.width)/2) - (winX/2);
      var y = (window.screen.height/2) - (winY/2);
      window.open(url,"orderinfoWin","width="+winX+",height="+winY+",left="+x+",top="+y); // 1.url , 2.창이름 , 3.옵션(크기,각종설정)
	  }

    function payment(idx) {
      var winX = 600;
      var winY = 400;
      var url="${contextPath}/shopping/admin/shopping/product2/payment?idx="+idx;
      var x = ((window.screen.width)/2) - (winX/2);
      var y = (window.screen.height/2) - (winY/2);
      window.open(url,"paymentWin","width="+winX+",height="+winY+",left="+x+",top="+y); // 1.url , 2.창이름 , 3.옵션(크기,각종설정)
    }
    
    function stateChange(idx){
      var orderstate = document.getElementById("orderstate"+idx).value;
      
      if(orderstate=="결제완료"){
        location.href="${contextPath}/shopping/admin/shopping/product2/orderstate/payed?idx="+idx;
      }
      else if(orderstate=="배송중"){
        location.href="${contextPath}/shopping/admin/shopping/product2/orderstate/shipping?idx="+idx;
      }
      else if(orderstate=="배송완료"){
        alert("배송완료된 상품입니다^^");
      }
    }
    
    function stateList(){
      var state = document.myform.state.value;
      location.href="${contextPath}/shopping/admin/shopping/product2/orderList?state="+state;
      
    }

    function allCheck(){
      var maxnum = document.getElementById("maxnum").value;
      if(document.getElementById("allcheck").checked){
        for(var i=1;i<=maxnum;i++){
          document.getElementById("check"+i).checked=true;
        }
      }
      else {
        for(var i=1;i<=maxnum;i++){
          document.getElementById("check"+i).checked=false;
        }
      }
    }
    
    function onCheck(){
      var maxnum = document.getElementById("maxnum").value;
      
      //체크해제하면 전체해제를 하기 위해 변수설정
      var cnt = 0;
      for(var i=1;i<=maxnum;i++){
        if(document.getElementById("check"+i).checked==false){
          cnt++;
        }
      }
      //체크해제된게 있음
      if(cnt!=0){
        document.getElementById("allcheck").checked=false;
      } else {
        document.getElementById("allcheck").checked=true;
      }
    }
    
    function updateAllCheck(){
      var ans = confirm("선택하신 주문상태를 일괄 변경하시겠습니까?");
      if(!ans){
        return false;
      }
      
      var maxnum = document.getElementById("maxnum").value;
      var cnt = 0;
      for(var i=1;i<=maxnum;i++){
        if(document.getElementById("check"+i).checked==true){
          cnt++;
        }
      }
      if(cnt==0){
        alert("변경할 주문번호를 선택해주세요!");
      }
      else if(document.getElementById("updateAllstate").value==""){
        alert("주문상태를 선택해주세요!");
      }
      else{
        
        document.updateForm.allState.value=document.getElementById("updateAllstate").value;
        document.updateForm.action="${contextPath}/shopping/admin/shopping/product2/allStateUpdate";
        document.updateForm.submit();
      }
    }
  </script>
</head>
<body>
<%@include file="./naviMenu/adminNav.jsp" %>
<div style="width:90%;margin:0 auto;">
  <div style="margin-bottom:20px;"><h3>주문목록</h3></div>
  <div style="float:left;margin-bottom:20px;">
    <div style="display:inline;float:left;margin-right:5px;margin-top:3px;">주문상태일괄변경</div>
    <div style="display:inline;float:left;">
      <select name="allstate" id="updateAllstate" class="form-control">
        <option value="">선택</option>
        <option value="결제완료">결제완료</option>
        <option value="배송중">배송중</option>
        <option value="배송완료">배송완료</option>
      </select>
    </div>
    <input type="button" onClick="updateAllCheck()" class="btn btn-secondary" value="일괄변경" style="margin-left:5px;display:inline;float:left;"/>
  </div>
  <div style="float:right;margin-bottom:20px;">
  <form name="myform" class="form-inline">
    <span>주문상태조회</span>&nbsp;&nbsp;&nbsp;
    <select name="state" onChange="stateList()" class="form-control">
      <option value="">전체</option>
      <option <c:if test="${state eq '결제완료' }">selected</c:if> value="결제완료">결제완료</option>
      <option <c:if test="${state eq '배송중' }">selected</c:if> value="배송중">배송중</option>
      <option <c:if test="${state eq '배송완료' }">selected</c:if> value="배송완료">배송완료</option>
    </select>
  </form>
  </div>
  <p><br/></p> 
  <div class="next">
    <table class="table table-hover">
      <thead>
        <tr align="center">
          <th>전체&nbsp;<input type="checkbox" id="allcheck" onClick="allCheck()"/></th>
          <th>주문번호</th>
          <th>주문자</th>
          <th>주문일</th>
          <th>배송정보</th>
          <th>주문제품정보</th>
          <th>결제정보</th>
          <th>주문상태관리</th>
        </tr>
      </thead>
      <tbody>
      <c:set var="num" value="0"/>
      <form name="updateForm" method="post">
      <c:forEach var="vo" items="${recentVos }">  
      <c:set var="num" value="${num+1 }"/>
        <tr align="center">
          <td><input type="checkbox" value="${vo.idx }" name="updatecheck" id="check${num }" onClick="onCheck()"/></td>
          <td>${vo.idx}</td>
          <td>${vo.nickname}</td>
          <td>${fn:substring(vo.orderdate,0,10)} </td>
          <td><a href="javascript:delivery('${vo.idx}')">${vo.name }</a></td>
          <td><a href="javascript:orderinfo('${vo.idx}')">${vo.product }<c:if test="${(vo.item-1)>0 }"> 외 ${vo.item-1 }건</c:if><br/>${vo.indiname } | 수량 : ${vo.optionNum }개</a></td>
          <td>
            <a href="javascript:payment('${vo.idx}')">
  	          <c:if test="${vo.paymethod eq '1' }">신용카드</c:if>
  	          <c:if test="${vo.paymethod eq '2' }">무통장입금</c:if>
  	          <c:if test="${vo.paymethod eq '3' }">실시간계좌이체</c:if>
  	          <c:if test="${vo.paymethod eq '4' }">휴대폰결제</c:if>
            </a>
          </td>
          <td><input type="button" id="orderstate${vo.idx }" name="orderstate" value="${vo.orderstate }" class="btn btn-outline-secondary" onClick="stateChange('${vo.idx}')"/></td>
        </tr>
      </c:forEach>
      <input type="hidden" name="allState"/>
      </form>
      <input type="hidden" value="${num }" id="maxnum"/>
      </tbody>
    </table>
  </div>   
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>