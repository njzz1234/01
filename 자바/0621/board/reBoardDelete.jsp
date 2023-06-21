<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%> 
<!-- 고유번호,암호의 null 체크 -->
<!-- 하위 댓글 존재 여부의 SQL 작성 및 적용 -->
<%
String sql1 = "select gid,thread from reboard "
            + " where unq='"+unq+"' and pass='"+pass+"' ";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
if( !rs1.next() ) {
%>
		<script>
		alert("암호를 잘못입력했습니다.");
		history.back();
		</script>		
<%
	return;
}
String dbGid = rs1.getString("gid");
String dbThread = rs1.getString("thread");

String sql2 = " select count(*) cnt from reboard "
		    + " where gid='"+dbGid+"' "
		    + "   and thread like '"+dbThread+"_'  ";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt("cnt");

String sql3 = "";
if( cnt > 0 ) {  // 하위 레벨 존재
	sql3 = " update reboard set title='글쓴이에 의한 삭제',content='' "
	     + " where unq='"+unq+"' ";
} else {  
	// 하위 레벨 미존재
	sql3 = " delete from reboard where unq='"+unq+"' ";
}
int result = stmt2.executeUpdate(sql3);
if( result == 1 ) {
%>
		<script>
		alert("삭제처리 완료!");
		location="reBoardList.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("삭제처리 실패!");
		location="reBoardList.jsp";
		</script>
<%
}
%>





