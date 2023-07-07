<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Connection con = DbConnect.oracleCon();

String sql = "select code, title,"
			+ " to_char(sdate,'yyyy-mm-dd') sdate,"
			+ " to_char(sdate,'yyyy-mm-dd') edate,"
			+ "decode (use,'Y','사용','N','미사용') use "
			+ "FROM pollmain "
			+ " ORDER BY code DESC ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
body {
	font-size:12px;
	font-family:맑은고딕;
}
.table1 {
	width:600px;
	border:1px solid #ccc;
	border-collapse:collapse;    /* cell 간격제거 */
}
.table1 th,td {
	padding:5px;
	border:1px solid #ccc;
}
.textarea {
	width:98%; height:100px;
}
.input {
	width:98%;
}
.div1 {
	width:600px;
	text-align:center;
	margin-top:10px;
}
</style>
<body>
<table class="table1">
 <tr>
  <th width="7%">번호</th>
  <th width="*">제목</th>
  <th width="">기간</th>
  <th width="12%">결과보기</th>
  <th width="8%">사용여부</th>
</tr>
<%
int number=0;
while(rs.next()) {
number++;
String code = rs.getString("code");
String title = rs.getString("title");
String sdate = rs.getString("sdate");
String edate = rs.getString("edate");
String use = rs.getString("use");
%>
<tr align = "center">
 <td></td>
 <td align="left"><a href="pollModify.jsp?code=<%=code %>"><%=title %></a></td>
 <td><%=sdate %>~<%=edate %></td>
 <td><button type="button">결과보기</button></td>
 <td><%=use %></td>
</tr>
<%
}
%>
</table>
</body>
</html>