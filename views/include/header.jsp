<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <style>
    .top_bg1 {
      width: 100%;
      height: 300px;
      background-image: url('${contextPath}/resources/images/top_bg1.jpg');
      background-size: 100% 100%;
      border: 0px solid red;
    }
  </style>
</head>
<body>
<div class="jumbotron text-center top_bg1" style="margin-bottom:0">
  <font color="#fff">
    <h1>BLUE NARA</h1>
    <p>(BLUE나라에 오신것을 환영합니다.)</p> 
    <p>본 사이트는 반응형으로 제작되었습니다.</p>
  </font> 
</div>
</body>
</html>