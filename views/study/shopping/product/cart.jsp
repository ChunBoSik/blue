<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>cart.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <h1>상품 구매하기</h1>
  <hr>
  <p>${snickname}님께서 구매하신 품목입니다.</p>
  <hr>
  <div>
    <c:set var="productCnt" value="${fn:length(vos)}"/>
    <p>구입품목 총 수량 : ${productCnt}개<p>
    <c:set var="imsiVo" value=""/>
    <c:set var="sw" value="0"/>
    <c:forEach var="vo" items="${vos}">
      <c:if test="${imsiVo eq vo}">
        <c:set var="cnt" value="${cnt + 1}"/>
      </c:if>
      <c:if test="${imsiVo ne vo}">
        <c:if test="${sw eq 1}">
          <p>
            [<a href="${contextPath}/study/shopping/productGroupDel?product=${imsiVo}">주문취소</a>]/
            [<a href="${contextPath}/study/shopping/productDel?product=${imsiVo}">수량1개감소</a>]
            [<a href="${contextPath}/study/shopping/productAdd?product=${imsiVo}">수량1개증가</a>]
            - 상품명 : <b>${imsiVo}</b> / 수량 : <b>${cnt}</b>
          </p>
          <c:set var="cnt" value="1"/>
          <c:set var="imsiVo" value="${vo}"/>
        </c:if>
        <c:if test="${sw eq 0}">  <!-- 처음 한번만 수행시키기 위함(cnt값과 imsiVo값 셋팅) -->
          <c:set var="cnt" value="1"/>
          <c:set var="imsiVo" value="${vo}"/>
          <c:set var="sw" value="1"/>
        </c:if>
      </c:if>
    </c:forEach>
    <p>
      [<a href="${contextPath}/study/shopping/productGroupDel?product=${imsiVo}">주문취소</a>] /
      [<a href="${contextPath}/study/shopping/productDel?product=${imsiVo}">수량1개감소</a>]
      [<a href="${contextPath}/study/shopping/productAdd?product=${imsiVo}">수량1개증가</a>]
      - 상품명 : <b>${imsiVo}</b> / 수량 : <b>${cnt}</b>  <!-- 남아있는 마지막 자료 출력 -->
    </p>
    <hr/>
    <p>
      <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/study/shopping/product';">계속쇼핑하기</button> &nbsp;
      <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/study/shopping/order';">주문하기</button> &nbsp;
      <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/study/shopping/orderReset';">전체주문취소</button>
    </p>
  </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>