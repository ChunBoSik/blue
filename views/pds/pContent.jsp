<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("cn", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pContent.jsp</title>
  <%@ include file="../include/bs.jsp" %>
</head>
<body>
<!-- The Modal -->
<!-- <div class="modal fade" id="myModal"> -->
<div class="modal-dialog">
  <div class="modal-content">
  
    <!-- Modal Header -->
    <div class="modal-header">
      <h4 class="modal-title">${vo.title}</h4>
      <button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
    </div>
    
    <!-- Modal body -->
    <c:if test="${vo.opensw == '공개' || slevel == 0 || snickname == vo.nickname}">
      <div class="modal-body">
        - 파일명 :<br/>${vo.fname}
        <hr/>
        <p>상세내역<br/>
          ${fn:replace(vo.content,cn,"<br/>")}
        </p>
        <hr/>
        <p>${contextPath}/pds/${vo.rfname}
          <c:set var="fileName" value="${fn:split(vo.fname,'.')}"/>
          <c:set var="extName" value="${fileName[fn:length(fileName)-1]}"/>
          <c:set var="extName" value="${fn:toLowerCase(extName)}"/>
          <c:if test="${extName eq 'jpg' || extName eq 'gif' || extName eq 'png'}">
            <img src="${contextPath}/pds/${vo.rfname}" width="430px"/>
          </c:if>
        </p>
        <!-- jstl 학습
        <p>원본파일명 : ${vo.fname}</p>
        <p>(배열)파일명 : <c:set var="fileName" value="${fn:split(vo.fname,'.')}"/>
           ${fileName}</p>
        <p>분리된 파일명1 : <c:set var="f1" value="${fileName[fn:length(fileName)-2]}"/>
           ${f1}</p>
        <p>분리된 파일명2 : ${fileName[fn:length(fileName)-1]}</p>
        <p>확장자 : <c:set var="extName" value="${fileName[fn:length(fileName)-1]}"/>
           ${extName}</p>
        <p>소문자 변환 확장자 : <c:set var="extName" value="${fn:toLowerCase(extName)}"/>
           ${extName}</p>
         -->
      </div>
    </c:if>
    <c:if test="${vo.opensw != '공개'}">
      <hr/>
      - 비공개 자료입니다.
      <hr/>
    </c:if>
    
    <!-- Modal footer -->
    <div class="modal-footer">
      <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="window.close()">창닫기</button>
    </div>
    
  </div>
</div>
</body>
</html>