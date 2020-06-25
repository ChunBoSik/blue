<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/include/bs.jsp"/>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/menuStyle.jsp"/>
<script>
  function delMemberCheck() {
    var ans = confirm("정말로 탈퇴하시겠습니까?");
    if(ans) location.href="${contextPath}/member/mDelete";
  }
  function linkNo() {
    <c:if test="${snickname == null}">
      location.href="${contextPath}/member/mLogin";
    </c:if>
    <c:if test="${slevel >= 4}">
      alert("정회원 이상만 보실 수 있습니다.");
    </c:if>
  }
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="${contextPath}/">HOME</a>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <div class="dropdown">
      <a href="${contextPath}/guest/gList" class="dropbtn btn btn-Dark" role="button">방명록</a>
    </div>
    <c:choose>
      <c:when test="${slevel <= 4}">
        <div class="dropdown">
          <a href="${contextPath}/board/bList" class="dropbtn btn btn-Dark" role="button">게시판</a>
        </div>
      </c:when>
      <c:otherwise>
        <div class="dropdown">
          <a href="${contextPath}/member/mLogin" class="dropbtn btn btn-Dark" role="button">게시판</a>
        </div>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${slevel <= 3}">
        <div class="dropdown">
          <a href="${contextPath}/pds/pList" class="dropbtn btn btn-Dark" role="button">자료실</a>
        </div>
        <div class="dropdown">
          <a href="${contextPath}/photo/photoList" class="dropbtn btn btn-Dark" role="button">갤러리</a>
        </div>
        <div class="dropdown">
          <a href="#" class="dropbtn btn btn-Dark">학습방</a>
          <div class="dropdown-content">
            <a href="${contextPath}/ajax/ajaxTest">AjaxTest 1</a>
            <a href="#">AjaxTest 2</a>
            <a href="${contextPath}/study/checkTest">체크박스연습</a>
          </div>
        </div>
        <div class="dropdown">
          <a href="#" class="dropbtn btn btn-Dark">마이페이지</a>
          <div class="dropdown-content">
            <a href="${contextPath}/member/mList">회원리스트</a>
            <a href="${contextPath}/member/mUpdate">정보수정</a>
            <a href="javascript:delMemberCheck()">회원탈퇴</a>
          </div>
        </div>
        <div class="dropdown"> 
          <a href="${contextPath}/member/mLogout" class="dropbtn btn btn-Dark" role="button">로그아웃(${snickname})</a>
        </div>    
      </c:when>
      <c:otherwise>
        <div class="dropdown">
          <a href="javascript:linkNo();" class="dropbtn btn btn-Dark" role="button">자료실</a>
        </div>
        <div class="dropdown">
          <a href="javascript:linkNo();" class="dropbtn btn btn-Dark" role="button">갤러리</a>
        </div>
        
        <div class="dropdown">
          <a href="#" class="dropbtn btn btn-Dark">학습방</a>
          <div class="dropdown-content">
            <a href="javascript:linkNo();">AjaxTest 1</a>
            <a href="javascript:linkNo();">AjaxTest 2</a>
            <a href="${contextPath}/study/checkTest">체크박스연습</a>
          </div>
        </div>
        <c:if test="${snickname != null}">
          <div class="dropdown">
            <a href="#" class="dropbtn btn btn-Dark">마이페이지</a>
            <div class="dropdown-content">
              <a href="javascript:linkNo();">회원리스트</a>
              <a href="${contextPath}/member/mUpdate">정보수정</a>
              <a href="javascript:delCheck()">회원탈퇴</a>
            </div>
          </div>
          <div class="dropdown">
            <a href="${contextPath}/member/mLogout" class="dropbtn btn btn-Dark" role="button">로그아웃(${snickname})</a>
          </div>
        </c:if>    
      </c:otherwise>
    </c:choose>   
    <c:if test="${snickname == null}">
      <div class="dropdown">
        <a href="${contextPath}/member/mLogin" class="dropbtn btn btn-Dark" role="button">로그인</a>
      </div>
      <div class="dropdown">
        <a href="${contextPath}/member/mInput" class="dropbtn btn btn-Dark" role="button">회원가입</a>
      </div>
    </c:if>
    <c:if test="${slevel eq 0}">
      <div class="dropdown">
        <a href="#" class="dropbtn btn btn-Dark">관리자메뉴</a>
        <div class="dropdown-content">
          <a href="${contextPath}/admin/amList">회원관리</a>
          <a href="${contextPath}/guest/gList">방명록</a>
          <a href="${contextPath}/board/bList">게시판</a>
          <a href="${contextPath}/photo/photoList">갤러리</a>
          <a href="${contextPath}/admin/file/fList">파일관리</a>
        </div>
      </div>
    </c:if>
  </div>  
</nav>