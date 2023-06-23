<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/oracleCon.jsp" %>

<%
String product_id= request.getParameter("product_id");
String product_name = request.getParameter("product_name");
String product_price = request.getParameter("product_price");
String product_info = request.getParameter("product_info");
String manager_id = request.getParameter("manager_id");
String product_date = request.getParameter("product_date");
String company = request.getParameter("company");
%>
<!-- 저장(변경) -->
<%
String sql2 = " update product_tbl_10  set "
            + "   product_name='"+product_name+"', "
            + "   product_price='"+product_price+"', "
            + "   product_info='"+product_info+"', "
            + "   manager_id='"+manager_id+"', "
            + "   product_date='"+product_date+"', "
            + "   company='"+company+"' "
            + " where product_id='"+product_id+"'";
Statement stmt2 = con.createStatement();
int result = stmt2.executeUpdate(sql2);
%>
<!-- 결과 메시지 출력 -->
<%
if( result == 1 ) {
%>
		<script>
		alert("상품수정완료");
		location = "search.jsp";
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
