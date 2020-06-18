<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>goods.jsp(상품검색)</title>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>
  <script>
    $(function() {
      $("#product1").change(function() {
        var product1 = $(this).val();
        $.ajax({
          type:"post",
          //url:"goods",
          data:product1,
          contentType:"application/json; charset=UTF-8",
          success : function(data) {
            var str="";
            str += "<option value=''>중분류</option>";
            for(var i=0; i<data.product2.length; i++) {
              str += "<option>"+data.product2[i].product2+"</option>";
            }
            $("#product2").html(str);
          } 
        })
      });
      
      $("#product2").change(function() {
        var product2 = $(this).val();
        $.ajax({
          type:"post",
          url:"goods2",
          data:product2,
          contentType:"application/json; charset=UTF-8",
          success : function(data) {
            var str="";
            str += "<option value=''>소분류</option>";
            for(var i=0; i<data.product3.length; i++) {
              str += "<option>"+data.product3[i].product3+"</option>";
            }
            $("#product3").html(str);
          } 
        })
      });
    })
    
    function fCheck() {
      var product1 = $("#product1").val();
      var product2 = $("#product2").val();
      var product3 = $("#product3").val();

      if(product1 == "" || product2 == "") {
        alert("'대/중'를 선택하세요!");
      }
      else {
        alert("선택하신 '대/중/소'는? " + product1 + " / " + product2 + " / " + product3);
      }
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<h2>상품 관리</h2>
<form method="post">
  <select id="product1">
    <option value="">대분류</option>
    <c:forEach var="vo" items="${vos}">
      <option>${vo.product1}</option>
    </c:forEach>
  </select>
  -
  <select id="product2">
    <option>중분류</option>
  </select>
  -
  <select id="product3">
    <option>소분류</option>
  </select>
  <input type="button" value="선택" onclick="fCheck()"/>
</form>
<p><br/></p>
<p>
  <a href="${contextPath}/ajax/ajaxTest">도시선택</a>
  <a href="${contextPath}/">홈으로</a>
</p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>