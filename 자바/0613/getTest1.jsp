<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET 방식 테스트</title>
</head>
<body>

<%

String eng = request.getParameter("eng");
out.print(eng+"<br>");
String kor = request.getParameter("kor");
out.print(kor);
int hap = Integer.parseInt(eng) + Integer.parseInt(kor);
out.print("합계 : " + hap);
%>

</body>
</html>