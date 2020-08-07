<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="scrNo" value="${pageMaker.totRecCnt - ((cri.page-1) * cri.pageSize)}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>bList.jsp</title>
  <!-- 페이징처리 스타일시트  -->
  <style>
    #pagination {
      display: table;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<div class="container">
  <table class="table table-borderless">
    <tr>
      <td align="center"><font size="5"><b>게 시 판 리 스 트</b></font></td>
    </tr>
    <tr>
      <td align="right">
        <button type="button" onclick="location.href='${contextPath}/board/bInput?page=${cri.page}';" class="btn btn-primary">글쓰기</button>
      </td>
    </tr>
  </table>
  <table class="table table-hover">
    <thead class="thead-light">
      <tr align="center">
        <th>글번호</th>
        <th>글제목</th>
        <th>글쓴이</th>
        <th>글쓴날자</th>
        <th>조회수</th>
        <th>댓글수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${vos}">
        <jsp:useBean id="now" class="java.util.Date" />
        <fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
        <fmt:parseNumber var="today" value="${today}" integerOnly="true" />
        <c:set var="cdate" value="${fn:substring(vo.wdate,0,4)}${fn:substring(vo.wdate,5,7)}${fn:substring(vo.wdate,8,10)}"/>
        <fmt:parseNumber var="cdate" value="${cdate}"/>
        <tr align="center">
          <td>${scrNo}</td>
          <td>
            <c:if test="${(today - cdate) <= 1}">
              <a href="${contextPath}/board/bContent?idx=${vo.idx}&page=${pageMaker.criteria.page}">${vo.title}</a>
              <img src="${contextPath}/resources/images/new.gif"/>
            </c:if>
            <c:if test="${(today - cdate) > 1}">
              <a href="${contextPath}/board/bContent?idx=${vo.idx}&page=${pageMaker.criteria.page}">${vo.title}</a>
            </c:if>
          </td>
          <td>${vo.name}</td>
          <td>
            <c:if test="${(today - cdate) <= 1}">
              ${fn:substring(vo.wdate,11,19)}
            </c:if>
            <c:if test="${(today - cdate) > 1}">
              ${fn:substring(vo.wdate,0,10)}
            </c:if>
          </td>
          <td>${vo.readnum}</td>
          <td>${vo.replyNum}</td>
        </tr>
        <c:set var="scrNo" value="${scrNo - 1}"></c:set>
      </c:forEach>
    </tbody>
  </table>
</div>
<!-- 페이징 처리 시작 -->
<div id="pagination">
  <ul class="pagination">
    <li class="page-item <c:if test="${!(pageMaker.preBtn)}">disabled</c:if>">
      <a class="page-link" href="${contextPath}/board/bList?page=${pageMaker.blockStartPage-1}">◁◁</a>
    </li>
    <c:forEach var="i" begin="${pageMaker.blockStartPage}" end="${pageMaker.blockEndPage}">
      <li class="page-item <c:if test="${cri.page==i}">active</c:if>">
        <a href="${contextPath}/board/bList?page=${i}" class="page-link">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item <c:if test="${!(pageMaker.nextBtn)}">disabled</c:if>">
      <a class="page-link" href="${contextPath}/board/bList?page=${pageMaker.blockEndPage+1}">▷▷</a>
    </li>
  </ul>
</div>
<!-- 페이징 처리 끝 -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>