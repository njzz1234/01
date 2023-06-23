<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String sql1 = "	select product_id,product_name,product_price,product_info,to_char(product_date,'yyyy/mm/dd') product_date,decode(manager_id,'E201','김사원','E202','이대리') manager_id  ,company "
 + " from product_tbl_10 order by product_id asc";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>게시판 목록</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<div class="wrap">
    <header>
		<div class="top_header">
	<!-- head menu S -->
		<%@ include file="../include/header.jsp" %>
	<!-- head menu E -->
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

    <section>
       <article>
<!-- 본문 START -->

<table>
	<caption  style="font-size:20px;
				     font-weight:bold;">상품 조회/수정</caption>

	<tr>
		<th>상품ID</th>
		<th>이름</th>
		<th>단가</th>
		<th>담당자</th>
		<th>등록일자</th>
		<th>공급업체</th>
	</tr>
	
	<%
	while( rs1.next() ) {
		String product_id = rs1.getString("product_id");
		String product_name = rs1.getString("product_name");
		String product_price = rs1.getString("product_price");
		String manager_id = rs1.getString("manager_id");
		String product_date = rs1.getString("product_date");
		String company = rs1.getString("company");
    %>
		<tr>
			<td><%=product_id %></td>
			<td><a href="modify.jsp?product_id=<%=product_id%>"><%=product_name %></a></td>
			<td><%=product_price %></td>
			<td><%=manager_id %></td>
			<td><%=product_date %></td>
			<td><%=company %></td>
		</tr>
	<%
	}
	%>
</table>


	
	
<!-- 본문 END -->	
       </article>
    </section>
    <footer>
        Footer 영역
    </footer>
</div>
</body>
</html>