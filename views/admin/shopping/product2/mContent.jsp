<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% pageContext.setAttribute("cn", "\n"); %> 
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
  
  <!-- Custom-Files -->
  <link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
  <!-- Bootstrap-Core-CSS -->
  <link href="${contextPath }/css/css_slider.css" type="text/css" rel="stylesheet" media="all">
  <!-- css slider -->
  <link rel="stylesheet" href="${contextPath }/css/style.css" type="text/css" media="all" />
  <!-- Style-CSS -->
  <link href="${contextPath }/css/font-awesome.min.css" rel="stylesheet">
  <!-- Font-Awesome-Icons-CSS -->
  <!-- //Custom-Files -->

  <!-- Web-Fonts -->
  <link
    href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext"
    rel="stylesheet">
  <link
    href="//fonts.googleapis.com/css?family=Barlow+Semi+Condensed:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- //Web-Fonts -->  
  <link rel="stylesheet" href="${contextPath}/css/product.css">
  <title>메뉴상세</title>
  <script>
  var idxAry = new Array();

  $(function(){
    $("#selectOption").change(function(){
      var selectOption = $(this).val();
      var idx = selectOption.substring(0,selectOption.indexOf(":"));
      var indiname = selectOption.substring(selectOption.indexOf(":")+1,selectOption.indexOf("_"));
      var price = selectOption.substring(selectOption.indexOf("_")+1);
      
      if($("#layer"+idx).length==0 && selectOption!=""){
        idxAry[idx]=idx;

        var str = "";
        
        str += "<div class='layer' id='layer"+idx+"'>"+indiname+"&nbsp;&nbsp;";
        str += "<input type='number'  class='numBox' name='optionNum' onChange='numChange("+idx+")' value='1' min='1'  id='numBox"+idx+"'>";
        str += "<input type='text' id='imsiPrice"+idx+"' class='price' value='"+numberWithCommas(price)+"' readonly/>";
        str += "<input type='hidden' id='price"+idx+"' class='price' value='"+price+"'/>";
        str += "<div class='removebtn'><input type='button' class='btn btn-secondary btn-sm removebtn' onClick='remove("+idx+")' value='삭제'/></div>"
        str += "<input type='hidden' id='stateprice"+idx+"' name='stateprice'  value='"+price+"'/>";
        str += "<input type='hidden' name='optionIdx'  value='"+idx+"'/>";
        str += "</div>";
        
        $("#product1").append(str);
        
        onTotal();
      
      } else if(selectOption=="") {
        alert("옵션을 선택해주세요.");
      } else {
        alert("이미 선택한 옵션입니다.");
      }
    })
    
     $("#inquirybtn").click(function(){
       document.inquiry.action="${contextPath}/mContent/inquiry";
       if(document.inquiry.content.value==""){
         alert("상품문의 내용을 입력하세요!");
         return false;
       }
       document.inquiry.submit();
     })
     
      $("[id^='inquirytitle']").click(function(){
        var idx = $(this).attr('id').replace("inquirytitle",""); //idx를 뽑아옴
        var data = idx;
          $.ajax({
            async : true,
            type : "POST",
            data : data,
            url : "${contextPath}/mContent/inquiryInfo",
            dataType:"json",
            contentType : "application/json; charset=UTF-8",
            success : function(data) {
              if($("#inquirytd"+idx).length==0){
                var str = "";
                str += "<td colspan='3' id='inquirytd"+idx+"'><img src='${contextPath }/images/q_icon.png' style='display:inline;float:left;'/><div style='display:inline;float:left;margin-left:10px;margin-bottom:10px;width:90%;padding:5px;'>"+data.content+"</div>";
                if(data.replycontent!=null){
                  str += "<div style='width:100%;clear:both;'><img src='${contextPath }/images/a_icon.png' style='clear:both;float:left;'/><div style='display:inline;float:left;margin-left:10px;width:90%;background-color:#f6f6f6;padding:5px;'>"+data.replycontent+"</div></div>";
                }
                str += "</td>";
                $("#inquirycontent"+idx).append(str);
              } 
              
              else {
                $("#inquirycontent"+idx).empty();
              }
            }
          }); //ajax 종료        
     })
  }) //jquery 종료
  
  function remove(idx){
    $("div").remove("#layer"+idx);
    onTotal();
  }

  function numChange(idx){
    var price = document.getElementById("stateprice"+idx).value*document.getElementById("numBox"+idx).value;
    document.getElementById("imsiPrice"+idx).value = numberWithCommas(price);
    document.getElementById("price"+idx).value = price;
    onTotal();
  }
  
  function cart(snickname){
    if(snickname==""){
      alert("로그인 후 이용 가능합니다.");
      location.href="${contextPath}/member/login";
    } 
    else if(document.getElementById("totalprice").value=="" || document.getElementById("totalprice").value==0){
      alert("옵션을 선택해주세요!");
      return false;
    }
    else{
      var ans = confirm("장바구니로 이동하시겠습니까?");
      if(ans){
        document.myform.sw.value="cart";
      } else {
        //document.myform.sw.value="mContent";
        return false;
      } 
      document.myform.submit();
    }
  } 
  
  function order(){
    if(document.getElementById("totalprice").value=="" || document.getElementById("totalprice").value==0){
      alert("옵션을 선택해주세요!");
      return false;
    } else {
      document.myform.action="${contextPath}/member/directOrder";
      document.myform.submit();
    }
  }
  
  function onTotal(){
    var total = 0;
     for(var i=0;i<idxAry.length;i++){
      if($("#layer"+idxAry[i]).length != 0){
        total = total + parseInt(document.getElementById("price"+idxAry[i]).value);
      }
    } 
    document.getElementById("totalprice").value = numberWithCommas(total);
  }
  
  function review(){
    alert("마이페이지로 이동합니다^^");
    location.href="${contextPath}/member/mypage/recentorder";
  }
  
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<%@include file="./naviMenu/shopMenu.jsp" %>
<%-- 
<c:choose>
  <c:when test="${sectionVo.catename eq '닭가슴살' }">
    <%@include file="../include/daknav.jsp" %>
  </c:when>
  <c:when test="${sectionVo.catename eq '간편한끼' }">
    <%@include file="../include/simplemealnav.jsp" %>
  </c:when>
  <c:when test="${sectionVo.catename eq '건강간식' }">
    <%@include file="../include/snacknav.jsp" %>
  </c:when>
  <c:otherwise>
    <%@include file="../include/dosiraknav.jsp" %>
  </c:otherwise>
