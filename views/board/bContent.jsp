<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("cn", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>bContent.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script>
    function delCheck() {
      var ans = confirm("현 게시글을 삭제 하시겠습니까?");
      if(ans) {
        //myform.action = "수정루틴";
        myform.submit();
      }
    }
    
    // 댓글 입력체크
    function reCheck() {
      var content = contform.content.value;
      if(content == "") {
        alert("댓글을 입력하세요!");
        contform.content.focus();
      }
      else {
        contform.submit();
      }
    }
    
    // 댓글삭제처리(Ajax처리)
    $(document).ready(function() {
      $(".replyDel").click(function(){
        var ans = confirm("정말로 댓글을 삭제하시겠습니까?");
        if(!ans) return false;
        
        // aJax를 이용한 댓글처리
        var query = {idx : $("#idx").val()};
        
        $.ajax({
          url : "${contextPath}/board/replyDel",
          type : "get",
          data : query,
          success : function(data) {
            if(data == 1) {
              alert("댓글이 삭제되었습니다.");
              location.reload();
            }
          }
        }); // aJax종료
      });   //jQuery 종료
    });     // 스크립트 종료
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<div class="container" style="text-align:center">
  <form name="myform" method="post">
    <table class="table table-borderless">
      <tr>
        <td align="center"><font size="5"><b>게시글 내용보기</b></font></td>
      </tr>
    </table>
    <table class="table table-borderless">
      <tr>
        <td align="left">글 조회수 : ${vo.readnum}</td>
        <td align="right">IP : ${vo.hostip}</td>
      </tr>
    </table>
    <table class="table table-bordered">
        <tr align="center">
          <th class="table-active">글제목</th>
          <td colspan=3 align="left">${vo.title}</td>
        </tr>
        <tr align="center">
          <th class="table-active">글쓴이</th>
          <td>${vo.name}</td>
          <th class="table-active">전자우편</th>
          <td>${vo.email}</td>
        </tr>
        <tr align="center">
          <th class="table-active">글쓴날짜</th>
          <td>${vo.wdate}</td>
          <th class="table-active">홈페이지</th>
          <td>${vo.homepage}</td>
        </tr>
        <tr align="center">
          <th class="table-active">글내용</th>
          <td colspan=3 align="left">${fn:replace(vo.content,cn,"<br/>")}</td>
        </tr>
        <tr align="left">
          <th class="table-active">비밀번호</th>
          <td colspan=3><input type="password" name="pwd"/></td>
        </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx}"/>
    <input type="hidden" name="page" value="${page}"/>
  </form>
  <p><br/></p>
  <button type="button" class="btn btn-primary" onclick="javascript:delCheck();">삭제</button> &nbsp;
  <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/board/bList?page=${page}';">돌아가기</button> &nbsp;
  <c:choose>
    <c:when test="${contSw eq 'no' || contSw eq null || contSw eq ''}">
      <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/board/bContent?page=${page}&idx=${vo.idx}&contSw=yes';">댓글보기</button> &nbsp;
    </c:when>
    <c:otherwise>
      <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/board/bContent?page=${page}&idx=${vo.idx}&contSw=no';">댓글가리기</button>
    </c:otherwise>
  </c:choose>
  <!-- 댓글처리(목록) -->
  <p><br/></p>
  <table class="table table-hover">
    <c:if test="${contSw eq 'yes'}">
      <thead>
      <tr bgcolor="#ddd">
        <th>작성자</th>
        <th>댓글내용</th>
        <th>Ip</th>
        <th>작성날짜</th>
      </tr>
      </thead>
    </c:if>
    <tbody>
    <c:forEach var="cvo" items="${bContVos}">
      <tr>
        <td>${cvo.nickname}</td>
        <td align="left">${fn:replace(cvo.content,cn,'<br/>')}</td>
        <td>${cvo.hostip}</td>
        <td>
          ${cvo.wdate}
          <c:if test="${snickname eq cvo.nickname || slevel == 0}">
            <button type="button" class="replyDel btn btn-primary btn-sm" id="idx" value="${cvo.idx}">삭제</button>
          </c:if>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <!-- 댓글 입력처리 -->
  <form name="contform" method="post" action="${contextPath}/board/bContInput">
    <table class="table" style="width:100%">
      <tr>
        <td style="width:90%">
          <textarea class="form-control" rows="4" name="content"></textarea>
        </td>
        <td style="width:10%; padding:10px">
          <input type="button" value="댓글달기" onclick="reCheck()"/><br/>
          <input type="text" class="form-control" name="nickname" readonly size="10" value="${snickname}"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="page" value="${page}"/>
    <input type="hidden" name="board_idx" value="${vo.idx}"/>
  </form>
  <!-- 이전글/다음글처리 -->
  <div class="table table-borderless" style="text-align:left">
    <c:if test="${preVoIdx == null}">
      이전글 >> ${preVoTitle}
    </c:if>
    <c:if test="${preVoIdx != null}">
      <a href="${contextPath}/board/bContent?idx=${preVoIdx}&page=${page}">이전글 >> ${preVoTitle}</a>
    </c:if>
  </div>
  <div class="table table-borderless" style="text-align:left">
    <c:if test="${nextVoIdx == null}">
      다음글 >> ${nextVoTitle}
    </c:if>
    <c:if test="${nextVoIdx != null}">
      <a href="${contextPath}/board/bContent?idx=${nextVoIdx}&page=${page}">다음글 >> ${nextVoTitle}</a>
    </c:if>
  </div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>