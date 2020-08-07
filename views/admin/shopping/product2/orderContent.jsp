<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="zxx">
<head>
  <title>주문상세페이지</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/css/orderContent.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>    
	<script>
	  function review(product, orderIdx){
	    location.href="${contextPath}/shopping/admin/shopping/product2/review?product="+product+"&orderIdx="+orderIdx;
	  }
	</script>
</head>
<body>
<%@include file="./naviMenu/mypagenav.jsp" %>
<p><br/></p>
<div class="container">
  <h3>구매상세보기(주문번호 : ${vo.idx } )</h3>
  <p><br/></p>
  
  <!-- 개별주문상품 테이블 -->
  <div class="list">
    <table class="table table-bordered">
    <thead class="thead-light">
      <tr class="center">
        <th>상품</th>
        <th style="width:10%;">총상품금액</th>
        <th style="width:15%;">주문상태</th>
        <th style="width:15%;">후기</th>
      </tr>
    </thead>
    <c:forEach var="pVo" items="${ProductVos }">
    <tbody>
      <tr class="center">
        <td align="left" style="padding:20px;">
          <div style="dispaly:inline;float:left;"><img src="${contextPath }/upload/${pVo.rfname}" width="120px" style="margin-right:10px;"/></div>
          <div style="dispaly:inline;float:left;">
            <p>${pVo.product }</p>
            <p>${pVo.indiname }</p>
            <p>수량 : ${pVo.optionNum } / <fmt:formatNumber value="${pVo.optionPrice}" pattern="#,###"/></p>
          </div>
        </td>
        <td class="vtd">
          <span class="lineheight"><fmt:formatNumber value="${pVo.productPrice}" pattern="#,###"/></span>
        </td>
        <td class="vtd" style="padding:20px;">
          <font size="5">${vo.orderstate }</font>
          <c:if test="${vo.orderstate eq '결제완료' }"> <p>(배송준비중)</p></c:if>
          <c:if test="${vo.orderstate eq '배송중' }"> <p>배송출발일시<br/>(${fn:substring(vo.statedate,0,10) })</p></c:if>
          <c:if test="${vo.orderstate eq '배송완료' }"> <p>배송도착일시<br/>(${fn:substring(vo.statedate,0,10) })</p></c:if>
        </td>
        <td>
          <c:if test="${vo.orderstate eq '배송완료' }">
            <span class="lineheight">
              <c:if test="${pVo.reviewSw eq '리뷰등록' }">
                <input type="button" value="리뷰등록" class="btn btn-secondary" onClick="review('${pVo.product}','${vo.idx }')"/>
              </c:if>
              <c:if test="${pVo.reviewSw eq '중복' }">
                            리뷰작성완료
              </c:if>
            </span>
          </c:if>          
          <c:if test="${vo.orderstate eq '결제완료' || vo.orderstate eq '배송중'}">
            <p style="margin-top:20px;">배송도착후</p><p>리뷰등록가능</p>
          </c:if>
        </td>
      </tr>
    </tbody>
    </c:forEach>
    </table>  
  </div>
  
  <!-- 배송정보 -->
  <div class="left">  
    <table class="table table-bordered">
      <tr class="thead-light">
        <th colspan=2>배송정보</th>
      </tr>
      <tr>
        <td>이름</td>
        <td>${vo.name }</td>
      </tr>    
      <tr>
        <td>우편번호</td>
        <td>${vo.zipcode }</td>
      </tr>    
      <tr>
        <td>주소</td>
        <td>${vo.address }</td>
      </tr>    
      <tr>
        <td>연락처</td>
        <td>${vo.tel}</td>
      </tr>    
      <tr>
        <td>배송시<br/> 요청사항</td>
        <td>${vo.request }</td>
      </tr>    
    </table>
  </div>
  
  <!-- 결제정보 -->
  <div class="left">  
    <table class="table table-bordered">
      <tr class="thead-light">
        <th colspan=2>결제정보</th>
      </tr>
      <tr>
        <td width="30%">결제방식</td>
        <td>
          <c:if test="${vo.paymethod eq '1' }">신용카드</c:if>
          <c:if test="${vo.paymethod eq '2' }">무통장입금</c:if>
          <c:if test="${vo.paymethod eq '3' }">실시간계좌이체</c:if>
          <c:if test="${vo.paymethod eq '4' }">휴대폰결제</c:if>
        </td>
      </tr>    
      <tr>
        <td>배송비</td>
        <td><fmt:formatNumber value="${vo.post}" pattern="#,###"/></td>
      </tr>    
      <tr>
        <td>포인트차감(-)</td>
        <td>${vo.pointUse }</td>
      </tr>    
      <tr>
        <td>총결제금액</td>
        <td><fmt:formatNumber value="${vo.totalPay}" pattern="#,###"/></td>
      </tr>    
      <c:if test="${vo.paymethod eq '1' }">
        <tr>
          <td>결제카드</td>
          <td>${vo.card }</td>
        </tr>    
      </c:if>
      <c:if test="${vo.paymethod eq '2' }">
        <tr>
          <td>입금은행</td>
          <td>${vo.bank }</td>
        </tr>    
        <tr>
          <td>입금자명</td>
          <td>${vo.depositName }</td>
        </tr>    
      </c:if>  
    </table>
  </div>
  
  <div class="last">
    <input type="button" value="주문목록" class="btn btn-secondary"onClick="location.href='${contextPath}/shopping/admin/shopping/product2/recentorder'"/>
  
  </div>
  
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>