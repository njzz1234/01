<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  주석1 -->
<% //Random random = new Random(); 주석2 %>
<%-- 주석3 --%>

<%
Random random = new Random();
%>
<%= random.nextInt(45) %><br>
<%= random.nextBoolean() %><br>
<%= random.nextLong() %><br>
<%= Math.random() %><br>
</body>
</html>