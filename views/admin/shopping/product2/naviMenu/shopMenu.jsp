<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<p></p>
<div style="text-align:center">
| &nbsp; <a href="${contextPath}/shopping/admin/shopping/product2/shoppingList">신상품</a> &nbsp; | &nbsp;
<c:forEach var="catename" items="${catename}">
  <a href="${contextPath}/shopping/admin/shopping/product2/shoppingList?categoryname=${catename}">${catename}</a> &nbsp; |
</c:forEach>
</div>
