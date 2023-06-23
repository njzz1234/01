<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 -->
<%
String product_id = request.getParameter("product_id");
String product_name = request.getParameter("product_name");
String product_price = request.getParameter("product_price");
String product_info = request.getParameter("product_info");
String product_date = request.getParameter("product_date");
String company =  request.getParameter("company");
String manager_id = request.getParameter("manager_id");
%>
<!-- 널값 체크(제목,암호) -->
<%
if( product_id == null || product_name == null ) { 
%>
		<script>
		alert("잘못된 경로로의 접근");
		location="index.jsp";
		</script>
<%
	return; // jsp 중단
}

product_id = product_id.trim(); // 앞뒤공백제거
product_name  = product_name.trim();  // 앞뒤공백제거
%>
<!-- 저장 -->
<%

String sql = "insert into product_tbl_10(product_id,product_name,product_price,product_info,product_date,company,manager_id)"
		   + "values(product_tbl_10_seq.nextval,'"+product_name+"','"+product_price+"','"+product_info+"','"+product_date+"','"+company+"','"+manager_id+"') ";

Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
%>
<!-- 결과 메시지 출력 -->
<%
if( result == 1 ) {
%>
		<script>
		alert("상품등록이 완료되었습니다.");
		location = "index.jsp";
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



