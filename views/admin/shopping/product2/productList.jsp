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
  <title>상품목록</title>
  <script>
    $(function(){
      $("[id^='modal']").click(function(){
        var sectname = $(this).attr('id').replace("modal","");
        $.ajax({
          async : true,
          type : "POST",
          data : sectname,
          url : "indiname",
          dataType : "json",
          contentType : "application/json; charset=UTF-8",
          success : function(data){
            var str = "";
            str += "<table class='table table-bordered'>";
            for(var i=0;i<data.indiname.length;i++){
              str += "<tr><td style='text-align:center;'>옵션"+(i+1)+"</td><td>"+data.indiname[i]+"</td></tr>";
            }
            str += "</table>";
            $("#optiontable").html(str);
            
            $("#myModal").modal('show');
          }
        });       
      })

    
      $("#catename").change(function(){
        var catename = $(this).val();
        $.ajax({
          async : true,
          type : "POST",
          data : catename,
          url : "diviname",
          dataType : "json",
          contentType : "application/json; charset=UTF-8",
          success : function(data){
            var str = "";
            str += "<option value=''>선택</option>";
            for(var i=0;i<data.diviname.length;i++){
              str += "<option <c:if test='${"+data.diviname[i]+" eq selectdiviname }'>selected</c:if>>"+data.diviname[i]+"</option>";
            }
            $("#diviname").html(str);
          }
        });      
      })
    
    $("#diviname").change(function(){
      var diviname = $(this).val();
      $.ajax({
        async : true,
        type : "POST",
        data : diviname,
        url : "sectname",
        dataType : "json",
        contentType : "application/json; charset=UTF-8",
        success : function(data){
          var str = "";
          str += "<option value=''>선택</option>";
          for(var i=0;i<data.sectname.length;i++){
            str += "<option <c:if test='${"+data.sectname[i]+" eq selectsectname }'>selected</c:if>>"+data.sectname[i]+"</option>";
          }
          $("#sectname").html(str);
        }
      });      
    })
  });    
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
    
    function deleteProduct(){
      var ans = confirm("상품을 삭제하시겠습니까?");
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
        alert("삭제할 상품을 선택해주세요!");
      }
      else {
        document.deleteForm.action="${contextPath}/shopping/admin/shopping/product2/deleteProduct";
        document.deleteForm.submit();
      }
    }
    
    function search(){
      document.searchform.submit();
    }
    
    function stateList(){
      var state = document.myform.state.value;
      location.href="${contextPath}/shopping/admin/shopping/product2/productList?state="+state;
    }  
  </script>
</head>
<body>
<%@include file="./naviMenu/adminNav.jsp" %>
<div style="width:90%;margin:0 auto;">
  <div style="margin-bottom:20px;"><h3>상품목록</h3></div>

  <div style="display:inline;float:right;margin-right:10px;">
    <form name="searchform" class="form-inline" method="post">
      <div style="float:left;margin-bottom:5px;margin-right:5px;">   
        <input type="text" class="form-control"  name="searchString" style="width:300px;"placeholder="대·중·소분류 또는 상품명을 입력(전체는공백)"/>
      </div>
      <div style="float:left;margin-bottom:5px;margin-right:5px;">
        <input type="button" class="btn btn-secondary" value="검색" onClick="search()"/>
      </div>
    </form>
  </div>
  <div style="clear:both;display:inline;float:left;margin-bottom:5px;">
    <input type="button" class="btn btn-secondary"value="상품삭제" onClick="deleteProduct()"/>
  </div>
  <div style="float:left;margin-left:10px;margin-bottom:5px;">
  <form name="myform" class="form-inline">
    <span>정렬순서</span>&nbsp;&nbsp;&nbsp;
    <select name="state" onChange="stateList()" class="form-control">
      <option value="">품번</option>
      <option <c:if test="${state eq 'salenum' }">selected</c:if> value="salenum">판매량</option>
      <option <c:if test="${state eq 'product' }">selected</c:if> value="product">상품명</option>
    </select>
  </form>
  </div>     
  <div style="float:right;margin-bottom:5px;margin-right:100px;font-size:12px;">
    * 공백은 전체목록조회 *
  </div>
  <table class="table table-hover">
    <thead>
      <tr align="center">
        <th style="width:5%;">전체&nbsp;<input type="checkbox" id="allcheck" onClick="allCheck()"/></th>
        <th style="width:5%;">품번</th>
        <th style="width:7%;">대분류</th>
        <th style="width:7%;">중분류</th>
        <th >소분류</th>
        <th >상품</th>
        <th style="width:6%;">대표가격</th>
        <th style="width:15%;">상세정보</th>
        <th style="width:8%;">판매량</th>
      </tr>
    </thead>
    <tbody>
    <c:set var="num" value="0"/>
    <form name="deleteForm" method="post">
      <c:forEach var="vo" items="${vos }">  
        <c:set var="num" value="${num+1 }"/>
        <tr align="center">
          <td><input type="checkbox" value="${vo.idx}" name="deletecheck" id="check${num}" onClick="onCheck()"/></td>
          <td>${vo.idx}</td>
          <td>${vo.catename}</td>
          <td>${vo.diviname}</td>
          <td>${vo.sectname}</td>
          <td>${vo.product}</td>
          <td>${vo.mainprice}</td>
          <td style="font-size:13px;"><div id="modal${vo.sectname}" style="cursor:pointer;color:#03c;">${vo.detail}</div></td>
          <td>${vo.salenum}</td>
        </tr>
      </c:forEach>
      <input type="hidden" value="${num}" id="maxnum"/>
    </form>
    </tbody>
  </table>
  <!-- 모달내용부분 -->
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <div style="text-align:center;"><h5 class="modal-title" >상품옵션정보</h5></div>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <!-- Modal body -->
          <div class="modal-body">
            <div id="optiontable"></div>
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal">창닫기</button>
          </div>
        </div>
      </div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>