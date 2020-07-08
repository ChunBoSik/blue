<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>product.jsp</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script>
    function fCheck() {
      if(myform.product.value=="") {
        alert("상품을 선택하세요!!!");
      }
      else {
        myform.submit();
      }
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <h1>상품 구매하기</h1>
  <hr>
  <p>${snickname}님 구매 중이십니다.</p>
  <hr>
  <form name="myform" method="post">
    <select name="product">
      <option value="">상품선택</option>
      <option value="사과">사과</option>
      <option value="배">배</option>
      <option value="바나나">바나나</option>
      <option value="포도">포도</option>
      <option value="레몬">레몬</option>
      <option value="복숭아">복숭아</option>
    </select> &nbsp;
    <input type="button" value="장바구니담기" onclick="fCheck()"><br/>
    <hr/>
    <p><b>상품리스트(DB자료를 띄운다...)</b></p>
    <div class="row">
      <span class="col-sm-2">- 사과 :</span><span class="col-sm-10 big-success">500원</span><br/>
      <span class="col-sm-2">- 배 :</span><span class="col-sm-10">1000원</span><br/>
      <span class="col-sm-2">- 바나나 :</span><span class="col-sm-10">3500원</span><br/>
      <span class="col-sm-2">- 포도 :</span><span class="col-sm-10">5000원</span><br/>
      <span class="col-sm-2">- 레몬 :</span><span class="col-sm-10">1200원</span><br/>
      <span class="col-sm-2">- 복숭아 :</span><span class="col-sm-10">1300원</span>
    </div>
    <hr/>
    <p><button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/study/shopping/cart';">장바구니보기</button></p>
  </form>
  <p><br/></p>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>