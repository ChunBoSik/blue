<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mailForm.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/><p>
<div class="container">
  <h2>메일 보내기</h2><br/>
  <p>받는 사람의 메일 주소를 정확히 입력하세요.</p>
  <form name="myform" method="post" class="was-validated">
    <div class="form-group">
      <label for="toMail">받는사람 메일주소 : </label>
      <input type="text" class="form-control" id="toMail" placeholder="받는사람 메일주소를 입력하세요." name="toMail" required autofocus/>
      <div class="valid-feedback">정확한 메일주소를 입력하세요.</div>
      <div class="invalid-feedback">받는사람 메일주소는 필수 입력 항목입니다.</div>
    </div>
    <div class="form-group">
      <label for="title">메일제목 : </label>
      <input type="text" class="form-control" id="title" placeholder="메일 제목을 입력하세요." name="title" required/>
      <div class="valid-feedback">메일제목을 입력하세요.</div>
      <div class="invalid-feedback">메일제목은 필수 입력 항목입니다.</div>
    </div>
    <div class="form-group">
      <label for="content">메일내용 :</label>
      <textarea class="form-control" rows="5" id="content" name="content" required></textarea>
      <div class="valid-feedback">메일내용을 등록 하세요.</div>
      <div class="invalid-feedback">메일내용은 필수 입력 사항입니다.</div>
    </div>
    <button type="submit" class="btn btn-primary">메일보내기</button>
    <button type="reset" class="btn btn-primary">다시쓰기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/'">돌아가기</button>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>