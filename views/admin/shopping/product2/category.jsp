<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>
  <title>대분류관리</title>
  <script>
    function allCheck(){
      var maxnum = document.getElementById("maxnum").value;
      if(document.getElementById("allcheck").checked){
        for(var i=1;i<=maxnum;i++){
          document.getElementById("check"+i).checked=true;
        }
      }
      else {
        for(var i=1;i<=maxnum;i++){
          document.getElementById("check"+i).checked=false;
        }
      }
    }
    
    function onCheck(){
      var maxnum = document.getElementById("maxnum").value;
      
      //체크해제하면 전체해제를 하기 위해 변수설정
      var cnt = 0;
      for(var i=1;i<=maxnum;i++){
        if(document.getElementById("check"+i).checked==false){
          cnt++;
        }
      }
      //체크해제된게 있음
      if(cnt!=0){
        document.getElementById("allcheck").checked=false;
      } else {
        document.getElementById("allcheck").checked=true;
      }
    }
    
    function deleteCategory(){
      var ans = confirm("대분류를 삭제하시겠습니까?");
      if(!ans){
        return false;
      }
      
      var maxnum = document.getElementById("maxnum").value;
      var cnt = 0;
      for(var i=1;i<=maxnum;i++){
        if(document.getElementById("check"+i).checked==true){
          cnt++;
        }
      }
      if(cnt==0){
        alert("삭제할 대분류를 선택해주세요!");
      }
      else {
        document.deleteForm.action="${contextPath}/shopping/admin/shopping/product2/deleteCategory";
        document.deleteForm.submit();
      }
    }
  
    var cnt = 0;
    $(document).ready(function() {  
    
      //제품추가
      $("#plusbtn").click(function(){
        cnt++;
        var str = "";
        str += "<div id='ccDiv"+cnt+"' style='width:50%;'>";
        str += "<font size='5'><b>대분류 등록</b></font>";
        str += "<input type='button' class='btn btn-secondary btn-sm' value='삭제' id='minusbtn"+cnt+"' style='margin-left:5px;'><br/>";
        str += "<div class='form-group' >";
        str += "<label for='catecode'>대분류코드</label>";
        str += "<input type='text' class='form-control' id='catecode"+cnt+"' name='catecode'/>";
        str += "</div>";
        str += "<div class='form-group' >";
        str += "<label for='catename'>대분류이름</label>";
        str += "<input type='text' class='form-control' id='catename"+cnt+"' name='catename'/>";
        str += "</div>";
        str += "</div>";
        
        $("#addDiv").append(str);
      })
        
      
      $(document).on("click","[id^='minusbtn']",(function(){
        var num = $(this).attr('id').replace("minusbtn","");
        $("#ccDiv"+num).remove();
      }))
      
    })  
    
    function fCheck(){
      for(var i=1;i<=cnt;i++){
        if($("#ccDiv"+i).length!=0 && document.getElementById("catecode"+i).value==""){
          alert("빈칸 없이 대분류 코드를 모두 등록하셔야 합니다.");
          return false;
        }
        else if($("#ccDiv"+i).length!=0 && document.getElementById("catename"+i).value==""){
          alert("빈칸 없이 대분류 이름을 모두 등록하셔야 합니다.");
          return false;
        }
      }
      
      if(document.getElementById("catecode").value==""){
        alert("대분류 코드를 등록하세요!");
        return false;
      }
      else if(document.getElementById("catename").value==""){
        alert("대분류 이름을 등록하세요!");
        return false;
      }
      else {
        document.mainform.submit();
      }
    }    

</script>
</head>
<body>
<%@include file="./naviMenu/adminNav.jsp" %>
<p><br/><br/></p>
<div class="container">
    <div style="text-align:center;width:50%;margin-bottom:20px;"><h2>대분류 관리</h2></div>
    <div style="margin-bottom:20px;"><h4>대분류 목록</h4></div>
    <div style="display:inline;float:left;margin-bottom:10px;">
      <input type="button" class="btn btn-secondary"value="대분류삭제" onClick="deleteCategory()"/>
    </div>  
    <table class="table table-hover" style="width:50%;clear:both; ">
      <thead>
        <tr align="center">
          <th>전체&nbsp;<input type="checkbox" id="allcheck" onClick="allCheck()"/></th>
          <th>대분류코드</th>
          <th>대분류명</th>
        </tr>
      </thead>
      <tbody>
      <c:set var="num" value="0"/>
      <form name="deleteForm" method="post">
      <c:forEach var="vo" items="${vos }">  
        <c:set var="num" value="${num+1 }"/>
        <tr align="center">
          <td><input type="checkbox" value="${vo.catecode }" name="deletecheck" id="check${num }" onClick="onCheck()"/></td>
          <td>${vo.catecode}</td>
          <td>${vo.catename}</td>
        </tr>
      </c:forEach>
      </form>
      <input type="hidden" value="${num }" id="maxnum"/>
      </tbody>
    </table>
    
    <p><br/><br/></p>
    <div>
      <form name="mainform"  method="post" >    
      <font size="5"><b>대분류 등록</b></font>
      <input type="button" class="btn btn-outline-secondary btn-sm" value="대분류추가" id="plusbtn" style="margin-left:5px;"><br/>
        <div style="width:50%;">
          <div class="form-group" >
            <label for="catecode">대분류코드</label>
            <input type="text" class="form-control" id="catecode" name="catecode"/>
          </div>      
          <div class="form-group" >
            <label for="catename">대분류이름</label>
            <input type="text" class="form-control" id="catename" name="catename"/>
          </div>
        </div>      

      <div id="addDiv"> 
      
      </div>     
  
      </form>
      <button type="button" class="btn btn-secondary" onclick="fCheck()">대분류등록</button>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>