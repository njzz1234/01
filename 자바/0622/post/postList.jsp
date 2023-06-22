<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<%
String viewPage = request.getParameter("viewPage");
if( viewPage == null ) {
	viewPage = "1";
} 
int s_pageno = 0;
int e_pageno  = 0;
int vpage = Integer.parseInt(viewPage);

// 전체 데이터 개수 
String sql1 = "select count(*) total from post1";
Statement stmt1 = con.createStatement();
ResultSet   rs1 = stmt1.executeQuery(sql1);
rs1.next();
int total = rs1.getInt("total");
int lastpageno = (int)Math.ceil(total/10); 

s_pageno = ((vpage-1)/10)*10 + 1; // 반복문 시작 값
e_pageno  = s_pageno+(10-1);      // 반복문 종료 값 
// 10
if( lastpageno < e_pageno ) {
	e_pageno = lastpageno;
}

int nextpageno = e_pageno + 1;  // 11
if( e_pageno >= lastpageno ) nextpageno = -1;  // next가 없는 경우

int befpageno = s_pageno - 1;  

int s_index = (vpage-1)*10 + 1;
int e_index = s_index + (10-1);

String sql2 = " select p2.* from ( "
            + "   select rownum rn, p1.* from ( "
            + "     select a1 AS postnum "
            + "           ,a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7 "
            + "           AS address "
            + "       from post1 order by a1 ) p1 ) p2"
            + " where rn between "+s_index+" and " + e_index;
Statement stmt2 = con.createStatement();
ResultSet   rs2 = stmt2.executeQuery(sql2);

%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>우편번호검색</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
	
	<!-- nav menu S -->
		<%@ include file="../include/navmenu.jsp" %>
	<!-- nav menu E -->
		
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
	<!-- aside area S -->
		<%@ include file="../include/aside.jsp" %>
	<!-- aside area E -->
	</aside>
    <section>
       <article>
	<!-- 본문 S -->
    
    <table style="width:700px;">
    	<tr>
    		<th width="50">번호</th>
    		<th width="70">우편번호</th>
    		<th width="*">주소</th>
    	</tr>
    <%
    while(rs2.next()) {
    	String postnum = rs2.getString("postnum");
    	String address = rs2.getString("address");
    %>
    	<tr>
    		<td></td>
    		<td><%=postnum %></td>
    		<td align="left"><%=address %></td>
    	</tr>
    <%
    }
    %>
    </table>
    
    <div style="width:700px;text-align:center;margin-top:10px;"> 
    	
    	<a href="postList.jsp?viewPage=1">[firstpage]</a>
    	
    	<%
    	if( befpageno <= 0) { out.print("[before]"); }
    	else {
    	%>
    		<a href="postList.jsp?viewPage=<%=befpageno %>">[before]</a>
    	<%
    	}
    	%>
    	&nbsp;&nbsp;
    	<% 
    	for(int i=s_pageno; i<=e_pageno; i++) {
    	%>
    		<a href="postList.jsp?viewPage=<%=i%>"><%=i %></a>
    	<%
    	}
    	%>
    	&nbsp;&nbsp;
    	<!-- 11 ~ 20  -->
    	<%
    	if( nextpageno == -1 ) { out.print("[next]"); }
    	else {
    	%>
    		<a href="postList.jsp?viewPage=<%=nextpageno%>">[next]</a>
    	<%
    	}
    	%>
    	<a href="postList.jsp?viewPage=<%=lastpageno %>">[lastpage]</a>
    	
    </div>
     

    <!-- 본문 E -->
       </article>
    </section>
    <footer>
	<!-- footer area S -->
		<%@ include file="../include/footer.jsp" %>
	<!-- footer area E -->
    </footer>
</div>
</body>
</html>