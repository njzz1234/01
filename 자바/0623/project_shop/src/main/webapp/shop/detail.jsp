<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메서 값 세팅 -->
<%
String product_id = request.getParameter("product_id");
%>
  
<%
//  detail.jsp?unq=
if( product_id == null || product_id.equals("") ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="index.jsp";
		</script>
<%	
	return;
}
%>

<!-- 상세보기 SQL 작성 및 적용 -->
<%
String sql1 = 
"		select  product_id,product_name,product_price,product_info,to_char(product_date,'yyyy-mm-dd') product_date,manager_id " 
+ "				from  product_tbl_10 "
+ "				 order by product_id desc ";
Statement stmt1 = con.createStatement();
//out.print(sql1);
ResultSet rs1 = stmt1.executeQuery(sql1);

if( rs1.next() == false ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="index.jsp";
		</script>
<%
	return;
} 

String product_name = rs1.getString("product_name");
String product_price = rs1.getString("product_price");
String manager_id = rs1.getString("manager_id");
String product_date = rs1.getString("product_date");
String company = rs1.getString("company");


%>  

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>게시판 상세보기</title>
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
	<!-- 본문 S -->
<form name="frm" method="post" action="addsave.jsp">
<table>
	<caption style="font-size:20px;
				    font-weight:bold;">상품 등록</caption>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>상품ID</th>
		<td><input type="text" name="product_id"  style="width:99%;"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="product_name" style="width:99%;"></td>
	</tr>
	<tr>
		<th>단가</th>
		<td><input type="text" name="product_price" style="width:99%;"></td>
	</tr>
	<tr>
		<th>상품정보</th>
		<td>
			<textarea name="product_info" style="width:99%;height:100px;"></textarea> 
		</td>
	</tr>
		<tr>
		<th>등록일자</th>
		<td><input type="date" name="product_date" style="width:99%;"></td>
	</tr>
		<tr>
		<th>공급업체</th>
		<td><input type="text" name="company" style="width:99%;"></td>
	</tr>
		<tr>
		<th>담당자</th>
		<td><input type="text" name="manager_id" style="width:99%;"></td>
	</tr>
</table>
<div style="width:600px;
			margin-top:10px;
			text-align:center;">
	<button type="submit" onclick="fn_submit();return false;">저장</button>
	<button type="reset">취소</button>
</div>
</form>
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