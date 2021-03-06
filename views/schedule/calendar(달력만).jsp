<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.blue.vo.ScheduleVo" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>calendar.jsp(달력)</title>
  <style>
    table {
      margin:0px auto;
      width:400px;
      height:450px;
      border:1px solid #ccc;
    }
    th, td {
      text-align:center;
      border:1px solid #ccc;
    }
    th {
      border:0px;
    }
    .tblc {
      text-align:center;
      height:70px;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<%
  Calendar calCur = Calendar.getInstance(); // 오늘날짜 저장변수
  String ymdCalCur = calCur.get(Calendar.YEAR)+"-"+(calCur.get(Calendar.MONTH)+1)+"-"+calCur.get(Calendar.DATE);
  if(!ymdCalCur.substring(5, 7).equals("10") && !ymdCalCur.substring(5, 7).equals("11") && !ymdCalCur.substring(5, 7).equals("12")) {
    ymdCalCur = ymdCalCur.substring(0, 5)+"0"+ymdCalCur.substring(5);
  }
  if(ymdCalCur.length()==9) {
    ymdCalCur = ymdCalCur.substring(0, 8)+"0"+ymdCalCur.substring(8);
  }
  
  
  Calendar cal = Calendar.getInstance(); // 화면에 표시할 날짜
  
  int yy = request.getParameter("yy")==null?cal.get(Calendar.YEAR):Integer.parseInt(request.getParameter("yy"));
  int mm = request.getParameter("mm")==null?cal.get(Calendar.MONTH):Integer.parseInt(request.getParameter("mm"));
  
  cal.set(yy, mm, 1); // 날짜를 현재년도, 현재월의 1일로 셋팅 
  
  int startWeek = cal.get(Calendar.DAY_OF_WEEK);  // 시작요일
  
  int prevYear = yy;        // 이전년도
  int prevMonth = (mm) - 1; // 이전월
  int nextYear = yy;        // 다음년도
  int nextMonth = (mm) + 1; // 다음월
  
  if(prevMonth < 0) { // 1월에서 '전월' 버튼을 클릭시 발생처리
    prevYear--;
    prevMonth = 11;
  }
  
  if(nextMonth > 11) { // 12월에서 '다음월' 버튼을 클릭시 발생처리
    nextYear++;
    nextMonth = 0;
  }
%>
<p><br/></p>
<div>
  <table>
    <tr>
      <th class="tblc">
        <a href="${contextPath}/schedule/calendar?yy=<%=prevYear-1%>" title="전년도">◀◀</a>&nbsp;
        <a href="${contextPath}/schedule/calendar?yy=<%=prevYear%>&mm=<%=prevMonth%>" title="전달">◁</a>
         &nbsp; <%=yy%>년 <%=mm+1%>월 &nbsp;
        <a href="${contextPath}/schedule/calendar?yy=<%=nextYear%>&mm=<%=nextMonth%>" title="다음달">▷</a>&nbsp;
        <a href="${contextPath}/schedule/calendar?yy=<%=nextYear+1%>" title="다음년도">▶▶</a>
      </th>
      <th style="text-aling:right">
        <a href="${contextPath}/schedule/calendar" title="오늘">Home</a>
      </th>
    </tr>
    <tr>
      <td colspan=2>
        <table boder=1>
          <tr>
            <th><font color="#f00">일</font></th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th><font color="#00f">토</font></th>
          </tr>
          <tr>
<%        // 시작요일만큼 공백열 추가
          for(int i=1; i<startWeek; i++) {
            out.println("<td>&nbsp;</td>");
          }

          
          String ymd = "";
          String memory = "";
          String title = "";
          while(cal.get(Calendar.MONTH) == mm) { // 해당 월을 만족하는 날까지 출력(예: 1월은 1~31, 2월은 2~28)
              // 화면에 보여주는 달력날짜
              String ymd1 = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
              // 아래 if문3개는 '오늘' 표시하기위한 준비(날짜 결합)
              if(!ymd1.substring(5, 7).equals("10") && !ymd1.substring(5, 7).equals("11") && !ymd1.substring(5, 7).equals("12"))
                ymd1 = ymd1.substring(0, 5)+"0"+ymd1.substring(5);
              if(ymd1.length()==9)
                ymd1 = ymd1.substring(0, 8)+"0"+ymd1.substring(8);
              if(ymd1.equals(ymdCalCur))  // 달력날짜와 오늘날짜가 같으면 주황색으로 날짜 표시한다.
                out.println("<td><a href='"+request.getContextPath()+"/schedule/content?ymd="+ymd1+"'><font color='orange'>"+cal.get(Calendar.DATE)+"</font></a><br/><span style='font-size:0.8em'>오늘</span></td>");
              else { // 아래 else이하 문장은 일반 날짜인경우 처리
                if(cal.get(Calendar.DAY_OF_WEEK) == 1) // 일요일 빨강 글자표시
                  out.println("<td><a href='"+request.getContextPath()+"/schedule/content?ymd="+ymd1+"'><font color='#f00'>"+cal.get(Calendar.DATE)+"<br/></font></a></td>");
                else if(cal.get(Calendar.DAY_OF_WEEK) == 7) // 토요일 파랑 글자표시
                  out.println("<td><a href='"+request.getContextPath()+"/schedule/content?ymd="+ymd1+"'><font color='#00f'>"+cal.get(Calendar.DATE)+"<br/></font></a></td>");
                else  // 평일은 검정글자표시
                  out.println("<td><a href='"+request.getContextPath()+"/schedule/content?ymd="+ymd1+"'><font color='#000'>"+cal.get(Calendar.DATE)+"<br/></font></a></td>");
              }
            // 여기까지 빈 달력루틴...
            
            /* 토요일까지 출력하면 다음줄로 줄바꾸기 */
            if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) { 
              out.println("</tr><tr>");
            }
            cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1); // 다음날짜 셋팅하기(+1일)
          }
          
          // 마지막 일(30/31) 출력후 비는 열(공간) 공백으로 채우기
          if(cal.get(Calendar.DAY_OF_WEEK) <= 7) {
            for(int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) {
              out.println("<td>&nbsp;</td>");
            }
          }
%>          
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>
