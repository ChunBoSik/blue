<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>productList.jsp</title> 
  <script>
    function partCheck() {
      var part = document.partForm.part.value;
      location.href="${contextPath}/admin/productList?part="+part;
    }
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    [class ~= fontsize]{
      font-size:15px;
    }
    h2 {
      text-align:center;
    }
    table {
      width:100%;
      border:1px solid #ccc;
    }
    .tblr {
      text-align:right;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/><p>
<div class="container fontsize">
  <table style="border:0px;">
    <tr>
      <td>
        <form name="partForm" action="${contextPath}/admin/productList">
          <select name="part" size=1 onChange="partCheck()" class="form-control">
            <option value="페이스" <c:if test="${part eq '페이스'}">selected</c:if>>페이스</option>
            <option value="립" <c:if test="${part eq '립'}">selected</c:if>>립</option>
            <option value="아이" <c:if test="${part eq '아이'}">selected</c:if>>아이</option>
            <option value=치크 <c:if test="${part eq '치크'}">selected</c:if>>치크</option>
            <option value="스킨케어" <c:if test="${part eq '스킨케어'}">selected</c:if>>스킨케어</option>
            <option value="툴" <c:if test="${part eq '툴'}">selected</c:if>>툴</option>
            <option value="향수/네일" <c:if test="${part eq '향수/네일'}">selected</c:if>>향수/네일</option>
          </select>
        </form>
      </td>
    </tr>
  </table><br/>
  <table class="table table-hover">
    <thead class="thead-dark">
      <!-- 메인 이미지 삽입 -->
    </thead>
  <tbody>
  <c:forEach var="vo" items="${vos}" varStatus="status">
    <tr>
      <td>${status.index+1}</td>
      <td><a class="atag" href="${contextPath}/shop/sContent?mfname=${vo.mfname}&idx=${vo.idx}">${vo.title}</a></td>
      <td>${vo.price}</td>
      <td>${vo.p_option}</td>
    </tr>
  </c:forEach>
  </tbody>
  </table>
</div>
  <p><br/></p>
  
  <!-- 페이징처리 -->
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>
