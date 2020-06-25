<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoUpd.jsp</title>
  <script src="${contextPath}/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/><p>
<div class="container">
  <h2>포토 갤러리</h2><br/>
  <p>포토갤러리에 예쁜 글과 사진을 남겨주세요...</p>
  <form name="myform" method="post" class="was-validated">
    <div class="form-group">
           올린이 : ${ptVo.nickname}
    </div>
    <div class="form-group">
      <label for="sel1">분류 :</label>
      <select class="form-control" id="part" name="part">
        <option value="여행" <c:if test="${ptVo.part eq '여행'}">selected</c:if>>여행</option>
        <option value="영화" <c:if test="${ptVo.part eq '영화'}">selected</c:if>>영화</option>
        <option value="건강" <c:if test="${ptVo.part eq '건강'}">selected</c:if>>건강</option>
        <option value="기타" <c:if test="${ptVo.part eq '기타'}">selected</c:if>>기타</option>
      </select>
    </div>
    <div class="form-group">
      <label for="title">사진제목 :</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="${ptVo.title}" required/>
      <div class="valid-feedback">사진제목을 입력하세요.</div>
      <div class="invalid-feedback">사진제목은 필수 입력 항목입니다.</div>
    </div>
    <div class="form-group">
      <label for="content">상세내역 :</label>
      <textarea class="form-control" rows="4" id="CKEDITOR" name="content" required>${ptVo.content}</textarea>
      <div class="valid-feedback">상세내역 사진을 등록 하세요.</div>
      <div class="invalid-feedback">갤러리에 사진 1장 이상은 필수 입력 사항입니다.</div>
    </div>
    <script>
      CKEDITOR.replace("content",{
        filebrowserUploadUrl: "${contextPath}/photo/photoUpload",width:'100%',height:'500px'
      });
    </script>
    <button type="submit" class="btn btn-primary">수정하기</button>
    <button type="reset" class="btn btn-primary">다시쓰기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/photo/photoContent?idx=${ptVo.idx}&page=${cri.page}&backPart=${backPart}'">돌아가기</button>
    <input type="hidden" name="fsize" />
    <input type="hidden" name="idx" value="${ptVo.idx}"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>