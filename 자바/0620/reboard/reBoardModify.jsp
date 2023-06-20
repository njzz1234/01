<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메서 값 세팅 -->
<%
String unq = request.getParameter("unq");
%>
  
<!-- unq의 null 체크 -->
<%
//  detail.jsp?unq=
if( unq == null || unq.equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="reBoardList.jsp";
		</script>
<%	
	return;
}
%>

<!-- 상세보기 SQL 작성 및 적용 -->
<%
String sql = " select title,name,content,rdate "
		   + "   from reboard "
		   + " where unq='"+unq+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if( rs.next() == false ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="board1List.jsp";
		</script>
<%
	return;
} 
String title   = rs.getString("title");
String name    = rs.getString("name");
String content = rs.getString("content");

%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>
</head>
<style>
body {
	font-size:12px;
	font-family:맑은 고딕;
}
table {
	width:600px;
	border:1px solid #555;
	border-collapse:collapse;
}
th,td {
	border:1px solid #555;
	padding:5px;
}
</style>

<script>
function fn_submit() {
	var f = document.frm;
	if( f.title.value == "" ) {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false; // 종료
	}
	if( f.pass.value == "" ) {
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false; // 종료
	}
	f.submit();
}
</script>
<body>
<form name="frm" method="post" action="reBoardModifySave.jsp">

<input type="hidden" name="unq" value="<%=unq %>">

<table>
	<caption style="font-size:20px;
				    font-weight:bold;">(답변게시판)수정화면</caption>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="<%=title %>" style="width:99%;"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" style="width:99%;"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="name" value="<%=name %>" style="width:99%;"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" style="width:99%;height:100px;"><%=content %></textarea> 
		</td>
	</tr>
</table>
<div style="width:600px;
			margin-top:10px;
			text-align:center;">
	<button type="submit" onclick="fn_submit();return false;">저장</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>


