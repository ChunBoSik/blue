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
  <title>주소</title>
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
				  <!-- 배송정보 -->
				  <div>  
				    <table class="table table-bordered">
				      <tr class="thead-light">
				        <th colspan=2 class="center">배송정보</th>
				      </tr>
				      <tr>
				        <td width="20%" class="center">이름</td>
				        <td>${vo.name }</td>
				      </tr>    
              <tr>
                <td class="center">우편번호</td>
                <td>${vo.zipcode }</td>
              </tr>    
              <tr>
                <td class="center">주소</td>
                <td>${vo.address }</td>
              </tr>    
				      <tr>
				        <td class="center">연락처</td>
				        <td>${vo.tel }</td>
				      </tr>    
				      <tr>
				        <td class="center">배송시<br/> 요청사항</td>
				        <td>${vo.request }</td>
				      </tr>    
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