<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>
<!-- 널값 체크(제목,암호) -->
<%
if( title == null || pass == null || unq == null ) { 
%>
		<script>
		alert("잘못된 경로로의 접근");
		location="board1List.jsp";
		</script>
<%
	return; // jsp 중단
}

title = title.trim(); // 앞뒤공백제거
pass  = pass.trim();  // 앞뒤공백제거

String sql = " select count(*) cnt from reboard "
           + "  where unq='"+unq+"' and pass='"+pass+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if( cnt == 0 ) {
%>
		<script>
		alert("암호가 일치하지 않습니다.");
		history.back();
		</script>
<%
	return;
}

%>
<!-- 저장(변경) -->
<%
String sql2 = "update reboard set "
            + "   title='"+title+"', "
            + "   name='"+name+"', "
            + "   content='"+content+"' "
            + " where unq='"+unq+"'";
int result = stmt.executeUpdate(sql2);
%>
<!-- 결과 메시지 출력 -->
<%
if( result == 1 ) {
%>
		<script>
		alert("수정완료!");
		location = "reBoardList.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("수정실패!");
		history.back();
		</script>
<%
}
%>



