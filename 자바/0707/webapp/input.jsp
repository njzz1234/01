<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
(1) Input.jsp  

<form name="frm" method="post" action="/servlet/InputSave">
ID : <input type="text" name="userid"> <br>
PW : <input type="text" name="userpass"> <br>
NM : <input type="text" name="name"> <br>
<input type="submit" value="SEND">

</form>
</body>
</html>