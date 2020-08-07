<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
  .w3-sidebar a {font-family: "Roboto", sans-serif}
  body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
<script>
function myAccFunc1() {
  var x = document.getElementById("demoAcc1");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}


function myAccFunc2() {
  var x = document.getElementById("demoAcc2");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

function myAccFunc3() {
  var x = document.getElementById("demoAcc3");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>
<body>
<p><br/></p>

  <div class="w3-container w3-display-container w3-padding-16">
    <h3 class="w3-wide"><b>*BLUE*</b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="${contextPath}/admin/right" class="w3-bar-item w3-button" target="right">HOME</a>
    <a href="${contextPath}/admin/calendar" class="w3-bar-item w3-button" target="right">일정관리</a>
    <a href="${contextPath}/admin/member/amList" class="w3-bar-item w3-button" target="right">고객관리</a>
    <a href="#" class="w3-bar-item w3-button" target="right">공지사항</a>
    <a onclick="myAccFunc1()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn1" target="right">
      상품관리 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc1" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="${contextPath}/shopping/admin/shopping/productInput" class="w3-bar-item w3-button w3-light-grey" target="right"><i class="fa fa-caret-right w3-margin-right">상품등록</i></a>
      <a href="${contextPath}/shopping/admin/shopping/productList" class="w3-bar-item w3-button w3-light-grey" target="right"><i class="fa fa-caret-right w3-margin-right">상품목록</i></a>
    </div>    
    <a onclick="myAccFunc2()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn2" target="right">
      문의사항 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey" target="right"><i class="fa fa-caret-right w3-margin-right">회원</i></a>
      <a href="#" class="w3-bar-item w3-button w3-light-grey" target="right"><i class="fa fa-caret-right w3-margin-right">비회원</i></a>
    </div> 
    <a onclick="myAccFunc3()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn3" target="right">
      주문확인 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc3" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="#" class="w3-bar-item w3-button w3-light-grey" target="right"><i class="fa fa-caret-right w3-margin-right">회원</i></a>
      <a href="#" class="w3-bar-item w3-button w3-light-grey" target="right"><i class="fa fa-caret-right w3-margin-right">비회원</i></a>
    </div>       
    <a href="javascript:window.close();" class="w3-bar-item w3-button" target="_top">로그아웃</a>
  </div>
 

</body>
</html>