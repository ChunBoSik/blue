<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="scrNo" value="${pageMaker.totRecCnt - ((cri.page-1) * cri.pageSize)}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>amList.jsp</title>
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
  <script>
    function delOkCheck(idx) {
      var ans = confirm("정말 탈퇴 처리 하시겠습니까?");
      if(ans) location.href="${contextPath}/member/delOkCheck?idx="+idx;
    }
    function nWin(mid) {
      var url = "${contextPath}/member/mInfor?mid="+mid;
      var winX = 500;
      var winY = 400;
      var x = (window.screen.width)/2 - winX/2;
      var y = (window.screen.height)/2 - winY/2;
      
      window.open(url,"pdsWindow","width="+winX+", height="+winY+", left="+x+", top="+y);
    }
    
    // 선택된 항목만 삭제
    function mSelectDelCheck(idx) {
      var ans = confirm("선택된 회원이 DB에서 완전히 삭제됩니다.\n\n 정말 삭제 하시겠습니까?");

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
 
    function levelCheck(mid,level) {
      var ans = confirm("회원등급을 변경하시겠습니까?");
      if(ans) {
        location.href="${contextPath}/admin/levelCheck?mid="+mid+"&level="+level+"&page=${cri.page}"+"&pageSize=${cri.pageSize}";
      }
    }
 
    function pageSizeCheck() {
      var pageSize = pageSizeForm.pageSize.value;
      location.href="${contextPath}/admin/amList?pageSize="+pageSize;
    }
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
<p><br/></p>
<div class="container">
  <div style="text-align:center"><h2>전 체 회 원 리 스 트</h2></div>
  <br/>
  <table style="width:100%">
    <tr>
      <td>
        <c:if test="${slevel eq 0}">
          <input type="checkbox" id="checkAll"/>전체선택/해제 , &nbsp;&nbsp;
          <input type="checkbox" id="reverseAll"/>선택반전 , &nbsp;&nbsp;
          <input type="button" value="선택항목삭제" onclick="mSelectDelCheck()"/>
        </c:if>
      </td>
      <td align="right">
        <form name="pageSizeForm">
          출력건수 :<select name="pageSize" onChange="pageSizeCheck()">
            <option value="5" <c:if test="${cri.pageSize==5}">selected</c:if>>5건</option>
            <option value="10" <c:if test="${cri.pageSize==10}">selected</c:if>>10건</option>
            <option value="15" <c:if test="${cri.pageSize==15}">selected</c:if>>15건</option>
            <option value="20" <c:if test="${cri.pageSize==20}">selected</c:if>>20건</option>
          </select>
        </form>
      </td>
    </tr>
  </table>
  <form name="myform" method="post">
    <table class="table table-hover">
    <thead class="thead-light">
      <tr align="center">
        <th>번호</th>
        <th>아이디</th>
        <th>별명</th>
        <th>성명</th>
        <th>성별</th>
        <th>연락처</th>
        <th>가입일</th>
        <th>등급변경</th>
        <th>탈퇴유무</th>
      </tr>
    </thead>
      <c:forEach var="vo" items="${vos}">
        <tr align="center">
          <td>
            <input type="checkbox" class="chk" name="chk" value="${vo.idx}"/>
            ${scrNo}
          </td>
          <td>${vo.mid}</td>
          <td>
            <a href="javascript:nWin('${vo.mid}')">${vo.nickname}</a>
          </td>
          <td>${vo.name}</td>
          <td>${vo.gender}</td>
          <td>${vo.tel}</td>
          <td>${fn:substring(vo.joinday,0,10)}</td>
          <td>
            <select name="level" onchange="levelCheck('${vo.mid}',this.value)">
              <option value="4" <c:if test="${vo.level eq 4}">selected</c:if>>준회원</option>
              <option value="3" <c:if test="${vo.level eq 3}">selected</c:if>>정회원</option>
              <option value="2" <c:if test="${vo.level eq 2}">selected</c:if>>우수회원</option>
              <option value="1" <c:if test="${vo.level eq 1}">selected</c:if>>특별회원</option>
              <option value="0" <c:if test="${vo.level eq 0}">selected</c:if>>관리자</option>
            </select>
          </td>
          <td>${vo.userdel}</td>
        </tr>
        <c:set var="scrNo" value="${scrNo - 1}"></c:set>
      </c:forEach>
    </table>
    <input type="hidden" name="delItems"/>
  </form>
</div>
<!-- 페이징 처리 시작 -->
<div id="pagination">
  <ul class="pagination">
    <li class="page-item <c:if test="${!(pageMaker.preBtn)}">disabled</c:if>">
      <a class="page-link" href="${contextPath}/admin/amList?page=${pageMaker.blockStartPage-1}&pageSize=${cri.pageSize}">◁◁</a>
    </li>
    <c:forEach var="i" begin="${pageMaker.blockStartPage}" end="${pageMaker.blockEndPage}">
      <li class="page-item <c:if test="${cri.page==i}">active</c:if>">
        <a href="${contextPath}/admin/amList?page=${i}&pageSize=${cri.pageSize}" class="page-link">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item <c:if test="${!(pageMaker.nextBtn)}">disabled</c:if>">
      <a class="page-link" href="${contextPath}/admin/amList?page=${pageMaker.blockEndPage+1}&pageSize=${cri.pageSize}">▷▷</a>
    </li>
  </ul>
</div>
<!-- 페이징 처리 끝 -->
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>