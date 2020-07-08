<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>order.jsp</title>
  <script>
    /*
    function paymentCheck() {
      var payment = $("input[name=payment]").val();
      alert("결제 완료되었습니다.\n\n'주문조회'에서 확인하세요!");
      location.href="${contextPath}/study/shopping/paymentOk";
    }
    */
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
  <h1>결제 처리</h1>
  <hr>
  <%-- <p>${snickname}님께서 구매하신 상품이 주문 완료되었습니다.</p> --%>
  <p>이곳에서는 결제(카드/무통장)처리하는 곳입니다.</p>
  <form method="post">
    <p>
      - 결재선택 : &nbsp;
        <input type="radio" name="payment" value="카드" checked/>카드 &nbsp;
        <input type="radio" name="payment" value="무통장"/>무통장(농협:123-4567-890)
    </p>
    <p>
      <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/study/shopping/product';">계속쇼핑하기</button> &nbsp;
      <button type="submit" class="btn btn-secondary">결제하기</button>
    </p>
  </form>
  <hr>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>