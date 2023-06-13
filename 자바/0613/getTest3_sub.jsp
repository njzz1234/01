<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단독실행 불가</title>
</head>
<body>
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String[] hobby = request.getParameterValues("hobby");
String gg = "";
if(gender.equals("M")) {
	gg="남";
} else {
	gg="여";
}
%>
전송id : <%=userid %>
전송id : <%=pass %>
전송id : <%=name %>
전송성별 : <%=gender %>

<%
// String[] hobby = {"바둑","장기","체스");
if(hobby == null) {
	out.print("취미가 선택되지않았습니다");
} else {
	for (int i=0; i<hobby.length; i++) {
		out.print(hobby[i] + " ");
	}
}


%>

<input type="button" value="뒤로" onclick="history.back()">


</body>
</html>