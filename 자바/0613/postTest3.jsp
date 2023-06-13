<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POST 세팅</title>
</head>
<body>
<form name="frm" method="post" action="getTest3_sub.jsp"> <!-- action 받는놈 -->
아이디 <input type="text" name="userid"> <br>
암호 <input type="text" name="pass"> <br>
이름 <input type="text" name="name"> <br>
성별 <input type="radio" name="gender" value="M">남성, <br>
<input type="radio" name="gender" value="F">여성<br>
취미 : <input type="checkbox" name="hobby" value ="바둑"> 바둑,<br>
<input type="checkbox" name="hobby" value ="장기"> 장기,<br>
<input type="checkbox" name="hobby" value ="체스"> 체스,<br>


<input type="submit" value="전송">
</form>


</body>
</html>