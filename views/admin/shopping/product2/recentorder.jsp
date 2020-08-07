<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="zxx">
<head>
  <title>주문목록</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>    
  <link rel="stylesheet" type="text/css" href="${contextPath}/css/recentorder.css">
  <script>
  $(document).ready(function(){
    $("#payed").click(function(){
      location.href="${contextPath}/shopping/admin/shopping/product2/recentorder?flag=payed";
    })
    $("#shipping").click(function(){
      location.href="${contextPath}/shopping/admin/shopping/product2/recentorder?flag=shipping";
    })
    $("#delivered").click(function(){
      location.href="${contextPath}/shopping/admin/shopping/product2/recentorder?flag=delivered";
    })
  });
  
  function dateCheck(){
    var fromDate = document.dateform.fromDate.value;
    var toDate = document.dateform.toDate.value;
    if(fromDate==""){
      alert("조회 시작날짜를 입력하세요.");
    }
    else if(toDate==""){
      alert("조회 종료날짜를 입력하세요.");
    }    
    else if(fromDate>toDate){
      alert("조회 시작날짜는 종료날짜보다 클 수 없습니다.");
    } 
    else {
      document.dateform.submit();
    }
  }
  </script>
</head>
<body>
<%@include file="./naviMenu/mypagenav.jsp" %>
<div class="container">
  <!-- 상단메뉴 -->
  <div>
    <h3>주문현황</h3>
    <div class="inline">
      <c:if test="${gender eq '남자'}">
        <img src="${contextPath }/resources/images/man.gif" style="width:80px;margin:10px;"/><br/>
      </c:if>
      <c:if test="${gender ne '남자'}">
        <img src="${contextPath }/resources/images/woman.gif" style="width:80px;margin:10px;"/><br/>
      </c:if>
      <span>${snickname }</span><br/>
      <span style="color:#ff6000;">P</span>&nbsp;<span><fmt:formatNumber value="${point}" pattern="#,###" /></span>  
    </div>
    <div class="inline">
      <div class="round" id="payed">
        <p><br/></p>
        <img src="${contextPath }/resources/images/won_icon.png"/>
        <p>주문/결제</p>
      </div>
      <span><h4>${payed}건</h4></span>
    </div>
    <div class="inline">
      <div class="round" id="shipping">
        <p><br/></p>
        <img src="${contextPath }/resources/images/truck_icon.png"/>
        <p>배송중</p>
      </div>
      <span><h4>${shipping }건</h4></span>    
    </div>
    <div class="inline">
      <div class="round" id="delivered">
        <p><br/></p>
        <img src="${contextPath }/resources/images/ok_icon.png"/>
        <p>배송완료</p>
      </div>
      <span><h4>${delivered }건</h4></span>    
    </div>
  </div>

  <!-- 주문조회기간설정 -->
  <div class="list date">
   <div style="dispaly:inline;float:left;margin-right:30px;"><h5>구매조회 ▶</h5></div>
   <div style="dispaly:inline;float:left;width:70%;">
    <div>
     <input type="button" value="1주일" class="btn btn-outline-secondary btn-sm" onClick="location.href='${contextPath}/shopping/admin/shopping/product2/recentorder?flag=1w'"/>
     <input type="button" value="1개월" class="btn btn-outline-secondary btn-sm" onClick="location.href='${contextPath}/shopping/admin/shopping/product2/recentorder?flag=1m'"/>
     <input type="button" value="3개월" class="btn btn-outline-secondary btn-sm" onClick="location.href='${contextPath}/shopping/admin/shopping/product2/recentorder?flag=3m'"/>
     <input type="button" value="6개월" class="btn btn-outline-secondary btn-sm" onClick="location.href='${contextPath}/shopping/admin/shopping/product2/recentorder?flag=6m'"/>
    </div>
    <div style="margin-top:10px;">
      <form class="form-inline" name="dateform" method="post">
        <input type="date" id="fromDate"  class="form-control" name="fromDate" style="margin-right:10px;" <c:if test="${!empty fromDate }">value="${fromDate }"</c:if>/> ~ 
        <input type="date" id="toDate" class="form-control" name="toDate" style="margin-left:10px;margin-right:10px;" <c:if test="${!empty toDate }">value="${toDate }"</c:if>/>
        <input type="button" value="조회하기" class="btn btn-outline-secondary btn-sm" onClick="dateCheck()"/>
      </form>
    </div>
   </div> 
  </div>

  <!-- 최근 구매목록 -->
  <div class="list">
    <table class="table table-bordered">
    <thead class="thead-light">
      <tr class="center">
        <th width="20%">주문일시</th>
        <th>주문상품번호</th>
        <th width="20%">주문/결제</th>
      </tr>
    </thead>
    <c:forEach var="vo" items="${recentVos }">
    <tbody>
      <tr class="center">
        <td>
          <span>${fn:substring(vo.orderdate,0,10)} </span><br/>
          <span>주문번호 : ${vo.idx }</span><br/>
          <p><input type="button" value="주문상세/리뷰" class="btn btn-secondary" onClick="location.href='${contextPath}/shopping/admin/shopping/product2/myorder?idx=${vo.idx }'"/></p>
          <span>총주문금액</span><br/>
          <span class="tt"><fmt:formatNumber value="${vo.totalPay}" pattern="#,###" /></span><span><font color="#ff6000">원</font></span>
        </td>
        <td align="left" style="padding:20px;">
          <div style="dispaly:inline;float:left;"><img src="${contextPath }/upload/${vo.rfname}" width="120px" style="margin-right:10px;"/></div>
          <div style="dispaly:inline;float:left;">
            <p>${vo.product }<c:if test="${(vo.item-1)>0 }"> 외 ${vo.item-1 }건</c:if></p>
            <p>${vo.indiname }</p>
            <p>수량 : ${vo.optionNum }개</p>
            <p><fmt:formatNumber value="${vo.totalPay}" pattern="#,###" />원</p>
          </div>
        </td>
        <td class="vtd" style="padding:30px;">
          <font size="5">${vo.orderstate }</font>
          <c:if test="${vo.orderstate eq '결제완료' }"> <p>(배송준비중)</p></c:if>
          <c:if test="${vo.orderstate eq '배송중' }"> <p>배송출발일시<br/>(${fn:substring(vo.statedate,0,10) })</p></c:if>
          <c:if test="${vo.orderstate eq '배송완료' }"> <p>배송도착일시<br/>(${fn:substring(vo.statedate,0,10) })</p></c:if>
        </td>
      </tr>
    </tbody>
    </c:forEach>
    </table>  
  </div>

<div class="last">

</div>
 
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>