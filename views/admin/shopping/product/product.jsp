<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>product.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <h1>상품 구매하기</h1>
  <hr>
  <p>${snickname}님 구매 중이십니다.</p>
  <hr>
  <form method="post">
    <select name="product">
      <option value="">상품선택</option>
      <option value="사과">사과</option>
      <option value="배">배</option>
      <option value="바나나">바나나</option>
      <option value="포도">포도</option>
      <option value="레몬">레몬</option>
      <option value="복숭아">복숭아</option>
    </select>
    <input type="submit" value="장바구니담기"><br/>
    <p><br/></p>
    <p><a href="${contextPath}/shopping/cart">장바구니보기</a></p>
  </form>
  <p><br/></p>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>