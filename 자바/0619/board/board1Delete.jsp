<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>
<!--  null 체크 -->


<!--  삭제 sql 작성 및 적용 -->
<%
String sql = "delete from board1 "
			+ " where unq='"+unq+"' and pass='"+pass+"' ";



Statement stmt = con.createStatement();

int result = stmt.executeUpdate(sql);
if (result == 1) {
    %>
    <script>
    alert("t삭제완료");
    location="board1List.jsp";
    </script>
<%
} else {
%>    <script>
    alert("암호가틀렷습니다");
    location="board1List.jsp";
    history.back();
    </script>	
<%
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