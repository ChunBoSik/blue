<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pList.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <table class="table table-borderless">
    <tr>
      <td><font size=6><b>자 료 실 리 스 트</b></font></td>
    </tr>
    <tr>
      <td>
        <form name="partForm">
          <select name="part" onChange="partCheck()" class="form-control">
            <option value="">전체</option>
            <option value="학습">학습</option>
            <option value="건강">건강</option>
            <option value="여행">여행</option>
            <option value="영화">영화</option>
            <option value="기타">기타</option>
          </select>
        </form>
      </td>
      <td>
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
          <td>${vo.idx}</td>
          <td>${vo.title}</td>
          <td>${vo.nickname}</td>
          <td>${vo.fdate}</td>
          <td>${vo.fname}(${vo.fsize})</td>
          <td>${vo.part}</td>
          <td>${vo.downnum}</td>
          <td><a href="">다운</a></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <p><br/></p>
  <!-- 아래로 페이징 처리....하세요... -->
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>