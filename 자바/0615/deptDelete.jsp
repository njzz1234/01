<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

   String url = "jdbc:oracle:thin:@//localhost:1521/xe";
   String username ="c##java";
   String userpass ="1234";
   // ojdbc6.jar(드라이버)
   Class.forName("oracle.jdbc.OracleDriver");
   Connection con = DriverManager.getConnection(url,username,userpass);
   Statement stmt = con.createStatement();
%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String deptno = request.getParameter("deptno");

	if (deptno == null || deptno.equals("")) {
		%>
		<Script>
		alert("잘못된 경로로의 접근입니다.");
		history.back();
		</script>
		<%
		return;    // jsp 종료
	}

	String sql = "DELETE FROM dept where deptno='"+deptno+"' ";
	int result = stmt.executeUpdate(sql);
	if (result ==1) {
		%>
	
	<script>
	alert("삭제완");
	location="deptList.jsp";
	</script>
<%
	} else {
%>	
 <script>
 alert("삭제실패");
 history.back();
  </script>
  <%
	}
  %>
  