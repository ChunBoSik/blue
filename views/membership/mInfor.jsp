<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mInfor.jsp</title>
  <%@ include file="../include/bs.jsp" %>
</head>
<body>
<p><br/></p>
<!-- The Modal -->
  <!-- <div class="modal fade" id="myModal"> -->
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">${vo.nickname} (${vo.strlevel})</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
        </div>
        
        <!-- Modal body -->
        <c:if test="${vo.userinfor == 'OK' || slevel == 0}">
          <div class="modal-body">
            - 자기 소개 :<br/>
            ${fn:replace(vo.content,newLineChar,"<br/>")}
            <hr/>
            <p>취미 : ${vo.hobby}</p>
            <p>메일 : ${vo.email}</p>
          </div>
        </c:if>
        <c:if test="${vo.userinfor != 'OK'}">
          <hr/>
          - 비공개 회원입니다.
          <hr/>
        </c:if>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="window.close()">Close</button>
        </div>
        
      </div>
    </div>
  <!-- </div> -->

<%-- 
<p><br/></p>
<div style="text-align:center">
  <h2>${vo.title}</h2>
  <hr/>
  ${fn:replace(vo.content,newLineChar,"<br/>")}
  <hr/>
  <br/>
  <button type="button" onclick="window.close()">창닫기</button>
</div>
<p><br/></p>
 --%>
</body>
</html>