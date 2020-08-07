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
  
  Calendar cal = Calendar.getInstance(); // 화면에 표시할 날짜
  
/*   int yy = vo.getYy();
  int mm = vo.getMm(); */
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

          //ScheduleDao dao = new ScheduleDao();
          
          String ymd = "";
          String memory = "";
          String title = "";
          while(cal.get(Calendar.MONTH) == mm) { // 해당 월을 만족하는 날까지 출력(예: 1월은 1~31, 2월은 2~28)
            ymd=cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
            //ScheduleVo vo = dao.sContent(ymd, mid);
            
            ArrayList<ScheduleVo> vos =  (ArrayList<ScheduleVo>) request.getAttribute("vos");  // springframework변수를 jsp변수로 가져오기(request.getAttribute("vos"))
            
            for(int i=0; i<vos.size(); i++) {
              ScheduleVo vo = vos.get(i);
              out.println(":"+vo.getIdx()+","+vo.getMemory()+":");
              
              if(vo.getMemory()==null)
                memory = "";
              else
                memory = vo.getMemory();

              title = vo.getTitle();
              
              if(memory.equals("1")) memory = "모임";
              else if(memory.equals("2")) memory = "업무";
              else if(memory.equals("3")) memory = "가족";
              else if(memory.equals("4")) memory = "친지";
              else if(memory.equals("0")) memory = "기타";
              else memory = "";
            
              /* out.println("car.YEAR=" + cal.get(Calendar.YEAR));
              out.println("car.MONTH=" + cal.get(Calendar.MONTH));
              out.println("car.DATE=" + cal.get(Calendar.DATE)); */
              Calendar calCur1 = Calendar.getInstance();
              Date d = new Date(calCur1.getTimeInMillis());  // Calendar를  Date로 변환하는 방법
              // Date to String
              //Date d = new Date(); // Date를 Calendar로 변환하는 방법
              //cal.setTime(d);
              

              // DB에 있는 일정 등록일자(sdate)
              SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              Date toSdate = transFormat.parse(vo.getSdate());
              
              String strSdate = transFormat.format(toSdate).substring(0, 10);
              String strDate = transFormat.format(d).substring(0, 10);   // 화면 출력날짜
              
              //Date sss = toSdate.get(toSdate.YEAR);
              
              /* if(d == toSdate) { */
              /* if(strDate.equals(strSdate)) { */
              String ymd1 = cal.get(Calendar.YEAR)+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE);
              out.println("ymd1=" + ymd1+ ", strSdate="+strSdate);
              
              
              if(ymd1.equals(strSdate)) {
                out.println("두날짜가 같다.");
              }
              else{
                out.println("두날짜가 다르다.");
              }
              
              
              //String strDate = cal.get(Calendar.YEAR).format(cal.getTime());
              
              if(d == toSdate) {
                out.println("<td bgcolor='#aaa'><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#fff'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>"); // 오늘날짜에 음영처리
              }
              else if(cal.get(Calendar.DAY_OF_WEEK) == 1) {
                out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#f00'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>");   // 일요일에 빨간색 글자처리
              }
              else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {
                out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#00f'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>");   // 토요일에 파랑색 글자처리
              }
              else {
                out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#000'>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></font></a></td>"); // 일반날짜는 검정색 처리
              }
              
               /* 
               if(cal.get(Calendar.YEAR)==calCur.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calCur.get(Calendar.MONTH) && cal.get(Calendar.DATE) == calCur.get(Calendar.DATE)) {
                 out.println("<td bgcolor='#aaa'><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#fff'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>"); // 오늘날짜에 음영처리
               }
               else if(cal.get(Calendar.DAY_OF_WEEK) == 1) {
                 out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#f00'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>");   // 일요일에 빨간색 글자처리
               }
               else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {
                 out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#00f'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>");   // 토요일에 파랑색 글자처리
               }
               else {
                 out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+vo.getTitle()+"'><font color='#000'>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></font></a></td>"); // 일반날짜는 검정색 처리
               }
                */
               
               /* 
               if(cal.get(Calendar.YEAR)==calCur.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calCur.get(Calendar.MONTH) && cal.get(Calendar.DATE) == calCur.get(Calendar.DATE)) {
                 out.println("<td bgcolor='#aaa'><a href='content.jsp?ymd="+ymd+"' title='"+title+"'><font color='#fff'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>"); // 오늘날짜에 음영처리
               }
               else if(cal.get(Calendar.DAY_OF_WEEK) == 1) {
                 out.print("<td><a href='content.jsp?ymd="+ymd+"' title='"+title+"'><font color='#f00'><b>"+cal.get(Calendar.DATE));
                 if(cal.get(Calendar.YEAR)==calCur.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calCur.get(Calendar.MONTH) && cal.get(Calendar.DATE) == calCur.get(Calendar.DATE)) {
                     out.print("<br/><span style='font-size:0.8em'>"+memory+"</span>");
                 }
                 out.print("</b></font></a></td>");   // 일요일에 빨간색 글자처리
               }
               else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {
                 out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+title+"'><font color='#00f'><b>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></b></font></a></td>");   // 토요일에 파랑색 글자처리
               }
               else {
                 out.println("<td><a href='content.jsp?ymd="+ymd+"' title='"+title+"'><font color='#000'>"+cal.get(Calendar.DATE)+"<br/><span style='font-size:0.8em'>"+memory+"</span></font></a></td>"); // 일반날짜는 검정색 처리
               }
                */

            }
             
             if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) // 토요일까지 출력하면 다음줄로 줄바꾸기
              out.println("</tr><tr>");
            
            cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1); // 다음날짜 셋팅하기(+1일)
          }
          
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
