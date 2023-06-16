<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String empno = request.getParameter("empno");
if (empno == null || empno.equals("")) {
%>
<script>
alert("잘못된경로로접근");
history.back();
</script>	
<% return; 
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

</body>
</html>