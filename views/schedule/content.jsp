<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="memory" value="${vo.getMemory()}"/>
<c:set var="title" value="${vo.getTitle()}"/>
<c:set var="content" value="${vo.getContent()}"/>
<c:set var="idx" value="${vo.idx}"/>
<c:if test="${idx eq null}"><c:set var="idx" value="0"/></c:if>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>content.jsp(일정 등록/조회/갱신)</title>
  <script>
    function fCheck(sw){
      var title = document.myform.title.value; //글제목
      var content = document.myform.content.value; //글제목
      
      if(title == "") {
        alert("제목을 입력하세요...");
        document.myform.title.focus();
      }
      else if(content == "") {
        alert("내용을 입력하세요...");
        document.myform.content.focus();
      }
      else {
        if(sw == "i") {
          document.myform.sw.value="input";
        }
        else {
          document.myform.sw.value="update";
        }
        document.myform.submit();
      }
    }
    
    function delCheck(idx) {
      var res = confirm("현재 일정을 삭제 할까요?");
      if(res)
        location.href="${contextPath}/schedule/scheduleDel?idx="+idx;
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <h2>일 정 관 리</h2><br/>
  <form name="myform" method="post">
    <div class="form-group">
      <label for="sdate">일정날짜</label>
      <input type="text" class="form-control" id="sdate" name="sdate" value="${ymd}" readonly />
    </div>
    <div class="form-group">
      <label for="mid">올린이</label>
      <input type="text" class="form-control" id="mid" name="mid" value="${smid}" readonly />
    </div>
    <div class="form-group">
      <label for="memory">분류 :</label>
      <select class="form-control" id="memory" name="memory">
        <option value="1" <c:if test="${memory eq '1'}"> selected </c:if>>모임</option>
        <option value="2" <c:if test="${memory eq '2'}"> selected </c:if>>업무</option>
        <option value="3" <c:if test="${memory eq '3'}"> selected </c:if>>가족</option>
        <option value="4" <c:if test="${memory eq '4'}"> selected </c:if>>친지</option>
        <option value="0" <c:if test="${memory eq '0'}"> selected </c:if>>기타</option>
      </select>
    </div>
    <div class="form-group">
      <label for="title">글제목 :</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="${title}" />
    </div>
    <div class="form-group">
      <label for="content">글내용 :</label>
      <textarea class="form-control" rows="4" id="content" name="content">${content}</textarea>
    </div>
    <c:if test="${vo.content eq null}">
      <!-- <button type="button" class="btn btn-primary" onclick="fCheck('i')">일정올리기</button> -->
      <input type="button" value="일정올리기" class="btn btn-primary" onclick="fCheck('i')"/>
    </c:if>
    <c:if test="${vo.content ne null}">
      <button type="button" class="btn btn-primary" onclick="fCheck('u')">일정수정</button>
    </c:if>
    <button type="reset" class="btn btn-primary">다시쓰기</button>
    <c:if test="${vo.title ne null}">
      <button type="button" class="btn btn-primary" onClick="delCheck('${vo.idx}')">삭제</button>
    </c:if>
    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/schedule/calendar'">돌아가기</button>
    <input type="hidden" name="idx" value="${idx}"/>
    <input type="hidden" name="sw" value="input"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>