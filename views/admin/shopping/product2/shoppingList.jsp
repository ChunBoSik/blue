<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>shoppingList</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<%@include file="./naviMenu/shopMenu.jsp" %>
<div>
  <section class="portfolio py-5">
    <div class="container py-xl-5 py-lg-3">
      <div class="title-section text-center mb-md-5 mb-4">
        <h3 class="w3ls-title mb-3">- ${categoryname} -<h3>
      </div>
      <div class="row mt-4">
        <c:set var="cnt" value="0"/>
        <c:forEach var="vo" items="${vos}">
          <div class="col-md-4">
            <div class="gallery-demo" style="text-align:center">
              <a href="${contextPath}/shopping/admin/shopping/product2/mContent?idx=${vo.idx}">
                <img src="${contextPath}/upload/${vo.rfname}" alt=" " class="img-fluid" width="220px"/>
                <h6 class="p-mask">${vo.product} &nbsp;&nbsp;<h6><fmt:formatNumber value="${vo.mainprice}" pattern="#,###"/>원</h6></h6>
                <h6 class="p-mask">${vo.detail}</h6>
              </a>
            </div>
          </div>
          <c:set var="cnt" value="${cnt+1}"/>
          <c:if test="${cnt%3==0}">
            </div>
            <div class="row mt-md-5">
          </c:if>
        </c:forEach>           
    </div>
  </section>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>