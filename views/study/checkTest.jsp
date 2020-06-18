<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>checkTest.jsp</title>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
  <script>
    /*
    $(document).ready(function(){
      
    });
    */
    
    // 체크박스를 전체 선택/해제... 
    $(function(){
      $("#checkAll").click(function() {
        if($("#checkAll").prop("checked")) {
          /* $("input[type=checkbox]").prop("checked",true); */
          /* $(".chk").prop("checked",true); */
          $("input[name=chk]").prop("checked",true);
        }
        else {
          $("input[type=checkbox]").prop("checked",false);
        }
      });
    })
    
    // 체크박스의 선택 반전하기....
    $(function() {
      $("#reverseAll").click(function(){
        $(".chk").prop("checked",function() {
          return !$(this).prop("checked");
        });
      });
    })
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<form name="myform">
  <div style="padding:20px;">
    <h2>체크 박스 연습</h2>
    <p><br/></p>
    <hr/>
    <p>
      <input type="checkbox" class="chkTotal" id="checkAll"/>전체선택/해제 &nbsp;&nbsp;
      <input type="checkbox" class="chkRes" id="reverseAll"/>반전선택/해제
    </p>
    <hr/>
    <p><input type="checkbox" class="chk" name="chk" value="체크1"/>체크1</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크2"/>체크2</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크3"/>체크3</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크4"/>체크4</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크5"/>체크5</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크6"/>체크6</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크7"/>체크7</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크8"/>체크8</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크9"/>체크9</p>
    <p><input type="checkbox" class="chk" name="chk" value="체크10"/>체크10</p>
  </div>
</form>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>