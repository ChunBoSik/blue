<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>gInput.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<div class="container">
  <h2>방명록 글쓰기</h2>
  <p>방문소감을 남겨주세요.</p>
  <form method="post" class="was-validated">
    <div class="form-group">
      <label for="name">글쓴이 : </label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required>
      <div class="valid-feedback">정확한 성명을 입력하세요.</div>
      <div class="invalid-feedback">글쓴이는 필수 입력 항목입니다.</div>
    </div>
    <div class="form-group">
      <label for="email">전자우편 : </label>
      <input type="text" class="form-control" id="email" placeholder="E-mail을 입력하세요." name="email">
    </div>
    <div class="form-group">
      <label for="homepage">홈페이지 : </label>
      <input type="text" class="form-control" id="homepage" placeholder="홈페이지를 입력하세요." name="homepage">
    </div>
    <div class="form-group">
      <label for="content">방문소감 : </label>
      <textarea class="form-control" rows="5" id="content" name="content" required></textarea>
      <div class="valid-feedback">방문소감을 입력합니다.</div>
      <div class="invalid-feedback">방문소감은 필수 입력 항목입니다.</div>
    </div>
    <button type="submit" class="btn btn-primary">글올리기</button>
    <button type="reset" class="btn btn-primary">취소</button>
    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/guest/gList?page=${page}';">돌아가기</button>
  </form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>