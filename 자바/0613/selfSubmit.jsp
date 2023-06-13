<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("name");
String tell=request.getParameter("tell");

if ( name != null
 && tell != null
 && !name.equals("")
 && !tell.equals("") )
{ 
	out.print(name + "님의 전번은 " + tell + "입니다.");
	} else {
		out.print(" ");
	}

%>
<form name="frm" method="post" action="<%=request.getRequestURI()%>">
이름 : <input type="text" name="name" >
전번 : <input type="text" name="tell" >
<input type="submit" value="전송" >
</form>
<%%>
</body>
</html>