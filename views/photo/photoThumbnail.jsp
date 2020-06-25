<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="scrNo" value="${pageMaker.totRecCnt - ((cri.page-1) * cri.pageSize)}"/>
<c:set var="part" value="${part}"/>
<c:choose>
  <c:when test="${part eq null || part eq ''}">
    <c:set var="part" value="전체"/>
  </c:when>
  <c:otherwise>
    <c:set var="part" value="${part}"/>
  </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>photoThumbnail.jsp</title>
  <script>
    function partCheck() {
      var part = partForm.part.value;
      location.href="${contextPath}/photo/photoList?part="+part;
    }
  </script>
  <!-- 스타일 페이징 처리 -->
  <style>
    #pagination {
      display: table;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <table class="table table-borderless">
    <tr>
      <td colspan=2 align="center"><font size=6><b>포 토 갤 러 리</b></font>(${part})</td>
    </tr>
    <tr style="width:100%">
      <td style="width:15%; text-align:left">
        <form name="partForm">
          <select name="part" onChange="partCheck()" class="form-control">
            <option value="" <c:if test="${part == ''}"> selected </c:if>>전체</option>
            <option value="여행" <c:if test="${part=='여행'}"> selected </c:if>>여행</option>
            <option value="영화" <c:if test="${part=='영화'}"> selected </c:if>>영화</option>
            <option value="건강" <c:if test="${part=='건강'}"> selected </c:if>>건강</option>
            <option value="기타" <c:if test="${part=='기타'}"> selected </c:if>>기타</option>
          </select>
        </form>
      </td>
      <td style="width:85%; text-align:right">
        <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/photo/photoArray';">목록보기</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/photo/photoList';">리스트보기</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/photo/photoInput';">자료올리기</button>
      </td>
    </tr>
  </table><br/>
  <hr/>
  <div class="container" align="center">
    <c:set var="cnt" value="0"/>
    <c:forEach var="vo" items="${vos}">
      <c:set var="cnt" value="${cnt + 1}"/>
      <a href="${contextPath}/photo/photoContent?idx=${vo.idx}&page=${cri.page}&backPart=${part}"><img src="${contextPath}/photo/${vo.thumbnail}" width="100px" title="${vo.title}"/></a> &nbsp; &nbsp; &nbsp;
      <c:if test="${cnt eq 4}">
        <p><br/></p>
        <c:set var="cnt" value="0"/>
      </c:if>
    </c:forEach>
  </div>
  <hr/>
  <p><br/></p>
  <!-- 페이징 처리 시작 -->
  <!-- 
  <div id="pagination">
    <ul class="pagination">
      <li class="page-item <c:if test="${!(pageMaker.preBtn)}">disabled</c:if>">
        <a class="page-link" href="${contextPath}/photo/photoArray?page=${pageMaker.blockStartPage-1}&part=${part}">◁◁</a>
      </li>
      <c:forEach var="i" begin="${pageMaker.blockStartPage}" end="${pageMaker.blockEndPage}">
        <li class="page-item <c:if test="${cri.page==i}">active</c:if>">
          <a href="${contextPath}/photo/photoArray?page=${i}&part=${part}" class="page-link">${i}</a>
        </li>
      </c:forEach>
      <li class="page-item <c:if test="${!(pageMaker.nextBtn)}">disabled</c:if>">
        <a class="page-link" href="${contextPath}/photo/photoArray?page=${pageMaker.blockEndPage+1}&part=${part}">▷▷</a>
      </li>
    </ul>
  </div>
   -->
  <!-- 페이징 처리 끝 -->
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>