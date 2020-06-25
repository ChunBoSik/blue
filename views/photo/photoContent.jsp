<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoContent.jsp</title>
  <script>
    function delCheck(idx) {
      var ans = confirm("정말로 삭제하시겠습니까?");
      if(ans) {
        location.href="${contextPath}/photo/photoDel?idx="+idx;
      }
    }
  </script>
  <style>
    .cont {
      width: 80%;
      margin: 10px auto;
      border: 1px solid #aaa;
    }
    .cont-left {
      width:80%;
      text-align:left;
    }
    .cont-center {
      padding: 5px 10px;
      background-color: #ddd;
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="cont">
  <h2 style="text-align:center">포토갤러리 상세내역</h2>
  <div class="d-flex justify-content-center">
    <p class="p-2">분류 : ${ptVo.part}</p>
    <p class="p-2">제목 : ${ptVo.title}</p>
    <p class="p-2">올린이 : ${ptVo.nickname}</p>
  </div>
  <hr/>
  <div style="text-align:center">
    <c:forEach var="vo" items="${pgVos}">
      <span style="margin:5px;"><a href="${contextPath}/photo/${vo.rfname}" target=_blank><img src="${contextPath}/photo/${vo.rfname}" width="80px" vspace="5px"/></a></span>
    </c:forEach>
  </div>
  <div class="cont-center">
    <p>${ptVo.content}</p>
  </div>
</div>
<div class="container" align="center">
  <div>
    <c:if test="${snickname eq ptVo.nickname || slevel == 0}">
      <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/photo/photoUpd?idx=${ptVo.idx}&page=${cri.page}&backPart=${backPart}';">수정</button> &nbsp;
      <button type="button" class="btn btn-primary" onclick="delCheck(${ptVo.idx})">삭제</button> &nbsp;
    </c:if>
    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/photo/photoList?page=${cri.page}&part=${backPart}';">돌아가기</button> &nbsp;
    <button type="button" class="btn btn-primary" onclick="location.href='#';">Top</button>
  </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>