<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String product_id= request.getParameter("product_id");
%>
  <%
//  detail.jsp?product_id=
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
String sql = " select product_name,product_price,product_info,product_date,company,manager_id "
		   + "   from product_tbl_10 "
		   + " where product_id='"+product_id+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if( rs.next() == false ) {
%>
		<script>
		alert("잘못된 경로로의 접근!!");
		location="index.jsp";
		</script>
<%
	return;
} 
String product_name = rs.getString("product_name");
String product_price = rs.getString("product_price");
String manager_id = rs.getString("manager_id");
String product_date = rs.getString("product_date");
String company = rs.getString("company");


%>  

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>layout2</title>
  <link rel="stylesheet" href="../css/layout.css">
</head>
<script>
function fn_submit() {
	var f = document.frm;
	if( f.product_id.value == "" ) {
		alert("상품ID을 입력해주세요.");
		f.product_id.focus();
		return false; // 종료
	}
	if( f.product_name.value == "" ) {
		alert("이름을 입력해주세요.");
		f.product_name.focus();
		return false; // 종료
	}
	if( f.product_price.value == "" ) {
		alert("단가를 입력해주세요.");
		f.product_price.focus();
		return false; // 종료
	}
	if( f.product_info.value == "" ) {
		alert("상품정보를 입력해주세요.");
		f.product_info.focus();
		return false; // 종료
	}
	if( f.product_date.value == "" ) {
		alert("등록일자를 입력해주세요.");
		f.product_date.focus();
		return false; // 종료
	}
	if( f.company.value == "" ) {
		alert("공급업체를 입력해주세요.");
		f.company.focus();
		return false; // 종료
	}
	if( f.manager_name.value == "" ) {
		alert("담당자를 입력해주세요.");
		f.manager_name.focus();
		return false; // 종료
	}
	f.submit();
}
</script>

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
<form name="frm" method="get" action="modifysave.jsp">
<table>
	<caption style="font-size:20px;
				    font-weight:bold;">상품 수정</caption>
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<th>상품ID</th>
		<td><input type="text" name="product_id" value="<%=product_id %>" style="width:99%;" readonly></td>
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
	<button type="submit" onclick="fn_submit();return false;">수정</button>
	<button type="button" onclick="location='search.jsp'">조회</button>
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