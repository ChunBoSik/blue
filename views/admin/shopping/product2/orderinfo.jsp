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
  <title>주문정보</title>
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

  .lineheight{
    line-height: 130px;
  }
  
  .vtd{
    vertical-align:middle;
    padding:30px;
  }
  
 
</style>
<body>
<div class="container">
<!-- The Modal -->
    <div class="modal-dialog  modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title">주문번호(${vo.idx}) 주문제품정보</h5>
          <button type="button" class="close" onClick="window.close()">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
				  <!-- 개별주문상품 테이블 -->
				  <div class="list">
				    <table class="table table-bordered" style="width:100%">
				    <thead class="thead-light">
				      <tr class="center">
				        <th width="60%">상품</th>
				        <th>총상품금액</th>
				        <th>주문상태</th>
				      </tr>
				    </thead>
				    <c:forEach var="pVo" items="${ProductVos }">
				    <tbody>
				      <tr class="center">
				        <td align="left" style="padding:20px;">
				          <div style="dispaly:inline;float:left;"><img src="${contextPath }/upload/${pVo.rfname}" width="120px" style="margin-right:10px;"/></div>
				          <div style="dispaly:inline;float:left;">
				            <p>${pVo.product }</p>
				            <p>${pVo.indiname }</p>
				            <p>수량 : ${pVo.optionNum } / <fmt:formatNumber value="${pVo.optionPrice}" pattern="#,###"/></p>
				          </div>
				        </td>
				        <td class="vtd">
				          <p class="lineheight"><fmt:formatNumber value="${pVo.productPrice}" pattern="#,###"/></p>
				        </td>
				        <td class="vtd">
				          <p class="lineheight">${vo.orderstate }</p>
				        </td>
				      </tr>
				    </tbody>
				    </c:forEach>
				    </table>  
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" onClick="window.close()">창닫기</button>
        </div>
      </div>
    </div>
  </div>  
</body>
</html>