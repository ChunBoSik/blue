<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>right</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
    *{
     margin:2%;
    }
    #order{
     width:93%;
     float:left;
    }
    #QandA{
     width:93%;
     float:left;
    }
    #newMember{
     width:93%;
     float:left;
    }
  </style>
</head>
<body>
<div id="newMember">
  <h5><a href="${contextPath}/admin/hoewonList">NEW MEMBER (총 ${mcount} 명)></a></h5>
  <table class="table table-hover">
  <thead class="thead-light">
    <tr align="center">
      <th>아이디</th>
      <th>성명</th>
      <th>생일</th>
      <th>성별</th>
      <th>전자우편</th>
      <th>전화번호</th>                                    
      <th>가입일</th>
      <th>등급</th>
    </tr>
  </thead>
  <c:forEach var="vo" items="${mvo}">
    <tr align="center">
      <th>${vo.mid}</th>
      <th>
        <c:if test="${vo.inforcheck eq 'y'}">${vo.name}</c:if>
        <c:if test="${vo.inforcheck ne 'y'}">비공개</c:if>
      </th>
      <th>
        <c:if test="${vo.inforcheck eq 'y'}">${vo.bday}</c:if>
        <c:if test="${vo.inforcheck ne 'y'}">비공개</c:if>
      </th>
      <th>
        <c:if test="${vo.inforcheck eq 'y'}">${vo.gender}</c:if>
        <c:if test="${vo.inforcheck ne 'y'}">비공개</c:if>
      </th>
      <th>
        <c:if test="${vo.inforcheck eq 'y'}">${vo.email}</c:if>
        <c:if test="${vo.inforcheck ne 'y'}">비공개</c:if>
      </th>
      <th>
        <c:if test="${vo.inforcheck eq 'y'}">${vo.tel}</c:if>
        <c:if test="${vo.inforcheck ne 'y'}">비공개</c:if>
      </th>
      <th>
        <c:if test="${vo.inforcheck eq 'y'}">${vo.joinday}</c:if>
        <c:if test="${vo.inforcheck ne 'y'}">비공개</c:if>
      </th>
      <th>${vo.grade}</th>                           
    </tr>
  </c:forEach>
  </table>
</div>
<div id="order">
  <h5><a href="${contextPath}/admin/order/hoewon">주문확인/회원 (총 ${hcount} 개) ></a></h5>
  <table class="table table-hover">
    <thead class="thead-light">
      <tr align="center">
        <th>주문날짜</th>
        <th>성명</th>
        <th>상품</th>
        <th>가격</th>
      </tr>
    </thead>
    <c:forEach var="vo" items="${horder}">
      <tr align="center">
        <th>${vo.odate.substring(0,10)}</th>
        <th>${vo.name}</th>
        <th>${vo.list.split('&')[2]}&nbsp;외</th>
        <th>${vo.price }</th>         
      </tr>
    </c:forEach>
  </table>
  
  <h5><a href="${contextPath}/admin/order/guest">주문확인/비회원 (총 ${gcount} 개) ></a></h5>
  <table class="table table-hover">
    <thead class="thead-light">
      <tr align="center">
        <th>주문날짜</th>
        <th>성명</th>
        <th>상품</th>
        <th>가격</th>
      </tr>
    </thead>
    <c:forEach var="vo" items="${gorder}">
      <tr align="center">
        <th>${vo.odate.substring(0,10)}</th>
        <th>${vo.name}</th>
        <th>${vo.list.split('&')[2]}&nbsp;외</th>
        <th>${vo.price }</th>                         
      </tr>
    </c:forEach>
  </table>
</div>
<div id="QandA">
  <h5><a href="${contextPath}/board/hoewon/blist">TODAY 문의글/회원 (총 ${bcount}개)> </a></h5>
  <table class="table table-hover" style="width:100%">
        <thead class="thead-dark">
          <tr align="center">
            <th>글번호</th>
            <th>글제목 </th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>
      </thead>
      <c:forEach var="vo" items="${bvo}">
      <tbody>
        <tr align="center">
          <th>
            ${num}
          </th> 
          <th>
            <c:if test="${vo.opensw eq 'y' || vo.mid eq smid || amid ne null}"><a href="${contextPath}/board/hoewon/bcontent?idx=${vo.idx}&page=${pageMaker.criteria.page}"> ${vo.title}</a></c:if>
            <c:if test="${vo.opensw eq 'n'}">[비공개]</c:if>
            <c:if test="${today eq vo.wdate.substring(0,10)}"><span class="badge badge-secondary">New</span></c:if>
          </th>
          <th>${vo.name}</th>
          <th>${vo.wdate.substring(0,10)}</th>
          <th>${vo.readnum }</th>
        </tr>
      </tbody>
      </c:forEach>
    </table>
    
    <h5><a href="${contextPath}/board/hoewon/blist">TODAY 문의글/비회원 (총 ${guestCount}개)> </a></h5>
    <table class="table table-hover" style="width:100%">
        <thead class="thead-dark">
          <tr align="center">
            <th>글번호</th>
            <th>글제목 </th>
            <th>글쓴이</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>
      </thead>
      <c:forEach var="vo" items="${gvo}">
      <tbody>
        <tr align="center">
          <th>
            ${num}
          </th> 
          <th>
            <c:if test="${vo.opensw eq 'y' || vo.mid eq smid || amid ne null}"><a href="${contextPath}/board/hoewon/bcontent?idx=${vo.idx}&page=${pageMaker.criteria.page}"> ${vo.title}</a></c:if>
            <c:if test="${vo.opensw eq 'n'}">[비공개]</c:if>
            <c:if test="${today eq vo.wdate.substring(0,10)}"><span class="badge badge-secondary">New</span></c:if>
          </th>
          <th>${vo.name}</th>
          <th>${vo.wdate.substring(0,10)}</th>
          <th>${vo.readnum }</th>
        </tr>
      </tbody>
      </c:forEach>
    </table>
</div>
</body>
</html>