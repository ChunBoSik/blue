<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("cn", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>결제정보</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
  .center{
    text-align:center;  
  }
 
</style>
<body>
<!-- The Modal -->
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title">주문번호(${vo.idx}) 배송지정보</h5>
          <button type="button" class="close" onClick="window.close()">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
				  <!-- 결제정보 -->
				  <div class="left">  
				    <table class="table table-bordered">
				      <tr class="thead-light">
				        <th colspan=2>결제정보</th>
				      </tr>
				      <tr>
				        <td>결제방식</td>
				        <td>
				          <c:if test="${vo.paymethod eq '1' }">신용카드</c:if>
				          <c:if test="${vo.paymethod eq '2' }">무통장입금</c:if>
				          <c:if test="${vo.paymethod eq '3' }">실시간계좌이체</c:if>
				          <c:if test="${vo.paymethod eq '4' }">휴대폰결제</c:if>
				        </td>
				      </tr>
              <tr>
                <td>배송비</td>
                <td><fmt:formatNumber value="${vo.post}" pattern="#,###"/></td>
              </tr>    
              <tr>
                <td>포인트차감(-)</td>
                <td>${vo.pointUse }</td>
              </tr>    
				      <tr>
				        <td>총결제금액</td>
				        <td><fmt:formatNumber value="${vo.totalPay}" pattern="#,###"/></td>
				      </tr>    
				      <c:if test="${vo.paymethod eq '1' }">
				        <tr>
				          <td>결제카드</td>
				          <td>${vo.card }</td>
				        </tr>    
				      </c:if>
				      <c:if test="${vo.paymethod eq '2' }">
				        <tr>
				          <td>입금은행</td>
				          <td>${vo.bank }</td>
				        </tr>    
				        <tr>
				          <td>입금자명</td>
				          <td>${vo.depositName }</td>
				        </tr>    
				      </c:if>  
				    </table>
				  </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" onClick="window.close()">창닫기</button>
        </div>
      </div>
    </div>
</body>
</html>