</c:choose>
 --%>
<p><br/></p>
<div class="container">
  <div class="contents">
  
    <div class="menu_top">
      <!-- 상품썸네일 -->
      <div id="Thumbnail">
        <img src="${contextPath }/upload/${sectionVo.rfname}" width="100%" /> 
      </div>
      
      <!-- 상품정보 -->
      <div id="iteminfo">
        <h3>${sectionVo.product }</h3>
        <h2>${sectionVo.mainprice }원</h2>
        <p>${sectionVo.detail }</p>
      </div>
      
      <!-- 상품주문 -->
      <div class="form-group select_box">
        <form>
          <select size="1" class="form-control" id="selectOption">
            <option value="">상품옵션선택</option>
            <c:forEach var="vo" items="${Opvos }">
              <option value="${vo.idx}:${vo.indiname }_${vo.price}">${vo.indiname }</option>              
            </c:forEach>
          </select>
        </form>
      </div>

      <form name="myform" method="post">
        <input type="hidden" name="product"  value="${sectionVo.product}"/>
        <input type="hidden" name="nickname"  value="${snickname}"/>
        <input type="hidden" name="sw" />
      <div id="product1">
      </div>
      </form>

      <div class="product2">
        <hr color="black" size="3px"/>
        <font size="4" color="black">총상품금액</font>
        <p align="right"><font size="6" color="#f93"><b>
            <input type="text" class="totalprice" id="totalprice" readonly/>        
        </b></font></p>
      </div>
      
      <div class="buttongroup">
        <button class="btn btn-secondary btn-lg but" onClick="cart('${snickname}')">장바구니</button> &nbsp;
        <button class="btn btn-secondary btn-lg but" onClick="order()">주문하기</button>
      </div> 
    </div>
    
    <!-- 추천상품배너 -->
    <div class="banner">
      <h5>연관상품추천</h5>
      <c:forEach var="vo" items="${relVos }">
        <c:if  test="${vo.idx ne sectionVo.idx }">
          <a href="${contextPath }/shopping/admin/shopping/product2/mContent?idx=${vo.idx}"><img src="${contextPath }/upload/${vo.rfname}" width="15%" class="bannerimg"/></a>
        </c:if>  
      </c:forEach>
    </div>
    
      <!-- 본문부분 -->
    <ul class="nav nav-tabs justify-content-center" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#content">상품설명</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#review">상품후기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#inquiry">상품문의</a>
      </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
      <!-- 상품설명 -->
      <div id="content" class="container tab-pane active"><br>
        <div class="next">
          ${sectionVo.content}
        </div>
      </div>

      <div id="review" class="container tab-pane fade"><br>
        <!-- 상품후기 -->
        <div class="review">
          <h5 style="margin-left:28px;">구매후기 (<c:if test="${reviewVos.size() eq 0 }">0</c:if><c:if test="${reviewVos.size() ne 0 }">${reviewVos.size() }</c:if>개)</h5>
          <div class="review1">
            <div class="review2">
              <font size="2">· Blue Nara는 믿을 수 있는 후기관리를 위해 회원으로 가입되신 실제 구매자만 후기를 작성하실 수 있습니다.<br/>
                    <span style="color:#f63;font-weight:bold;">·구매하신 상품을 받으신 후, 10일 이내 후기를 남겨주시면 50P가 적립됩니다.</span><br/>
                    ·상품과 관련 없는 후기 혹은 욕설, 비방, 부적절한 단어, 문의글, 양도글, 광고성, 도배, 환불처리된 주문, 개인정보가 포함된 후기는 예고없이 블라인드 처리 될 수 있습니다.
              </font>
            </div>
            <div class="review3">
              <button type="button" class="btn btn-secondary but" onClick="review()">후기등록</button>      
            </div>
          </div>
          <p><br/></p>
          <div class="review4">
            <c:forEach var="reviewVo" items="${reviewVos}">
              <table class="table table-bordered reviewtable">
                <tr class="sub">  
                  <td width="25%">
                    <c:forEach begin="0" end="${reviewVo.score-1 }" step="1" >
                      <img src="${contextPath }/images/star.gif"/>
                    </c:forEach>
                  </td>
                  <td width="25%"><b>${reviewVo.nickname }</b></td>
                  <td align="right">${fn:substring(reviewVo.wdate,0,16) }</td>
                </tr>
                <tr class="sub">
                  <td colspan=3>${fn:replace(reviewVo.comment,cn,'<br/>') }</td>
                </tr>
              </table>
            </c:forEach>
          </div>
        </div>
      </div>

      <div id="inquiry" class="container tab-pane fade">
        <!-- 상품문의 -->
        <div class="inquiry">
        <h5 style="margin-left:28px;margin-top:20px;">상품문의</h5>
          <div class="inquirytop">
            <div class="inline1">
              <p class="text" style="color:#f63;font-weight:bold;">· 상품문의에서는 상품과 무관한 요청은 처리되지 않습니다.</p>
              <p class="text">· 배송문의·취소·환불 등은 1:1상담게시판을 통해 문의남겨주시기 바랍니다.</p>
              <p class="text">· 미구매,비방이나 양도 광고성, 욕설, 도배글, 개인정보가 포함된 글은 예고없이 삭제되거나 노출이 제한될 수 있습니다.</p>
            </div>
            <div class="inline2">
              <input type="button" value="1:1상담게시판으로" class="btn btn-secondary" onClick="location.href='${contextPath}/member/mypage/inquiryList';"/>
            </div>
            <div class="next inquiryInput">
              <form name="inquiry" method="post">
                <div class="radiobox">
                  <div class="form-group">
                      <input type="radio" name="category" value="상품문의" checked />상품문의 &nbsp;
                      <input type="radio" name="category" value="배송문의" />배송문의 &nbsp;
                      <input type="radio" name="category" value="기타문의" />기타문의 &nbsp;
                      <span style="font-size:12px;">※문의유형을 꼭 선택해주세요.</span>
                  </div>        
                </div>
                <div class="textbox">
                  <textarea class="form-control" rows="3" id="content" name="content" required placeholder="상품문의 외에 문의·요청은 1:1상담게시판을 이용해주세요"></textarea>
                </div>
                <div class="button" id="inquirybtn">
                  <div class="btnletter"><span style="color:white;font-weight:bold;">문의하기</span></div>
                </div>
                <input type="hidden" name="productIdx" value="${sectionVo.idx }"/>
              </form> 
            </div>
          </div>
          <p><br/></p>
          <!-- 문의글보기 -->
          <div class="inquirybottom">
              <table class="table">
              <c:forEach var="proVo" items="${proinquiryVos }">
                <tr style="height:35px;padding:0px;">
                  <td width="15%;" style="padding:3px;"><span style="font-size:13px;margin-left:10px;">${proVo.nickname }</span></td>
                  <td width="15%;" style="padding:3px;"><span style="font-size:13px;">${fn:substring(proVo.wdate,0,10) }</span></td>
                  <td style="padding:3px;"><c:if test="${proVo.reply eq 'Y' }"><span style="color:#63;font-size:13px;">답변완료</span></c:if></td>
                </tr>
                <tr>
                  <td colspan="3" id="inquirytitle${proVo.idx }" style="cursor:pointer;">[${proVo.category }]입니다</td>
                </tr>
                <tr id="inquirycontent${proVo.idx }">
                  
                </tr>
                </c:forEach>
              </table>
          </div>
          
        </div>
      </div>  
     
    </div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>