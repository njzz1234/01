<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!--db연결  -->
  <%@ include file="../include/oracleCon.jsp" %>
  <!--파라메터 값 설정  -->
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>
  <!--널값 체크(제목,암호)  -->
  <%
  if ( title == null || pass==null || unq==null) {
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
  
  <!--  패스워드 비교(같으면 업데이트) -->
 <% 
  String sql1 = "select count(*) cnt from board1  "
  + " where unq='"+unq+"' and pass='"+pass+"' ";
  Statement stmt = con.createStatement();
  ResultSet rs1 = stmt.executeQuery(sql1);
  rs1.next();
  int cnt = rs1.getInt("cnt");
  if (cnt == 0 ) {
  %>	  
		<script>
		alert("암호가 일치하지않습니다");
		history.back();
		</script>
	<% 	return;	
  }	
  %>
  
  <!-- 저장 -->
  
  <%
  String sql = "update board1 set"
  			+ " title = '"+title+"', "
  			+ " name='"+name+"',  "
  			+ "  content='"+content+"', "
  			+ " udate=sysdate "
  			+ " where unq='"+unq+"' ";

 int result = stmt.executeUpdate(sql);
 
  %>
  <!--결과메시지출력  -->
  <%
  if ( result == 1) {
%> 
 <script>
 alert("수정완료");
 location="board1List.jsp";
 </script>	  
  <%
  } else {
    %> 
    <script>
    alert("수정실패");
    history.back();
    </script>
    <%
    }
    %>