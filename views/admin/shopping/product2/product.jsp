<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="selectCate" value="${selectCate}"/>
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
  <!-- ckeditor 사용 -->
  <script src="${contextPath }/ckeditor/ckeditor.js"></script>  
  <title>상품등록</title>
  
  <script>
  $(function(){
    $("#catename").change(function(){
      var catename = $(this).val();
      $.ajax({
        async : true,
        url : "diviname",
        type : "POST",
        data : catename,
        dataType : "json",
        contentType : "application/json; charset=UTF-8",
        success : function(data){
          var str = "";
          str += "<option value=''>중분류를 선택하세요</option>";
          for(var i=0;i<data.diviname.length;i++){
            str += "<option>"+data.diviname[i]+"</option>";
          }
          $("#diviname").html(str);
        }
      });      
    })
  })

    function fCheck(){
      var catename = document.sectionform.catename.value;
      var diviname = document.sectionform.diviname.value;
      var sectname = document.sectionform.sectname.value;
      var product = document.sectionform.product.value;
      var mainprice = document.sectionform.mainprice.value;
      var detail = document.sectionform.detail.value;
      var file  = document.sectionform.file.value;   // 파일명
      var ext  = file.substring(file.lastIndexOf(".")+1) //확장자 구하기
      var uExt = ext.toUpperCase();      
      var regExpPrice = /^[0-9|_]*$/;  // 가격은 숫자만..

      
      if(catename==""){
        alert("대분류를 선택하세요!");        
        return false;
      }
      else if(diviname==""){
        alert("중분류를 선택하세요!");        
        return false;
      }
      else if(sectname==""){
        alert("세분류를 입력하세요!");        
        return false;
      }
      else if(product==""){
        alert("상품타이틀을 입력하세요!");        
        return false;
      }
      else if(file == "") {
        alert("메인 이미지를 선택하세요!");
        return false;
      }
      else if(uExt != "JPG" && uExt != "JPEG" && uExt != "PNG" && uExt != "GIF") {
        alert("업로드 가능한 파일이 아닙니다.");
        return false;
      }
      else if(mainprice=="" || !regExpPrice.test(mainprice)){
        alert("상품금액을 숫자로 입력하세요!");        
        return false;        
      }
      else if(detail==""){
        alert("상품상세설명을 입력하세요!");        
        return false;
      }
      else if(document.getElementById("file").value!=""){
        var fileSize = document.getElementById("file").files[0].size;
        var maxSize = 10 * 1024 * 1024; //10MB
        document.sectionform.fsize.value = fileSize;
     
        if(fileSize > maxSize){
           alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
           return false;
        }
        else {
          document.sectionform.submit();
        }
      }

    }
  </script>  
</head>
<body>
<%@include file="./naviMenu/adminNav.jsp" %>
<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane container active" id="product">
    <h3>상품등록</h3>
    <p><br/><br/></p>
    <form name="sectionform" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="catename">대분류</label>
        <select id="catename" name="catename" class="form-control" >
            <option value="">대분류를 선택하세요</option>
          <c:forEach var="catename" items="${catename }">
            <option  value="${catename }">${catename }</option>
          </c:forEach>
        </select>
      </div>
      <div class="form-group">
        <label for="diviname">중분류</label>
        <select id="diviname" name="diviname" class="form-control">
            <option value="">중분류를 선택하세요</option>
        </select>
      </div>              
      <div class="form-group">
        <label for="sectname">소분류(상품-제조사)</label>
        <input type="text" class="form-control" id="sectname" placeholder="Enter sectname" name="sectname"/>
      </div>      
      <div class="form-group">
        <label for="product">상품명</label>
        <input type="text" class="form-control" id="product" placeholder="Enter product" name="product"/>
      </div>      
      <div class="form-group">
        <label for="file">메인이미지</label>
        <input type="file" name="file" id="file" class="form-control-file border" accept=".jpg,.png,.jpeg,.gif" />
        (업로드 가능파일 : jpg , jpeg , png, gif )
      </div>   
      <div class="form-group">
        <label for="mainprice">상품기본가격</label>
        <input type="text" class="form-control" id="mainprice" placeholder="Enter mainprice" name="mainprice"/>
      </div>      
      <div class="form-group">
        <label for="detail">상품상세설명</label>
        <input type="text" class="form-control" id="detail" placeholder="Enter detail" name="detail"/>
      </div>      
      <div class="form-group">
        <label for="content">상품상세사진</label> <!-- ck에디터 사용위해 id바꿔야함 -->
        <textarea class="form-control" rows="5" id="CKEDITOR" name="content" required></textarea>
      </div>
      <script>
        CKEDITOR.replace("content",{
          filebrowserUploadUrl: "${contextPath}/imageUpload"
        });
      </script>      
      <input type="hidden" name="fsize" />
    </form>  
    <button type="button" class="btn btn-secondary" onclick="fCheck()">상품등록</button>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>