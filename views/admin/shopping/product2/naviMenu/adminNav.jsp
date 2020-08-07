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
  <title>adminNav</title>
    <script>
    addEventListener("load", function () {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
      window.scrollTo(0, 1);
    }
  </script>
  <!--// Meta tag Keywords -->

  <!-- Custom-Files -->
  <link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
  <!-- Bootstrap-Core-CSS -->
  <link href="${contextPath }/css/css_slider.css" type="text/css" rel="stylesheet" media="all">
  <!-- css slider -->
  <link rel="stylesheet" href="${contextPath }/css/style.css" type="text/css" media="all" />
  <!-- Style-CSS -->
  <link href="${contextPath }/css/font-awesome.min.css" rel="stylesheet">
  <!-- Font-Awesome-Icons-CSS -->
  <!-- //Custom-Files -->

  <!-- Web-Fonts -->
  <link
    href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext"
    rel="stylesheet">
  <link
    href="//fonts.googleapis.com/css?family=Barlow+Semi+Condensed:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- //Web-Fonts -->

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<nav class="navbar navbar-expand-sm bg-light justify-content-center">
  <ul class="navbar-nav">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              상품관리
      </a>
      <ul>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/shopping/product2/productList">상품목록</a></li>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/shopping/product2/product">상품등록</a></li>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/shopping/product2/option">상품옵션등록</a></li>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/shopping/product2/category">대분류관리</a></li>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/shopping/product2/division">중분류관리</a></li>
      </ul>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              주문관리
      </a>
      <ul>
        <li><a class="drop-text" href="${contextPath }/shopping/admin/shopping/product2/orderList">주문목록</a></li>
      </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link dropdown-toggle" id="navbardrop"  data-toggle="dropdown" href="${contextPath }/admin/list">이벤트관리</a>
      <ul>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/eventList"> 이벤트목록</a></li>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/eventInput">이벤트등록</a></li>
        <li><a class="drop-text" href="${contextPath}/shopping/admin/prizeList">이벤트당첨</a></li>
      </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath}/shopping/admin/shopping/adminContent">메인화면관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath}/admin/amList">회원관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link dropdown-toggle" id="navbardrop"  data-toggle="dropdown" href="#">Q&A관리</a>
      <ul>
        <li><a class="drop-text" href="${contextPath}/admin/proinquiry">상품답변등록</a></li>
        <li><a class="drop-text" href="${contextPath}/admin/userinquiry">1:1답변등록</a></li>
      </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextPath}/board/bList">게시글관리</a>
    </li>
  </ul>
</nav>
</body>
</html>