<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("cn", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>gList.jsp</title>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
  <script>
    function delCheck(idx) {
      var ans = confirm("정말 삭제 하시겠습니까?");
      if(ans)
        location.href="${contextPath}/guest/gDel?idx="+idx;
    }
    function gSelectDelCheck(idx) {
      var ans = confirm("선택된 항목을 정말 삭제 하시겠습니까?");

      if(ans) {
        var delItems = "";
        for(i=0; i<myform.chk.length ; i++) {
          if(myform.chk[i].checked==true) delItems += myform.chk[i].value+"/";
        }
        
        // alert("선택된 항목 목록값? " + delItems);
        myform.delItems.value = delItems;
        myform.submit();
      }
    }
    
    
    // 체크박스를 이용한 자료의 삭제
    // 전체 선택 / 취소
    $(function(){
      $("#checkAll").click(function(){
        if($("#checkAll").prop("checked")) {
          $(".chk").prop("checked", true);
        }
        else {
          $(".chk").prop("checked", false);
        }
      });
    })
    
    // 선택항목의 반전
    $(function() {
      $("#reverseAll").click(function() {
        $(".chk").prop("checked", function() {
          return !$(this).prop("checked");
        });
      });
    })
  </script>
  <!-- 페이징처리 스타일시트  -->
  <style>
    #pagination {
      display: table;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<form name="myform" method="post">
  <div class="container">
    <table class="table table-borderless">
      <tr>
        <td align="center" colspan=2><font size=5><b>방명록 리스트</b></font></td>
      </tr>
      <tr>
        <td align="left">
          <c:if test="${slevel eq 0}">
            <input type="checkbox" id="checkAll"/>전체선택/해제 , &nbsp;&nbsp;
            <input type="checkbox" id="reverseAll"/>선택반전 , &nbsp;&nbsp;
            <input type="button" value="선택항목삭제" onclick="gSelectDelCheck()"/>
          </c:if>
        </td>
        <td align="right"><a href="${contextPath}/guest/gInput?page=${cri.page}" class="btn btn-success">글쓰기</a></td>
      </tr>
    </table>
    <c:forEach var="vo" items="${vos}">
      <table class="table table-borderless">
        <tr>
          <td class="table-active" align="left">방문번호 : ${vo.idx}
            <c:if test="${slevel == 0}">
              <a href="javascript:delCheck('${vo.idx}')" class="btn btn-success">삭제</a>
              <input type="checkbox" class="chk" name="chk" value="${vo.idx}"/>
            </c:if>
          </td>
          <td class="table-active" align="right">방문자IP : ${vo.hostip}</td>
        </tr>
      </table>
      <table class="table table-bordered">
        <tr>
          <th class="table-active" width="15%">성명</th>
          <td>${vo.name}</td>
          <th class="table-active" width="15%">전자우편</th>
          <td>${vo.email}</td>
        </tr>
        <tr>
          <th class="table-active" width="15%">방문날짜</th>
          <td>${vo.vdate}</td>
          <th class="table-active" width="15%">홈페이지</th>
          <td>${vo.homepage}</td>
        </tr>
        <tr>
          <th class="table-active">방문소감</th>
          <td colspan=3>${fn:replace(vo.content,cn,"<br/>")}</td>
        </tr>
      </table>
      <p><br/></p>
    </c:forEach>
  </div>
  <input type="hidden" name="delItems"/>
</form>
<!-- 페이징 처리 시작 -->
<div id="pagination">
  <ul class="pagination">
    <li class="page-item <c:if test="${!(pageMaker.preBtn)}">disabled</c:if>">
      <a class="page-link" href="${contextPath}/guest/gList?page=${pageMaker.blockStartPage-1}">◁◁</a>
    </li>
    <c:forEach var="i" begin="${pageMaker.blockStartPage}" end="${pageMaker.blockEndPage}">
      <li class="page-item <c:if test="${cri.page==i}">active</c:if>">
        <a href="${contextPath}/guest/gList?page=${i}" class="page-link">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item <c:if test="${!(pageMaker.nextBtn)}">disabled</c:if>">
      <a class="page-link" href="${contextPath}/guest/gList?page=${pageMaker.blockEndPage+1}">▷▷</a>
    </li>
  </ul>
</div>
<!-- 페이징 처리 끝 -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>