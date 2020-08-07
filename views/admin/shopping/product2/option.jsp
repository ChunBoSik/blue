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
  <title>옵션등록</title>
  <script>
    function fCheck(){
      for(var i=1;i<=cnt;i++){
        if($("#t"+i).length!=0 && document.getElementById("indiname"+i).value==""){
          alert("빈칸 없이 상품옵션이름을 모두 등록하셔야 합니다.");
          return false;
        }
        else if($("#t"+i).length!=0 && document.getElementById("price"+i).value==""){
          alert("빈칸 없이 상품옵션가격을 모두 등록하셔야 합니다.");
          return false;
        }
        else if($("#t"+i).length!=0 && document.getElementById("perprice"+i).value==""){
          alert("빈칸 없이 1개당가격을 모두 등록하셔야 합니다.");
          return false;
        }
        else if($("#t"+i).length!=0 && document.getElementById("quantity"+i).value==""){
          alert("빈칸 없이 옵션당 상품수량을 모두 등록하셔야 합니다.");
          return false;
        }
      }
      
      if(document.getElementById("indiname").value==""){
        alert("상품옵션이름을 등록하세요!");
        return false;
      }
      else if(document.getElementById("price").value==""){
        alert("상품옵션가격을 등록하세요!");
        return false;
      }
      else if(document.getElementById("perprice").value==""){
        alert("1개당가격을 등록하세요!");
        return false;
      }
      else if(document.getElementById("quantity").value==""){
        alert("옵션당 상품수량을 등록하세요!");
        return false;
      }
      else {
        document.mainform.submit();
      }
    }
  </script>
  
<script type="text/javascript"> 
  
  var remove_div = function(test){    
    $("#"+test.id).remove();    
  }
  
  var cnt = 1;
  var add_div = function(){
    var strMenu = "";
      var test = "t" + cnt;
    
       strMenu += '<div id="'+test+'"><div class="form-group">'
                + '<font size="6"><b>상품옵션등록</b></font>'
                + '<input type="button" id="test'+test+'" class="btn btn-outline-secondary btn-sm" value="삭제" onclick="remove_div('+test+')"><br/>'
                +  '<label for="indiname">상품옵션이름</label>'
                +  '<input type="text" class="form-control" id="indiname'+cnt+'" name="indiname"/>'
                + '</div>'
                + '<div class="form-group">'
                +  '<label for="price">상품옵션가격</label>'
                +  '<input type="text" class="form-control" id="price'+cnt+'" name="price"/>'
                + '</div>'
                + '<div class="form-group">'
                +  '<label for="perprice">1개당 가격</label>'
                +  '<input type="text" class="form-control" id="perprice'+cnt+'" name="perprice"/>'
                + '</div>'
                + '<div class="form-group" >'
                +  '<label for="quantity">옵션당 상품수량</label>'
                +  '<input type="text" class="form-control" id="quantity'+cnt+'" name="quantity"/>'
                + '</div></div>'
                                                
      $("#room_type").append(strMenu);
    cnt ++;
    
  }
$(document).ready(function() {  
      
});

</script>
</head>
<body>
<%@include file="./naviMenu/adminNav.jsp" %>
  <div class="tab-pane container" id="menu1">
    <p><br/><br/></p>
    <form name="mainform"  method="post" >
    <div class="form-group">
      <label for="sectname">세분류</label>
      <select name="sectname" class="form-control">
        <c:forEach var="sectname" items="${sectname }">
          <option value="${sectname }">${sectname }</option>
        </c:forEach>
      </select>
    </div>
    
    <font size="6"><b>상품옵션등록</b></font>
    <input type="button" class="btn btn-outline-secondary btn-sm" value="추가" onclick="add_div()"><br/>
      <div class="form-group" >
        <label for="indiname">상품옵션이름</label>
        <input type="text" class="form-control" id="indiname" name="indiname"/>
      </div>      
      <div class="form-group" >
        <label for="price">상품옵션가격</label>
        <input type="text" class="form-control" id="price" name="price"/>
      </div>      
      <div class="form-group" >
        <label for="perprice">1개당 가격</label>
        <input type="text" class="form-control" id="perprice" name="perprice"/>
      </div>
      <div class="form-group" >
        <label for="quantity">옵션당 상품수량</label>
        <input type="text" class="form-control" id="quantity" name="quantity"/>
      </div>
      
    <div id="room_type"> </div>

    </form>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">옵션등록</button>
  </div>

<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>