<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <link rel="stylesheet" type="text/css" href="${contextPath}/css/style.css">
  <title>title</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<nav class="navbar navbar-expand-sm bg-light justify-content-center">
  <ul class="navbar-nav">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              주문관리
      </a>
      <input type="checkbox" id="drop-3" />
      <ul>
        <li><a class="drop-text" href="${contextPath }/shopping/admin/shopping/product2/cart">장바구니</a></li>
        <li><a class="drop-text" href="${contextPath }/shopping/admin/shopping/product2/recentorder">최근구매상품</a></li>
        <li><a class="drop-text" href="${contextPath }/shopping/admin/shopping/product2/point">포인트/쿠폰</a></li>
      </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/mypage/mypost">내가쓴글</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/mUpdate">회원정보수정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath }/member/mypage/inquiryList">1:1문의</a>
    </li>
  </ul>
</nav>
<br>
</body>
</html>