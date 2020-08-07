<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.js"></script>  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <title>주문하기</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/css/order.css">
  <script type="text/javascript">
    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.(daum API이용)
    function btnSearchZipcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var fullAddr = '';  // 최종 주소 변수
          var extraAddr = ''; // 조합형 주소 변수
  
          // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            fullAddr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
            fullAddr = data.jibunAddress;
          }
          
          // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
          if(data.userSelectedType === 'R'){
            //법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
              extraAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
          }
  
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('changeZipcode').value = data.zonecode; //5자리 새우편번호 사용
          document.getElementById('changeAddr_master').value = fullAddr;
  
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById('changeAddr_detail').focus();
        }
      }).open();
    };
    
  
    $(document).ready(function(){
      $("#credit").click(function(){
        var str = "";
        str += "<div class='form-inline left'>";
        str += "<label for='card'>카드선택</label>&nbsp;&nbsp;&nbsp;&nbsp;";
        str += "<select id='card' name='card' class='form-control' style='width:80%;' >";
        str += "<option value=''>[필수]카드사를 선택하세요</option>";
        str += "<option value='비씨카드'>비씨카드</option>";
        str += "<option value='국민카드'>국민카드</option>";
        str += "<option value='삼성카드'>삼성카드</option>";
        str += "<option value='현대카드'>현대카드</option>";
        str += "<option value='롯데카드'>롯데카드</option>";
        str += "<option value='기타'>기타</option>";
        str += "</select></div>";
  
        document.myform.paymethod.value="1";
        $("#sub").empty();
        $("#sub").append(str);
      })
  
      $("#nobank").click(function(){
        var str = "";
        str += "<div class='form-inline left'>";
        str += "<label for='bank'>입금은행</label>&nbsp;&nbsp;&nbsp;&nbsp;";
        str += "<select id='bank' name='bank' class='form-control' style='width:80%;' >";
        str += "<option value=''>[필수]입금은행을 선택하세요</option><option value='기업'>기업</option><option value='국민'>국민</option><option value='농협'>농협</option>";
        str += "</select></div>";
        str += "<div class='form-inline left'>";
        str += "<label for='name'>입금자명</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' placeholder='[필수]입금자명을 입력하세요' name='depositName' class='form-control' style='width:80%;'/></div> ";
        str += "<div class='left'><p><hr/></p><p>* 주문 후 7일 이내 미 입금 시, 주문이 자동 취소됩니다.</p><p>* 발급된 계좌에 입금자명과 금액을 정확하게 입금해주세요.</p></div>";
        str += "";
        
        document.myform.paymethod.value="2";
        $("#sub").empty();
        $("#sub").append(str);
      })
      
      
      $("#realtime").click(function(){
        var str = "";
        str += "<div class='left'><p><hr/></p><p>* 본인 명의의 은행 계좌를 이용해 결제하실 수 있습니다.</p><p>* 은행 점검 시간에는 결제가 불가할 수 있습니다.</p></div>";
  
        document.myform.paymethod.value="3";
        $("#sub").empty();
        $("#sub").append(str);
      })
      
      $("#phone").click(function(){
        var str = "";
        str += "<div class='left'><p><hr/></p><p>* 결제금액이 통신사 휴대폰 요금에 청구됩니다.</p><p>* 월 결제 한도는 최대 50만원입니다.</p></div>";
        
        document.myform.paymethod.value="4";
        $("#sub").empty();
        $("#sub").append(str);
      })
      
      $(document).on("click","#adrChange",(function(){    
        var str = "";
        str += "<div style='border:1px solid #ccc; padding:10px;' id='adrChangeDiv'><div  class='center'><font size='5'>신규 배송지 정보</font></div><input type='button' value='기본주소사용' class='btn btn-outline-primary btn-sm' id='backbtn' style='margin-bottom:10px;'/>";
        str += "<div><div class='form-group'><label for='name'=>이름</label><span id='star'>*</span><input type='text' class='form-control' id='changeName' placeholder='10자리 이하 영문,한글 가능' required ></div></div>";
        str += "<div class='form-group'><label for='zipcode' >우편번호</label><div class='input-group mb-3'><input type='text'  class='form-control' id='changeZipcode' readonly><div class='input-group-append'><button type='button' class='btn btn-outline-primary' onclick='btnSearchZipcode()'>주소 검색</button></div></div></div>";
        str += "<div class='form-group'><label for='addr_master' >기본 주소</label><input type='text'  class='form-control' id='changeAddr_master' readonly></div>";
        str += "<div class='form-group'><label for='addr_detail' >상세 주소</label><input type='text' class='form-control' id='changeAddr_detail'></div>";
        str += "<div class='form-group'><label for='tel'>휴대폰번호</label><span id='star'>*</span><input type='text' class='form-control' id='changeTel' placeholder='하이픈없이 숫자만 입력' required ></div>";
             
        $("#address").empty();
        $("#address").append(str);
      }))      
      
      $(document).on("click","#backbtn",(function(){
        var str = "";
        str += "<table class='tb tbmember'>";
        str += "<tr>";
        str += "<td width='10%'>이름</td>";
        str += "<td>${memberVo.name }</td>";
        str += "<td rowspan='3'><input type='button' class='btn btn-secendary btn-sm' id='adrChange' value='변경'/></td>";
        str += "</tr>";
        str += "<tr>";
        str += "<td height='50px'>주소</td>";
        str += "<td>${memberVo.addr_master }${memberVo.addr_detail }</td>";
        str += "</tr>";
        str += "<tr>";
        str += "<td>휴대폰</td>";
        str += "<td>${memberVo.tel }</td>";
        str += "</tr></table>";
        
        $("#address").empty();
        $("#address").append(str);
      }));
      
  
      
      $("#point").change(function(){
        var pointUse = parseInt($(this).val());
        var mypoint = parseInt(document.myform.mypoint.value);
        var totalP = parseInt(document.myform.totalP.value);
        var post = parseInt(document.myform.post.value);
        if(pointUse!=0 && (mypoint<2000||pointUse<2000)){
          alert("포인트는 2000포인트 이상부터 사용 가능합니다.");
          $("#point").val("");
          return false;
        }
        else if(mypoint<pointUse){
          alert("포인트가 부족합니다.");
          $("#point").val("");
          return false;
        }
        document.myform.pointUse.value=pointUse;
        document.myform.totalPay.value=totalP+post-pointUse;
      });
  
  
    })
    
    function allPoint(point){
      var mypoint = parseInt(document.myform.mypoint.value); 
      var totalP = parseInt(document.myform.totalP.value);
      var post = parseInt(document.myform.post.value);
      if(point!=0 && (mypoint<2000||point<2000)){
        alert("포인트는 2000포인트 이상부터 사용 가능합니다.");
        document.myform.point.value=="";
        return false;      
      }
      document.myform.point.value=point;
      document.myform.pointUse.value=point;
      document.myform.totalPay.value=totalP+post-point;    
    }
  
    
    function fCheck(){
      var regExpName = /^[a-z|A-Z|가-힣|_]*$/;
      var regExpTel = /^[0-9|_]*$/;
      
    //주소가 변경되었다면 변경된 값 넣어주기
      if($("#adrChangeDiv").length!=0 && document.getElementById("changeName").value==""){ 
          alert("이름을 입력해주세요!");
          return false;
      } 
      else if ($("#adrChangeDiv").length!=0 && !regExpName.test(document.getElementById("changeName").value)){
        alert("이름을 정확히 입력해주세요(영문,한글 가능)");
        return false;
      } 
      else if ($("#adrChangeDiv").length!=0 && document.getElementById("changeAddr_master").value==""){
        alert("주소를 입력해주세요!");
        return false;
      } 
      else if ($("#adrChangeDiv").length!=0 && document.getElementById("changeTel").value==""){
        alert("휴대폰 번호를 입력해주세요!");
        return false;
      } 
      else if ($("#adrChangeDiv").length!=0 && !regExpTel.test(document.getElementById("changeTel").value)){
        alert("휴대폰 번호를 정확히 입력해주세요(숫자만 입력가능)");
        return false;
      } 
      //결제방법
      else if(document.myform.paymethod.value==""){
        alert("결제방법을 선택해주세요!");
        return false;
      }
      else if(document.myform.paymethod.value=="1"&&document.myform.card.value==""){
        alert("지불하실 카드사를 선택해주세요!");
        return false;
      }
      else if(document.myform.paymethod.value=="2"&&document.myform.bank.value==""){
        alert("입금하실 무통장 은행을 선택해주세요!");
        return false;
      }
      else if(document.myform.paymethod.value=="2"&&document.myform.depositName.value==""){
        alert("입금자명을 입력해주세요!");
        return false;
      }
      else if(document.myform.paymethod.value=="2"&&!regExpName.test(document.myform.depositName.value)){
        alert("이름을 정확히 입력해주세요(영문,한글 가능)");
        return false;
      }
      else if(myform.inforcheck.checked==false) {
        alert("구매조건 및 이용약관에 동의하셔야 합니다."); 
        return false;
      }
      else {
        if($("#adrChangeDiv").length!=0){
          document.myform.name.value=document.getElementById("changeName").value;
          document.myform.address.value=document.getElementById("changeAddr_master").value+document.getElementById("changeAddr_detail").value;
          document.myform.zipcode.value=document.getElementById("changeZipcode").value;            
          document.myform.tel.value=document.getElementById("changeTel").value;            
        }
  
        document.myform.action="${contextPath}/shopping/admin/shopping/product2/orderDone";
        document.myform.submit();
      }
    }
  </script> 
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<p><br/></p>
<div class="container">
<form name="myform" method="post">
  <!-- 헤드 -->
  <div class="head"><h2>주문/결제</h2></div>
  <p><br/></p> 
  
  <!-- 최종결제폼 -->
  <div class="right">
    <p><h4>주문결제 금액</h4></p>
    <p><br/></p>
    <div class="clear">
      <span class="alignleft">상품금액</span>
      <span class="alignright"><input type="text" name="totalP" value="${totalP }" class="inputbox" readonly/>원</span>
    </div>
    <div class="clear">
      <span class="alignleft">포인트차감(-)</span>
      <span class="alignright"><input type="text" name="pointUse" value="0" class="inputbox" readonly/>원</span>
    </div>
    <div class="clear">
      <span class="alignleft">배송비</span>
      <span class="alignright"><input type="text" name="post" value="${post }" class="inputbox" readonly/>원</span>
    </div>
    <hr width="90%" class="clear"/>
    <div class="clear">
      <span class="alignleft">총결제금액</span>
      <span class="alignright"><input type="text" value="${totalP+post }" name="totalPay" id="totalPay" class="inputbox" readonly/>원  </span>
      <p><span style="clear:both;" class="alignright">(
        <c:choose>
          <c:when test="${grade eq family }"><input type="text" name="pointIn" value="${totalP/100*1 }" class="point" readonly/></c:when>
          <c:when test="${grade eq silver }"><input type="text" name="pointIn" value="${totalP/100*2 }" class="point" readonly/></c:when>
          <c:when test="${grade eq gold }"><input type="text" name="pointIn" value="${totalP/100*3}" class="point" readonly/></c:when>
          <c:otherwise><input type="text" name="pointIn" value="${totalP/100*4 }" class="point" readonly/></c:otherwise>
        </c:choose>
        p 적립예정)</span>
      </p>
    </div>
    <hr class="clear"/>
    <div class="clear center">
      <p><a data-toggle="modal" data-target="#privacy3">개인정보 제3자 제공 동의</a></p>
      <p><a data-toggle="modal" data-target="#pay">결제대행서비스 이용 동의</a></p>    
    </div>
    <hr class="clear"/>
    <div class="clear" style="margin:0 5px;">
      <input type="checkbox" value="y" name="inforcheck"/>구매조건 및 이용약관에 동의하며, 결제를 진행합니다.
    </div>
    <p><br/><p>
    <div class="center">
      <input type="button" class="btn btn-secondary btn-lg" style="display:block;width:100%;" value="결제하기" onClick="fCheck()"/>
    </div>
  </div>
  
  <!-- 배송지정보 -->
  <div class="left" id="address">
    <table class="tb tbmember">
      <tr>
        <td width="10%">이름</td>
        <td>${memberVo.name }</td>
        <td rowspan="3"><input type="button" class="btn btn-secondary btn-sm" id="adrChange" value="변경"/></td>
      </tr>  
      <tr>
        <td height="50px">주소</td>
        <td>${memberVo.addr_master }${memberVo.addr_detail }</td>
      </tr>  
      <tr>
        <td>휴대폰</td>
        <td>${memberVo.tel }</td>
      </tr>  
    </table>
  </div>
  <p><br/></p>
  
  
  <!-- 주문정보 -->
  <!-- 장바구니 헤드 -->
  <div class="left">
  <table class="tb table-bordered">
   <thead>
    <tr class="tablehead">
      <td colspan="2">주문상품 : ${listVos.size() }개</td>
      <td>총상품금액</td>
    </tr>
    </thead>  
  <!-- 장바구니목록 -->
    <c:forEach var="listVo" items="${listVos }">
    <tbody>
    <tr align="center">
      <td><img src="${contextPath }/upload/${listVo.thumbImg}" class="thumb" width="100px"/></td>
      <td align="left" width="60%">
        <p>${listVo.product }</p>
        <p>${listVo.optionName }</p>
        <p>${listVo.price }</p>
        <p>수량 : ${listVo.optionNum }개</p> 
      </td>
      <td><h3><fmt:formatNumber value="${listVo.price*listVo.optionNum}" pattern="#,###"/></h3></td>
    </tr>
    </tbody>
    <input type="hidden" value="${listVo.idx }" name="idx"/> <!-- 장바구니번호배열 -->
    <input type="hidden" value="${listVo.product }" name="product"/> <!-- 상품이름배열 -->
    <input type="hidden" value="${listVo.optionIdx }" name="optionIdx"/> <!-- 상품이름배열 -->
    <input type="hidden" value="${listVo.optionNum }" name="optionNum"/> <!-- 장바구니에서 넘어오면서 바꾼수량배열 -->
    </c:forEach>
  </table>
  
  </div>
  <p><br/></p> 
  
  <!-- 포인트사용 -->
  <div class="left" style="border:1px solid #ccc;height:80px;align:center;">
   <table style="width:95%;margin:0 auto;">
    <tr>
      <td width="20%">포인트사용</td>  
      <td width="20%;"><span style="color:#ff6000;"><fmt:formatNumber value="${memberVo.point }" pattern="#,###" />P 보유</span></td>  
      <td style="text-align:right;padding:10px;"><input type="text" name="point" id="point" style="text-align:right;"/></td>  
      <td width="15%"><input type="button" class="btn btn-sm btn-outline-secondary" value="모두사용" onClick="allPoint(${memberVo.point})"/></td>  
    </tr>
   </table>
   <input type="hidden" name="mypoint" id="mypoint" value="${memberVo.point }"/>
   <p style="text-align:center;font-size:13px;">포인트사용은 2,000P 부터 사용 가능합니다.</p>
  </div>
  
  <!-- 배송시 요청사항 -->
  <div class="form-inline left">
    <label for="request">배송 요청사항</label>&nbsp;&nbsp;
    <select id="request" name="request" class="form-control" style="width:80%;" >
        <option value="">메세지를 선택해 주세요.</option>
        <option value="배송전, 연락부탁드립니다.">배송전, 연락부탁드립니다.</option>
        <option value="부재시, 전화 또는 문자  주세요.">부재시, 전화 또는 문자  주세요.</option>
        <option value="부재시, 경비(관리)실에 맡겨주세요.">부재시, 경비(관리)실에 맡겨주세요.</option>
    </select>
  </div>
  <p><br/></p> 
  
  <!-- 결제방법선택 -->
  <div class="left">
    <div class="inline title">일반결제</div>
    <div class="inline box" id="credit"><a><img src="${contextPath }/resources/images/creditCard_on.png"/><p><font size="2">신용카드</font></p></a></div>
    <div class="inline box" id="nobank"><img src="${contextPath }/resources/images/noBankbook_on.png"/><p><font size="2">무통장입금</font></p></div>
    <div class="inline box" id="realtime"><img src="${contextPath }/resources/images/realTime_on.png"/><p><font size="2">실시간계좌이체</font></p></div>
    <div class="inline box" id="phone"><img src="${contextPath }/resources/images/pPay_on.png"/><p><font size="2">휴대폰결제</font></p></div><br/>
  </div>
  
  <!-- 결제방법에 따른 부가창 -->
  <div id="sub">
  
  </div> 
  
  <!-- modal창 내용 -->
  <div class="modal" id="privacy3">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">개인정보 제 3자 제공 동의</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <%@include file="/WEB-INF/views/include/shop/privacy3.jsp" %>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal" id="pay">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">결제대행서비스 이용 동의</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <%@include file="/WEB-INF/views/include/shop/pay.jsp" %>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="last"></div>
  <input type="hidden" name="name" value="${memberVo.name}"/>
  <input type="hidden" name="address" value="${memberVo.addr_master}${memberVo.addr_detail}"/>
  <input type="hidden" name="tel" value="${memberVo.tel}"/>
  <input type="hidden" name="zipcode" value="${memberVo.zipcode}"/>
  <input type="hidden" name="paymethod"/>
</form>
</div>
<p><br/><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>