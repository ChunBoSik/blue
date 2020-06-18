<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mInput.jsp</title>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>
  <script>
    // 아이디 중복처리(aJax처리)
    $(document).ready(function() {
      $("#subm").attr("disabled","disabled");
      $(".idCheck").click(function() {
        if($("#mid").val().trim() == "") {
          alert("아이디를 입력하세요!");
          $("#mid").focus();
          return false;
        }
        else if($("#mid").val().length < 4 || $("#mid").val().length > 20) {
          alert("아이디는 4~20자 내외로 입력하세요!");
          $("#mid").focus();
          return false;
        }
        
        var query = {
            mid : $("#mid").val()
        };
        
        $.ajax({
          url : "${contextPath}/member/idCheck",
          type: "get",
          data : query,
          success : function(data) {
            if(data == 1) {
              alert("이미 사용중인 아이디 입니다.");
              $("#subm").attr("disabled","disabled");
              $("#mid").focus();
            }
            else {
              alert("사용 가능한 아이디 입니다.");
              $("#pwd").focus();
            }
          }
        }); // ajax종료
      });  // jQuery종료
      
      // 닉네임 중복체크(ajax처리)
      $(".nickCheck").click(function() {
        if($("#nickname").val().trim() == "") {
          alert("닉네임을 입력하세요!");
          $("#nickname").focus();
          return false;
        }
        
        var query = {
            nickname : $("#nickname").val()
        };
        
        $.ajax({
          url : "${contextPath}/member/nickCheck",
          type : "get",
          data : query,
          success : function(data) {
            if(data == 1) {
              alert("이미 사용중인 닉네임 입니다.");
              $("#subm").attr("disabled","disabled");
              $("#nickname").focus();
            }
            else {
              alert("사용 가능한 닉네임 입니다.");
              $("#subm").removeAttr("disabled");
            }
          }  // success 구문의 함수 종료
        });  //aJax종료
      });  // jQuery종료
      
    });  // 스크립트종료
  
    
    function fCheck() {
      var regExpId = /^[a-z|A-Z|0-9|_]*$/; //아이디 체크
      var regExpName = /^[가-힣]+$/;   // 이름은 한글이름만 가능
      var regExpTel = /^\d{2,3}-\d{3,4}-\d{4}$/;  // 전화번호체크
      var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      var mid=myform.mid.value;
      var pwd=myform.pwd.value;
      var tel=myform.tel1.value+"-"+myform.tel2.value+"-"+myform.tel3.value;
      var email=myform.email.value;
      var name=myform.name.value;
      var nickname=myform.nickname.value;
      
      if(mid.length<4 || mid.length>20 || !regExpId.test(mid)) {
        alert("아이디는 영문/숫자 4~20글자 이내로 작성하세요!");
        myform.mid.focus();
        return false;
      }
      else if(pwd.length<4) {
        alert("비밀번호는 4이상으로 작성하세요!");
        myform.pwd.focus();
        return false;
      }
      else if(!regExpName.test(name)) {
        alert("이름은 한글로 입력하세요!");
        myform.name.focus();
        return false;
      }
      else if(nickname=="" || nickname.length < 2 || nickname.length > 20) {
        alert("닉네임은 2~20글자 내외로 작성하세요!");
        myform.nickname.focus();
        return false;
      }
      else if(!regExpTel.test(tel)) {
        alert("전화번호를 확인하세요!");
        myform.tel2.focus();
        return false;
      }
      else if(email != "") {
        if(!regExpEmail.test(email)) {
          alert("이메일 형식을 확인 하세요!");
          myform.email.focus();
          return false;
        }
        else {
          updateSend();
        }
      }
      else {
        updateSend();
      }
      
      function updateSend() {
        var hobbys = "";
        for(i=0; i<6; i++) {
          if(myform.hobbys[i].checked==true) hobbys += myform.hobbys[i].value+"/";
        }
        
        myform.tel.value = tel;
        myform.hobby.value = hobbys;
        myform.submit();
      }
    }
  </script>
  <style>
   table, th, td {
     margin : 0px auto;
     width:600px;
     border: 1px solid #ccc;
     padding:12px;
     border-collapse:collapse;
   }
   th {
     text-align: center;
   }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<form name="myform" method="post">
  <table>
    <tr>
      <td align="center"><h2>회 원 가 입</h2></td>
    </tr>
  </table>
  <table>
    <tr>
      <th>아이디</th>
      <td>
        <input type="text" name="mid" id="mid" autofocus/>
        <button type="button" class="idCheck">아이디중복체크</button>
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pwd" id="pwd"/></td>
    </tr>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name"/></td>
    </tr>
    <tr>
      <th>별명</th>
      <td>
        <input type="text" name="nickname" id="nickname"/>
        <button type="button" class="nickCheck">닉네임중복체크</button>
      </td>
    </tr>
    <tr>
      <th>성별</th>
      <td>
        <input type="radio" name="gender" value="남자" checked/>남자
        <input type="radio" name="gender" value="여자"/>여자
      </td>
    </tr>
    <tr>
      <th>연락처</th>
      <td>
        <select name="tel1">
          <option value="">선택</option>
          <option value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="017">017</option>
          <option value="02">02</option>
          <option value="031">031</option>
          <option value="032">032</option>
          <option value="041">041</option>
          <option value="042">042</option>
          <option value="043">043</option>
          <option value="051">051</option>
          <option value="061">061</option>
        </select> -
        <input type="text" name="tel2" size=3 maxlength=4/> -
        <input type="text" name="tel3" size=3 maxlength=4/>
      </td>
    </tr>
    <tr>
      <th>취미</th>
      <td>
        <input type="checkbox" name="hobbys" value="등산"/>등산
        <input type="checkbox" name="hobbys" value="낚시"/>낚시
        <input type="checkbox" name="hobbys" value="승마"/>승마
        <input type="checkbox" name="hobbys" value="영화감상"/>영화감상
        <input type="checkbox" name="hobbys" value="바둑"/>바둑
        <input type="checkbox" name="hobbys" value="기타"/>기타
      </td>
    </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="email" size="50"/></td>
    </tr>
    <tr>
      <th>자기소개</th>
      <td><textarea rows="4" cols="50" name="content"></textarea></td>
    </tr>
    <tr>
      <th>정보공개</th>
      <td>
        <input type="radio" name="userinfor" value="OK" checked/>공개
        <input type="radio" name="userinfor" value="NO"/>비공개
      </td>
    </tr>
    <tr>
      <th colspan=2 align="center">
        <button type="button" id="subm" onclick="fCheck()">회원가입</button>
        <button type="reset">다시입력</button>
        <button type="button" onclick="location.href='${contextPath}/';">돌아가기</button>
      </th>
    </tr>
  </table>
  <input type="hidden" name="tel"/>
  <input type="hidden" name="hobby"/>
</form>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>