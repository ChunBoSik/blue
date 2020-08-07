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
  <title>중분류관리</title>
  <script>
    //체크박스 확인을 하기위한 변수
    var checkcnt = 0;
    $(function(){

      $("#catename").change(function(){
        checkcnt=0;  
        document.getElementById("allcheck").checked=false;
        var catename = $(this).val();
        $.ajax({
          async : true,
          type : "POST",
          data : catename,
          url : "getDivisionVo",
          dataType : "json",
          contentType : "application/json; charset=UTF-8",
          success : function(data){
            document.deleteForm.catename.value=document.getElementById("catename").value;
            document.mainform.catename2.value=document.getElementById("catename").value;
            $("#divitr").empty();
            var str = "";
            str += "";
            for(var i=0;i<data.diviVos.length;i++){
              checkcnt++;
              str += "<tr align='center'><td><input type='checkbox' value='"+data.diviVos[i].divicode+"' name='deletecheck' id='check"+checkcnt+"' onClick='onCheck()'/></td>";
              str += "<td>"+data.diviVos[i].divicode+"</td>";
              str += "<td>"+data.diviVos[i].diviname+"</td></tr>";
            }

            $("#divitr").append(str);
          }
        });      
      })
    })
  
  
    function allCheck(){
      if(document.getElementById("allcheck").checked){
        for(var i=1;i<=checkcnt;i++){
          document.getElementById("check"+i).checked=true;
        }
      }
      else {
        for(var i=1;i<=checkcnt;i++){
          document.getElementById("check"+i).checked=false;
        }
      }
    }
    
    function onCheck(){
      
      //체크해제하면 전체해제를 하기 위해 변수설정
      var cnt = 0;
      for(var i=1;i<=checkcnt;i++){
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
    
    function deleteDivision(){
      var ans = confirm("중분류를 삭제하시겠습니까?");
      if(!ans){
        return false;
      }
      
      var cnt = 0;
      for(var i=1;i<=checkcnt;i++){
        if(document.getElementById("check"+i).checked==true){
          cnt++;
        }
      }
      if(cnt==0){
        alert("삭제할 중분류를 선택해주세요!");
      }
      
      else {
        var tt = "";
        //checkbox 내용이 안넘어가서 string 배열로 처리
        $('input:checkbox[name="deletecheck"]').each(function() {
          if(this.checked){//checked 처리된 항목의 값
            tt += this.value + "/";
          }
        });
        document.deleteForm.divicodeAry.value=tt;
        document.deleteForm.action="${contextPath}/shopping/admin/shopping/product2/deleteDivision";
        document.deleteForm.submit();
      }
    }
  
    var cnt = 0;
    $(document).ready(function() {  
    
      //제품추가
      $("#plusbtn").click(function(){
        cnt++;
        var str = "";
        str += "<div id='ddDiv"+cnt+"' style='width:50%;'>";
        str += "<font size='5'><b>중분류 등록</b></font>";
        str += "<input type='button' class='btn btn-secondary btn-sm' value='삭제' id='minusbtn"+cnt+"' style='margin-left:5px;'><br/>";
        str += "<div class='form-group' >";
        str += "<label for='divicode'>중분류코드</label>";
        str += "<input type='text' class='form-control' id='divicode"+cnt+"' name='divicode'/>";
        str += "</div>";
        str += "<div class='form-group' >";
        str += "<label for='diviname'>중분류이름</label>";
        str += "<input type='text' class='form-control' id='diviname"+cnt+"' name='diviname'/>";
        str += "</div>";
        str += "</div>";
        
        $("#addDiv").append(str);
      })
        
      
      $(document).on("click","[id^='minusbtn']",(function(){
        var num = $(this).attr('id').replace("minusbtn","");
        $("#ddDiv"+num).remove();
      }))
      
    })  
    
    function fCheck(){
      for(var i=1;i<=cnt;i++){
        if($("#ddDiv"+i).length!=0 && document.getElementById("divicode"+i).value==""){
          alert("빈칸 없이 중분류 코드를 모두 등록하셔야 합니다.");
          return false;
        }
        else if($("#ddDiv"+i).length!=0 && document.getElementById("diviname"+i).value==""){
          alert("빈칸 없이 중분류 이름을 모두 등록하셔야 합니다.");
          return false;
        }
      }
      
      if(document.getElementById("divicode").value==""){
        alert("중분류 코드를 등록하세요!");
        return false;
      }
      else if(document.getElementById("diviname").value==""){
        alert("중분류 이름을 등록하세요!");
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
    <div style="text-align:center;width:50%;margin-bottom:20px;"><h2>중분류 관리</h2></div>
    <div class="form-group" style="width:50%;">
      <label for="catename">대분류 선택</label>
      <select id="catename" class="form-control" >
          <option value="">대분류를 선택하세요</option>
        <c:forEach var="catename" items="${catename }">
          <option  value="${catename }">${catename }</option>
        </c:forEach>
      </select>
    </div>
    <div style="margin-bottom:20px;"><h4>중분류 목록</h4></div>
    <div style="display:inline;float:left;margin-bottom:10px;">
      <input type="button" class="btn btn-secondary"value="중분류삭제" onClick="deleteDivision()"/>
    </div>  
    <table class="table table-hover" style="width:50%;clear:both; ">
      <thead>
        <tr align="center">
          <th>전체&nbsp;<input type="checkbox" id="allcheck" onClick="allCheck()"/></th>
          <th>중분류코드</th>
          <th>중분류이름</th>
        </tr>
      </thead>
      <form name="deleteForm" method="post">
        <input type="hidden" name="divicodeAry" />
        <input type="hidden" name="catename"/>
        <tbody id="divitr">
  
        </tbody>
      </form>
    </table>
    
    <p><br/><br/></p>
    <div>
      <form name="mainform"  method="post" >    
      <font size="5"><b>중분류 등록</b></font>
      <input type="button" class="btn btn-outline-secondary btn-sm" value="중분류추가" id="plusbtn" style="margin-left:5px;"><br/>
        <div style="width:50%;">
          <div class="form-group" >
            <label for="divicode">중분류코드</label>
            <input type="text" class="form-control" id="divicode" name="divicode"/>
          </div>      
          <div class="form-group" >
            <label for="diviname">중분류이름</label>
            <input type="text" class="form-control" id="diviname" name="diviname"/>
          </div>
        </div>      

      <div id="addDiv"> 
      
      </div>     
      <input type="hidden" name="catename2"/>  
      </form>
      <button type="button" class="btn btn-secondary" onclick="fCheck()">중분류등록</button>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>