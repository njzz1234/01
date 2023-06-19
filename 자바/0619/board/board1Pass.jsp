<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <!-- 받기 설정 -->   
 <%
 String unq = request.getParameter("unq"); 
 %>   
 <!-- unq null 체크  -->
<%
   if(unq == null ||unq.equals("")){
%>
   <script>
   alert("잘못된 접근입니다.");
   location = "board1List.jsp";
   </script>
<%   
   return;
   }
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 암호 화면</title>
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
	if ( f.pass.value == "") {
		alert("암호을 입력해주세요.");
		f.pass.focus();
		return false; // 종료
	}
	f.submit();
}
</script>

<body>
<form name="frm" method="post" action="board1Delete.jsp">
<!-- unq(글넘버) 히든(사용자한테는 안보여줌) -->
<input type="hidden" name="unq" value="<%=unq %>">
<table>
 <caption style="font-size:20px; font-weight:bold;"> 암호입력 </caption>
 <colgroup>
  <col width="50"/>
  <col width="*"/>
 </colgroup> 
 <tr>

  <th>암호</th>
  <td><input type="password" name="pass" style="width:99%";></td>
 </tr> <tr>
 </tr>

</table>
<div style="width:600px;
			margin-top:10px;
			text-align:center;">
<button type="submit" onclick="fn_submit();return false;">삭제</button>
<button type="reset">취소</button>

</div>

</form>


</body>
</html>