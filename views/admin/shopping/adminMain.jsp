<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>관리자 프레임</title>
  <frameset cols="180px,*">
    <frame src="${contextPath}/shopping/admin/shopping/left" name="left">
    <frame src="${contextPath}/shopping/admin/shopping/right" name="right">
  </frameset>
</head>
<body>
</body>
</html>