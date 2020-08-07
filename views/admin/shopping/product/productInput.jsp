<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>상품 올리기(productInput.jsp)</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  
  <script src="${contextPath}/ckeditor/ckeditor.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  
  <script>  
  var index = 1;
  var op_index = 1;
  var options = "";
  
   $(document).ready(function(){
     $("#prebutton").click(function(){
       $("#preimg").append("<p><input type='file' id='"+ index +"' name='file' onChange='fileCheck("+ index +")' accept='.jpg' style='width:90%;'/><input type='button' value='X' id='removefile"+index+"' onClick='removefile("+index+")' style='width:10%;'/></p>");
       index++;
     });
     
     $("#opbutton").click(function(){
       $("#option").append("<p><input type='text' id='p_option"+op_index+"' name='options' style='width:90%;'/><input type='button' value='X' id='removeoption"+op_index+"' onClick='removeoption("+op_index+")' style='width:10%;'/></p>");
       op_index++;
     });
   });
    
    function removefile(index){
      $("input").remove("#"+index);
      $("input").remove("#fsize"+index);
      $("input").remove("#removefile"+index);
    }

    function removeoption(op_index){
      $("input").remove("#p_option"+op_index);
      $("input").remove("#removeoption"+op_index);
    }

    function fileCheck(index){
      var str = document.getElementById(index).value;
      var ext  = str.substring(str.lastIndexOf(".")+1);  //확장자구하기
      var uExt = ext.toUpperCase();
      
      if(str == "") {
        alert("파일명은 공백이 올수 없습니다.");
        return false;
      }
      else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
        alert("업로드 가능한 파일이 아닙니다.");
        return false;
      }
      else if(str.length>50){
        alert("파일명의 길이가 50글자를 초과할 수 없습니다. ");
        return false;
      }
      else if(str != ""){
        $("#preimg").append("<input type='hidden' name='fsize"+ index +"' id='fsize"+ index +"'/>");
        var fileSize = document.getElementById(index).files[0].size;
        var maxSize = 10 * 1024 * 1024;                               //최대 10MB
        document.getElementById("fsize"+index).value = fileSize;
        
        if(fileSize > maxSize){
           alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
           return false;
        }
      }
    }
    
    function fCheck(){
      var str = document.getElementById("file").value;
      var ext  = str.substring(str.lastIndexOf(".")+1);  //확장자구하기
      var uExt = ext.toUpperCase();
      
      var title = document.myform.title.value;
      var price = document.myform.price.value;
      
      if(title=="" || title==null){
        alert("제목을 입력하세요.");
        myform.title.focus();
        return false;
      }
      else if(price=="" || price==null){
        alert("가격을 입력하세요.");
        myform.price.focus();
        return false;
      }
      if(str == "") {
        alert("파일명은 공백이 올수 없습니다.");
        return false;
      }
      else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
        alert("업로드 가능한 파일이 아닙니다.");
        return false;
      }
      else if(str.length>50){
        alert("파일명의 길이가 50글자를 초과할 수 없습니다. ");
        return false;
      }
      else if(str !=""){
        var fileSize = document.getElementById("file").files[0].size;
        var maxSize = 10 * 1024 * 1024; //10MB
        document.myform.fsize.value = fileSize;
        
        if(fileSize > maxSize){
           alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
           return false;
        } else {
          var options = "";
          for(i=1; i<=op_index; i++){
            if($("#p_option"+i).length != 0){
              options = options+$("#p_option"+i).val()+"/";
            }
          }
          
          myform.p_option.value = options;
          myform.index.value = index;
          document.myform.submit();
        }
      }
    }
    
  </script>
  <style>
  body{
    margin:0 auto;
  }
  [class ~= fontsize]{
    font-size:15px;
    padding-top:50px;
    padding-bottom:100px;
  }
  .container{
    width:100%;
  }
  .container h2{
    text-align:center;
  }
  .btnButton{
    float:left;
    padding-left:35%;
  }
  #preimg {
    width:100%;
  }
  #prebutton{
    width:100%; 
    margin-bottom:20px;
  }
  #pre1,#pre2,#pre3,#pre4,#pre5{
    display:none;
  }
</style>
</head>
<body>
<div class="container fontsize"> 
  <h2>상품 올리기</h2><br/>
  <form name="myform" method="post" action="${contextPath}/admin/productInput" enctype="multipart/form-data">
    <div class="form-group">
      <label for="file">메인 이미지: (업로드 가능파일 :jpg)</label>
      <input type="file" class="form-control-file border" id="file" name="file" accept=".jpg"/>
    </div>
    <div id="preimg">
      <p><input type="button" value="미리보기 이미지 추가" class="btn btn-outline-dark center" id="prebutton" style="width:100%; margin-bottom:20px;" /></p>
    </div>
    <p></p>
    <div class="form-group">
      <label for="nickname">올린이:</label>
      <input type="text" class="form-control" id="nickname" placeholder="Enter nickname" name="name" value="관리자" readonly/>
    </div>    
    <div class="form-group">
      <label for="title">상품명:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
    </div>    
    <div class="form-group">
      <label for="price">가격:</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price">
    </div>    
    <div id="option">
      <label for="opbutton">옵션:</label>
      <p><input type="button" value="옵션추가" class="btn btn-outline-dark center" id="opbutton" style="width:100%; margin-bottom:20px;"/></p>
      
    </div>  
    <div class="form-group">
      <label for="subContent">제품설명:</label>
      <textarea class="form-control" rows="4" id="subContent" name="subContent"></textarea>
    </div>
    <div class="form-group">
      <label for="content">글내용:</label>
      <textarea class="form-control" rows="5" id="CKEDITOR" name="content" required></textarea>
    </div>
    <script>
      CKEDITOR.replace("content",{
        filebrowserUploadUrl: "${contextPath}/imageUpload"
      });
    </script>
    <div class="form-group">
      <label for="sel1">분류:</label>
      <select multiple class="form-control" id="sel1" name="part">
        <option value="페이스">페이스</option>
        <option value="립">립</option>
        <option value="아이">아이</option>
        <option value="치크">치크</option>
        <option value="스킨케어">스킨케어</option>
        <option value="툴">툴</option>
        <option value="향수/네일">향수/네일</option>
      </select>
    </div>
    <div class=btnButton>
      <button type="button" class="btn btn-outline-dark" onClick="fCheck()">상품 올리기</button>
      <button type="reset" class="btn btn-outline-dark">다시 작성</button>
      <button type="button" class="btn btn-outline-dark" onClick="location.href='${contextPath}/admin/productList'">돌아가기</button>
    </div>
    <input type="hidden" name="mid" value="${amid}"/>
    <input type="hidden" name="fsize"/>
    <input type="hidden" name="p_option"/>
    <input type="hidden" name="index"/>
  </form>
</div>
</body>
</html>