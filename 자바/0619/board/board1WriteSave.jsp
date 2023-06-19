<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!--db연결  -->
  <%@ include file="../include/oracleCon.jsp" %>
  <!--파라메터 값 설정  -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>
  <!--널값 체크(제목,암호)  -->
  <%
  if ( title == null || pass==null ) {
%>
 <script>
 alert("잘못된 경로로 접근");
 location="board1List.jsp";
 </script>
 <%
 return; // jsp 중단
   }
 title=title.trim(); // 앞뒤공백제거
 pass=pass.trim(); // 패스워드 앞뒤공백제거
  %>
  <!-- 저장 -->
  
  <%
  String sql = "insert into board1(unq,title,pass,name,content,rdate,udate)"
   + "values(board1_seq.nextval,'"+title+"','"+pass+"','"+name+"','"+content+"',sysdate,sysdate)"; // 위랑아래랑같게 사용자가 입력할 내용: "+항목+"
 Statement stmt = con.createStatement();
 int result = stmt.executeUpdate(sql);
 
  %>
  <!--결과메시지출력  -->
  <%
  if ( result == 1) {
%> 
 <script>
 alert("등록완료");
 location="board1List.jsp";
 </script>	  
  <%
  } else {
    %> 
    <script>
    alert("등록실패");
    history.back();
    </script>
    <%
    }
    %>