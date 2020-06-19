<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="scrNo" value="${pageMaker.totRecCnt - ((cri.page-1) * cri.pageSize)}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pList.jsp</title>
  <script>
    function partCheck() {
      var part = partForm.part.value;
      location.href="${contextPath}/pds/pList?part="+part;
    }
    
    function nWin(idx) {
      var url = "${contextPath}/pds/pContent?idx="+idx;
      var winX = 500;
      var winY = 400;
      var x = (window.screen.width)/2 - winX/2;
      var y = (window.screen.height)/2 - winY/2;
      
      window.open(url,"pdsWin","width="+winX+",height="+winY+",left="+x+",top="+y);
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
      <td colspan=2 align="center"><font size=6><b>자 료 실 리 스 트</b></font></td>
    </tr>
    <tr style="width:100%">
      <td style="width:15%; text-align:left">
        <form name="partForm">
          <select name="part" onChange="partCheck()" class="form-control">
            <option value="" <c:if test="${part == ''}"> selected </c:if>>전체</option>
            <option value="학습" <c:if test="${part=='학습'}"> selected </c:if>>학습</option>
            <option value="건강" <c:if test="${part=='건강'}"> selected </c:if>>건강</option>
            <option value="여행" <c:if test="${part=='여행'}"> selected </c:if>>여행</option>
            <option value="영화" <c:if test="${part=='영화'}"> selected </c:if>>영화</option>
            <option value="기타" <c:if test="${part=='기타'}"> selected </c:if>>기타</option>
          </select>
        </form>
      </td>
      <td style="width:85%; text-align:right">
        <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/pds/pInput';">자료올리기</button>
      </td>
    </tr>
  </table><br/>
  <table class="table table-hover">
    <thead class="thead-light">
      <tr align="center">
        <th>번호</th>
        <th>자료제목</th>
        <th>올린이</th>
        <th>올린날짜</th>
        <th>파일명(용량)</th>
        <th>분류</th>
        <th>다운수</th>
        <th>다운로드</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${vos}">
        <tr align="center">
          <td>${scrNo}</td>
          <td>
            <a href="javascript:nWin('${vo.idx}')">${vo.title}</a>
          </td>
          <td>${vo.nickname}</td>
          <td>${vo.fdate}</td>
          <td>${vo.fname}(
            <c:set var="fsize" value="${vo.fsize}"/>
              <c:choose>
                <c:when test="${fsize>=1024}">
                  <c:set var="fsize" value="${fsize/1024}"/>
                  <fmt:formatNumber value="${fsize}" pattern=".00"/>KB
                </c:when>
                <c:otherwise>
                  ${fsize}Byte
                </c:otherwise>
              </c:choose>
            
            )</td>
          <td>${vo.part}</td>
          <td>${vo.downnum}</td>
          <td>
            <c:set var="opensw" value="${vo.opensw}"/>
            <c:choose>
              <c:when test="${opensw eq '공개' || slevel eq 0 || snickname eq vo.nickname}">
                <a href="${contextPath}/pds/pDown?idx=${vo.idx}&fname=${vo.fname}&rfname=${vo.rfname}">다운</a>
              </c:when>
              <c:otherwise>
                [비공개]
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
        <c:set var="scrNo" value="${scrNo-1}"/>
      </c:forEach>
    </tbody>
  </table>
  <p><br/></p>
  <!-- 페이징 처리 시작 -->
  <div id="pagination">
    <ul class="pagination">
      <li class="page-item <c:if test="${!(pageMaker.preBtn)}">disabled</c:if>">
        <a class="page-link" href="${contextPath}/pds/pList?page=${pageMaker.blockStartPage-1}&part=${part}">◁◁</a>
      </li>
      <c:forEach var="i" begin="${pageMaker.blockStartPage}" end="${pageMaker.blockEndPage}">
        <li class="page-item <c:if test="${cri.page==i}">active</c:if>">
          <a href="${contextPath}/pds/pList?page=${i}&part=${part}" class="page-link">${i}</a>
        </li>
      </c:forEach>
      <li class="page-item <c:if test="${!(pageMaker.nextBtn)}">disabled</c:if>">
        <a class="page-link" href="${contextPath}/pds/pList?page=${pageMaker.blockEndPage+1}&part=${part}">▷▷</a>
      </li>
    </ul>
  </div>
  <!-- 페이징 처리 끝 -->
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>