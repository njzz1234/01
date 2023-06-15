<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

   String url = "jdbc:oracle:thin:@//localhost:1521/xe";
   String username ="c##java";
   String userpass ="1234";
   Class.forName("oracle.jdbc.OracleDriver");
   Connection con = DriverManager.getConnection(url,username,userpass);
   Statement stmt = con.createStatement();
%>    
  <% request.setCharacterEncoding("utf-8");
  %>  
    <%
    String deptno = request.getParameter("deptno");
    String sql = "select dname,loc from dept where deptno='"+deptno+"' ";
    ResultSet rs = stmt.executeQuery(sql); 
    rs.next();
    String dname = rs.getString("dname");
    String loc = rs.getString("loc");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서등록</title>
</head>
<body>
<form name="frm" method ="post" action ="deptModifySave.jsp">
<table border="1" width="400">
	<tr>
		<td>부서번호</td>
		<td><input type="text" name="deptno" width="200" value="<%=deptno %>"></td>
	</tr>
	<tr>
		<td>부서이름</td>
		<td><input type="text" name="dname" width="200" value="<%=dname %>"></td>
	</tr>
	<tr>
		<td>부서위치</td>
		<td><input type="text" name="loc" width="200" value="<%=loc %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="submit">저장</button>
		<button type="reset">취소</button>
		<button type="button" onclick="location='deptList.jsp'">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>