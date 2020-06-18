<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mUpdate.jsp</title>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>
  <script>
    $(document).ready(function() {
      // 닉네임 중복체크(ajax처리)
      $(".nickCheck").click(function() {
        if($("#nickname").val().trim() == "") {
          alert("닉네임을 입력하세요!");
          $("#nickname").focus();
          return false;
        }
        else if($("#nickname").val() == "${vo.nickname}") {
          alert("기존 닉네임과 동일한 닉네임 입니다.");
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
      <td align="center">
        <h3>회 원 정 보 수 정</h3>
        <br/>(기존에 입력하신 비밀번호와 일치하면 정보를 수정할 수 있습니다.)
      </td>
    </tr>
  </table>
  <table>
    <tr>
      <th>아이디</th>
      <td>
        ${vo.mid} (${strlevel})
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pwd" id="pwd" placeholder="기존 비밀번호를 입력하세요."/></td>
    </tr>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name" value="${vo.name}"/></td>
    </tr>
    <tr>
      <th>별명</th>
      <td>
        <input type="text" name="nickname" id="nickname" value="${vo.nickname}"/>
        <button type="button" class="nickCheck">닉네임중복체크</button>
      </td>
    </tr>
    <tr>
      <th>성별</th>
      <td>
        <input type="radio" name="gender" value="남자" <c:if test="${vo.gender eq '남자'}">checked</c:if>/>남자
        <input type="radio" name="gender" value="여자" <c:if test="${vo.gender eq '여자'}">checked</c:if>/>여자
      </td>
    </tr>
    <tr>
      <th>연락처</th>
      <td>  <%-- ${fn:split(vo.tel,'-')[0]}-${fn:split(vo.tel,'-')[1]}-${fn:split(vo.tel,'-')[2]} --%>
        <c:set var="tel1" value="${fn:split(vo.tel,'-')[0]}"/>
        <select name="tel1">
          <option value="010" <c:if test="${tel1 eq '010'}">selected</c:if>>010</option>
          <option value="011" <c:if test="${tel1 eq '011'}">selected</c:if>>011</option>
          <option value="016" <c:if test="${tel1 eq '016'}">selected</c:if>>016</option>
          <option value="017" <c:if test="${tel1 eq '017'}">selected</c:if>>017</option>
          <option value="02"  <c:if test="${tel1 eq '02'}">selected</c:if>>02</option>
          <option value="031" <c:if test="${tel1 eq '031'}">selected</c:if>>031</option>
          <option value="032" <c:if test="${tel1 eq '032'}">selected</c:if>>032</option>
          <option value="041" <c:if test="${tel1 eq '041'}">selected</c:if>>041</option>
          <option value="042" <c:if test="${tel1 eq '042'}">selected</c:if>>042</option>
          <option value="043" <c:if test="${tel1 eq '043'}">selected</c:if>>043</option>
          <option value="051" <c:if test="${tel1 eq '051'}">selected</c:if>>051</option>
          <option value="061" <c:if test="${tel1 eq '061'}">selected</c:if>>061</option>
        </select> -
        <input type="text" name="tel2" size=3 maxlength=4 value="${fn:split(vo.tel,'-')[1]}"/> -
        <input type="text" name="tel3" size=3 maxlength=4 value="${fn:split(vo.tel,'-')[2]}"/>
      </td>
    </tr>
    <tr>
      <th>취미</th>
      <td>
        <input type="checkbox" name="hobbys" value="등산" <c:if test="${fn:contains(vo.hobby,'등산')}">checked</c:if>/>등산&nbsp;
        <input type="checkbox" name="hobbys" value="낚시" <c:if test="${fn:contains(vo.hobby,'낚시')}">checked</c:if>/>낚시&nbsp;
        <input type="checkbox" name="hobbys" value="승마" <c:if test="${fn:contains(vo.hobby,'승마')}">checked</c:if>/>승마&nbsp;
        <input type="checkbox" name="hobbys" value="영화감상" <c:if test="${fn:contains(vo.hobby,'영화감상')}">checked</c:if>/>영화감상&nbsp;
        <input type="checkbox" name="hobbys" value="바둑" <c:if test="${fn:contains(vo.hobby,'바둑')}">checked</c:if>/>바둑&nbsp;
        <input type="checkbox" name="hobbys" value="기타" <c:if test="${fn:contains(vo.hobby,'기타')}">checked</c:if>/>기타
      </td>
    </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="email" size="50" value="${vo.email}"/></td>
    </tr>
    <tr>
      <th>자기소개</th>
      <td><textarea rows="4" cols="50" name="content">${vo.content}</textarea></td>
    </tr>
    <tr>
      <th>정보공개</th>
      <td>
        <input type="radio" name="userinfor" value="OK" <c:if test="${vo.userinfor eq 'OK'}">checked</c:if>/>공개
        <input type="radio" name="userinfor" value="NO" <c:if test="${vo.userinfor eq 'NO'}">checked</c:if>/>비공개
      </td>
    </tr>
    <tr>
      <th colspan=2 align="center">
        <button type="button" id="subm" onclick="fCheck()">정보수정</button>
        <button type="reset">다시입력</button>
        <button type="button" onclick="location.href='${contextPath}/';">돌아가기</button>
      </th>
    </tr>
  </table>
  <input type="hidden" name="tel"/>
  <input type="hidden" name="hobby"/>
  <input type="hidden" name="mid" value="${vo.mid}"/>
  <input type="hidden" name="onickname" value="${vo.nickname}"/>
  <input type="hidden" name="opwd" value="${vo.pwd}"/>
</form>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>