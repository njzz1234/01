<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
//String viewPage = "1";
String viewPage = request.getParameter("viewPage");
if( viewPage == null ) {
	viewPage = "1";
}
//  1 ->  1,10 ;; 2 -> 11,20 ;; 3 -> 21,30 ;; 4 -> 31,40
int first_rn = ((Integer.parseInt(viewPage)-1) * 10) + 1;
int last_rn  = first_rn + 9;

String sql0 = "select count(*) total from board1";
Statement stmt0 = con.createStatement();
ResultSet rs0 = stmt0.executeQuery(sql0);
rs0.next();
int total = rs0.getInt("total");

//  12 -> 2; 11 -> 2; 19 -> 2
//  23 -> 3; 27 -> 3;
//  12.0/10 -> ceil(1.2) -> (int)2.0 -> 2
//  19.0/10 -> ceil(1.9) -> (int)2.0 -> 2
int lastpage = (int)Math.ceil((double)total/10);
int number = total - (Integer.parseInt(viewPage)-1)*10;

String sql1 = "select b.* from ( "
			+ "		select rownum rn, a.* from ( "
			+ "				select "
			+ "				   unq,title,name,hits,to_char(rdate,'yyyy-mm-dd') rdate " 
			+ "				from  board1 "
			+ "				 order by unq desc) a ) b "
			+ "	where "
			+ "	rn >= "+first_rn+" and rn <= "+last_rn;
Statement stmt1 = con.createStatement();
//out.print(sql1);
ResultSet rs1 = stmt1.executeQuery(sql1);
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록화면</title>
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

<body>
<table>
	<caption  style="font-size:20px;
				     font-weight:bold;">게시판 목록</caption>
	<colgroup>
		<col width="10%" />
		<col width="*" />
		<col width="15%" />
		<col width="10%" />
		<col width="15%" />
	</colgroup>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	
	<%
	while( rs1.next() ) {
		String unq = rs1.getString("unq");
		String title = rs1.getString("title");
		String name = rs1.getString("name");
		String hits = rs1.getString("hits");
		String rdate = rs1.getString("rdate");
    %>
		<tr>
			<td><%=number %></td>
			<td><a href="board1Detail.jsp?unq=<%=unq%>"><%=title %></a></td>
			<td><%=name %></td>
			<td><%=hits %></td>
			<td><%=rdate %></td>
		</tr>
	<%
		number--;
	}
	%>
</table>

<div style="width:600px;margin-top:10px;text-align:center;">
	 <!-- 페이징처리 -->
	  <%
	  for(int i=1; i<=lastpage; i++) {
	  %>
	  	  <a href="board1List.jsp?viewPage=<%=i%>"><%=i %></a> 
	  <%
	  }
	  %>
</div>

<div style="width:600px;margin-top:10px;text-align:right;">
	
	<button type="button" onclick="location='board1Write.jsp'">글쓰기</button>

</div>



</body>
</html>




