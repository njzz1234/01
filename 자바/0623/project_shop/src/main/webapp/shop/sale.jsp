<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file ="../include/oracleCon.jsp" %>

   <% 
  String sql = "select to_char(sale_date,'yyyy-mm-dd') sale_date ,sum(sale_price) sale_price from sale_tbl_10 group by sale_date order by sale_date desc";
  Statement stmt = con.createStatement();
  ResultSet rs =stmt.executeQuery(sql);    
  %> 
  <% 
  String sql2 = "select a.* from (select member_id, sum(sale_price) sale_price from sale_tbl_10 group by member_id order by sale_price desc) a where rownum='1'";
  Statement stmt2 = con.createStatement();
  ResultSet rs2 =stmt2.executeQuery(sql2); 
  rs2.next();
  String maxmem = rs2.getString("member_id");
  String maxprice = rs2.getString("sale_price");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출현황조회</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
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

		<table>
		<caption> 매출현황조회 </caption>

			 <tr>
				  <th>판매일자</th>
				  <th>판매금액</th>
			 </tr>
			 <%
				while(rs.next()){
					String sale_date = rs.getString("sale_date");
					String sale_price = rs.getString("sale_price");
				%>
				<tr>
					<td><%=sale_date %></td>
					<td><%=sale_price %></td>
					
				</tr>
				<%
				}
			 %>
		</table>
	<div style="width:600px;
		    margin-top:10px;
		    text-align:center;">
			<b>구매자 순위 1등<br>
			<%=maxmem%> &nbsp;&nbsp; <%=maxprice %></b>
		</div>
       </article>
    </section>
    <footer>
        Footer 영역
    </footer>
</div>
</body>
</html>