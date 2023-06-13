<%@page import="java.util.Calendar"%>
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

<%
String address = "123456 서울시 강남구 논현동77";
%>
1.길이 : <%=address.length() %><br>
2.우편번호 : <%=address.substring(0,6) %><br>
3.주소 : <%=address.substring(6) %><br>
4.검색단어 "논현" : <%=(address.indexOf("논현")>-1)?"존재함":"존재안함" %><br>


<%
String birthday = "20100115 20011225 19981102" ;
Calendar cal = Calendar.getInstance();
int yy = cal.get(Calendar.YEAR);
String[] birthdays= birthday.split(" ");
%>
전송데이터 : <%=birthday %><br>

<%
for(int i=0; i<birthdays.length; i++) {
	String y =birthdays[i].substring(0,4);
	String m =birthdays[i].substring(4,6);
	String d =birthdays[i].substring(6);
	int age = yy - Integer.parseInt(y);

 %>
 데이터 <%=i+1 %> : 나이(만 <%=age %> ), 생일(<%=m %>월<%=d %>일) <br>
<%
}
%> 
</body>
</html>