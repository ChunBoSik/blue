<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>adminContent</title>
</head>
<body>
<%@include file="./naviMenu/adminNav.jsp" %>
<p><br/></p>
<div style="text-align:center">
  <div>오늘 게시글 : <font color="red"><b>${boardCnt}</b></font>건</div>
  <hr/>
  <div>오늘 방명록 : <font color="red"><b>${guestCnt}</b></font>건</div>
  <hr/>
  <div>오늘 신규가입회원 : <font color="red"><b>${joindayCnt}</b></font>건</div>
  <hr/>
  <div>오늘 자료실 : <font color="red"><b>${pdsCnt}</b></font>건</div>
  <hr/>
  <div>오늘 쇼핑몰 판매 건수 : <font color="red"><b>${shoppingCnt}</b></font>건</div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>