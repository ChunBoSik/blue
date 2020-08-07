<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>리뷰쓰기</title>
  
  <script>
    function fCheck(){
      var score = document.myform.score.value;
      var comment = document.myform.comment.value;
      
      if(score==""){
        alert("평점을 선택해주세요.");
        return false;
      }
      else if(comment==""){
        alert("리뷰내용을 입력하세요.");
        return false;
      }
      else {
        document.myform.submit();
      }
    }
  
  </script>
</head>
<body>
<%@include file="./naviMenu/mypagenav.jsp" %>
<p><br/></p>
<div class="container">
    <form name="myform" method="post">
      <div class="form-group">
        <label for="product">상품</label>
        <input type="text" class="form-control" value="${product }" readonly/>
      </div>      
   
      <div class="form-group">
        <label for="score">평점</label><br/>
          <span style="margin-right:18px;"><input type="radio" name="score" value="5" checked />&nbsp;&nbsp;<img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/> &nbsp;</span>
          <span style="margin-right:18px;"><input type="radio" name="score" value="4"  />&nbsp;&nbsp;<img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/></span>
          <span style="margin-right:18px;"><input type="radio" name="score" value="3"  />&nbsp;&nbsp;<img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/></span>
          <span style="margin-right:18px;"><input type="radio" name="score" value="2"  />&nbsp;&nbsp;<img src="${contextPath }/images/star.gif"/><img src="${contextPath }/images/star.gif"/></span>
          <span style="margin-right:18px;"><input type="radio" name="score" value="1"  />&nbsp;&nbsp;<img src="${contextPath }/images/star.gif"/></span>
      </div> 
<!--       
      <div class="form-group">
        <label for="score">평점</label>
        <select id="score" name="score" class="form-control">
            <option value="">평점을 선택하세요</option>
            <option value="5">★★★★★</option>
            <option value="4">★★★★</option>
            <option value="3">★★★</option>
            <option value="2">★★</option>
            <option value="1">★</option>
        </select>
      </div>
         -->
      <div class="form-group">
        <label for="comment">리뷰내용</label> 
        <textarea class="form-control" rows="5" id="comment" name="comment" required></textarea>
      </div>
    <input type="hidden" name="orderIdx" value="${orderIdx }"/>
    <input type="hidden" name="nickname" value="${snickname }"/>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">리뷰등록</button>
    </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>