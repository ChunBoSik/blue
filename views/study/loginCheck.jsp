<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>loginCheck.jsp</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
  <script>
    $(document).ready(function(){
      // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
      var checkMid = getCookie("checkMid");
      $("input[name='checkMid']").val(checkMid); 
       
      if($("input[name='checkMid']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
          $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
      }
       
      $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
          if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
              var checkMid = $("input[name='checkMid']").val();
              setCookie("checkMid", checkMid, 7); // 7일 동안 쿠키 보관
          }else{ // ID 저장하기 체크 해제 시,
              deleteCookie("checkMid");
          }
      });
       
      // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
      $("input[name='checkMid']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
          if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
              var mid = $("input[name='checkMid']").val();
              setCookie("checkMid", checkMid, 7); // 7일 동안 쿠키 보관
          }
      });
    });
     
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
    
    function fCheck() {
      if(myform.checkMid.value=="") {
        alert("아이디를 입력하세요!");
        myform.checkMid.focus();
        return false;
      }
      else {
        if($("input:checkbox[name=idSaveCheck]").is(":checked") == true) {
        alert("'"+myform.checkMid.value+"' 아이디가 저장되었습니다.");
        }
        else {
          alert("아이디가 저장되지 안습니다.");
        }
      }
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<h3 style="text-align:center">아이디 저장 연습</h3>
<p></p>
<div style="margin:0px auto; padding:20px; border:1px solid #ccc; width:350px;">
  <form name="myform" method="post">
    <p>아 이 디 &nbsp;: <input type="text" name="checkMid" autofocus/></p>
    <p>비밀번호 : <input type="password" name="checkPwd"/></p>
    <p><input type="checkbox" name="idSaveCheck" id="idSaveCheck"/>아이디 저장</p>
    <p>
      <input type="button" value="전 송" onclick="fCheck()"/>
      <input type="reset" value="다시입력"/>
    </p>
  </form>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>