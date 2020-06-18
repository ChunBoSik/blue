<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pInput.jsp</title>
  <script>
    function fCheck() {
      var title=myform.title.value;
      var file=myform.file.value;
      var ext=file.substring(file.lastIndexOf(".")+1); // 확장자 구한다.
      var uExt=ext.toUpperCase(); //확장자를 대문자로변환...
      
      if(file == "") {
        alert("파일명은 공백이 될수 없습니다.");
        return false;
      }
      else if(uExt != "ZIP" && uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "HWP" && uExt != "DOC" && uExt != "PPT" && uExt != "PPTX" && uExt != "XLSX") {
        alert("업로드 가능한 파일이 아닙니다.");
        return false;
      }
      else if(title == "") {
        alert("제목을 입력하세요.");
        myform.title.focus();
        return false;
      }
      else if(document.getElementById("file").value != "") {
        var fileSize = document.getElementById("file").files[0].size;
        var maxSize = 1024 * 1024 * 10; // 파일 용량은 10MByte로 제한
        document.myform.fsize.value = fileSize;
        if(fileSize > maxSize) {
          alert("첨부파일의 용량은 10MByte까지 가능합니다.");
          return false;
        }
        else {
          myform.submit();
        }
      }
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/><p>
<div class="container">
  <h2>자 료 올 리 기</h2><br/>
  <form name="myform" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <input type="file" name="file" id="file" class="form-control-file border" accept=".zip,.jpg,.gif,.png,.hwp,.doc,.ppt,.pptx,.xlsx" />
      (업로드 가능파일 : jpg, gif, png, zip , hwp , doc, pptx , xlsx)
    </div>
    <div class="form-group">
      <label for="nickname">올린이</label>
      <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="nickname" value="${snickname}"/>
    </div>
    <div class="form-group">
      <label for="title">글제목 :</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
    </div>
    <div class="form-group">
      <label for="content">글내용 :</label>
      <textarea class="form-control" rows="4" id="content" name="content"></textarea>
    </div>
    <div class="form-group">
      <label for="sel1">분류 :</label>
      <select class="form-control" id="sel1" name="part">
        <option value="학습" selected>학습</option>
        <option value="건강">건강</option>
        <option value="여행">여행</option>
        <option value="영화">영화</option>
        <option value="기타">기타</option>
      </select>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
               공개여부 : &nbsp; &nbsp;
        <label class="form-check-label" for="radio1">
          <input type="radio" class="form-check-input" id="radio1" name="opensw" value="공개" checked>공개
        </label>
      </div>
      <div class="form-check-inline">
        <label class="form-check-label" for="radio2">
          <input type="radio" class="form-check-input" id="radio2" name="opensw" value="비공개">비공개
        </label>
      </div>
    </div>
    <button type="button" class="btn btn-primary" onclick="fCheck()">자료올리기</button>
    <button type="reset" class="btn btn-primary">다시쓰기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/pds/pList'">돌아가기</button>
    <input type="hidden" name="fsize" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>