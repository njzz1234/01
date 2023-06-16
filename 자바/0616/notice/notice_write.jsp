<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/oracleCon.jsp" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
       font-size:12px;
       color:#111111;
       font-family:맑은고딕;
}
table {
         width:600px;
         border:1px solid #ccc;
         border-collapse:collapse;
}
th, td {
         border:1px solid #ccc;
         padding:5px;
}

</style>
<body>
<form name="frm" method="post" action="notice_write_save.jsp">

<table>
       <colgroup>
               <col width="25%" />
               <col width="*" />
       </colgroup>
	<tr>
	 <th> 제목</th><td><input type="text" name="title"></td></tr>
<tr>
	 <th>내용</th><td><input type="text" name="content"></td></tr>
</table>









<div style="width:600px;margin-top:10px;background:yellow;">
         <div style="width:100%; position:relative;left:45%;">
           <button type="submit">등록</button>
           <button type="reset">취소</button>
       </div>
</form>
</div>
</body>
</html>