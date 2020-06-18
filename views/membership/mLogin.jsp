<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mLogin.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="modal-dialog">
  <div class="modal-content">
  
  <div class="container" style="padding:30px">
    <h2>회원 로그인</h2>
    <p>회원 아이디와 비밀번호를 입력해 주세요</p>
    <form method="post" class="was-validated">
      <div class="form-group">
        <label for="mid">회원 아이디 :</label>
        <input type="text" class="form-control" name="mid" id="mid" placeholder="회원 아이디를 입력하세요" required autofocus/>
        <div class="valid-feedback">정확한 아이디를 입력하세요.</div>
        <div class="invalid-feedback">회원 아이디는 필수 입력사항입니다.</div>
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호 :</label>
        <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required/>
        <div class="valid-feedback">정확한 비밀번호를 입력하세요.</div>
        <div class="invalid-feedback">비밀번호는 필수 입력사항입니다.</div>
      </div>
      
      <button type="submit" class="btn btn-primary">인증하기</button>&nbsp;
      <button type="reset" class="btn btn-primary">취소</button>&nbsp;
      <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/';">돌아가기</button>&nbsp;
      <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/member/mInput';">회원가입</button>
    </form>
  </div>
  
  </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>