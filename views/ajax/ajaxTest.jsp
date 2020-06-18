<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>ajaxTest.jsp</title>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>
  <script>
    $(function() {
      $("#do").change(function(){
        var data = $(this).val();
        $.ajax({
          //async:true,
          type:"post",
          data:data,
          //dataType:"json",
          contentType:"application/json; charset=UTF-8",
          success : function(data) {
            var str = "";
            str += "<option value=''>도시선택</option>";
            for(var i=0; i<data.city.length; i++) {
              str += "<option>"+data.city[i]+"</option>";
            }
            $("#city").html(str);
          }
        });
      })
    })
    function fCheck() {
      var jiyuk = $("#do").val();  // document.myform.do.value;
      var city = $("#city").val();

      if(jiyuk == "" || city == "") {
        alert("지역/도시/를 선택하세요!");
      }
      else {
        alert("선택하신 지역/도시는? " + jiyuk + " / " + city);
      }
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<h2>도시 선택</h2>
<form method="post">
  <select id="do">
    <option value="">지역선택</option>
    <option value="서울">서울</option>
    <option value="경기">경기</option>
    <option value="충북">충북</option>
    <option value="충남">충남</option>
  </select>
  <select id="city">
    <option value="">도시선택</option>
  </select>
  <input type="button" value="선택" onClick="fCheck()"/>
</form>
<p><br/></p>
<p><a href="${contextPath}/ajax/goods">상품관리</a></p>
<p><a href="${contextPath}/">홈으로</a></p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>