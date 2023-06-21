<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값 받기 설정 -->
<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>

<!-- 제목,암호에 관련한 NULL체크, 공백체크 -->
<%
if( title == null || pass == null ) { 
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

if( title.equals("") || pass.equals("") ) {
%>
		<script>
		alert("제목 또는 암호를 입력해주세요.");
		history.back();
		</script>
<%
	return; // jsp 프로그램 종료
}
%>

<!-- gid SQL 작성 및 적용 -->
<% 
String sql1 = "select nvl(max(gid),0)+1 as mygid  from reboard";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
rs1.next();
String mygid = rs1.getString("mygid");
%>
<!-- 입력 SQL 작성 및 적용 -->
<%
String sql2 = "insert into reboard"
            + "(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE,GID,THREAD)"
            + "values(reboard_seq.nextval,"
            + "'"+title+"',"
            + "'"+pass+"',"
            + "'"+name+"',"
            + "'"+content+"',"
            + "'0',"
            + "sysdate,"
            + "'"+mygid+"',"
            + "'a'   )";

int result = stmt1.executeUpdate(sql2); // 1
%>
<!-- 결과 메시지 출력 -->
<%
if( result == 1 ) {
%>
		<script>
		alert("등록완료!");
		location = "reBoardList.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("등록실패!");
		history.back();
		</script>
<%
}
%>
