<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>게시판글쓰기</title>
<style>
body{
	text-align: center;
	font-size:12px;
}
a {
	text-decoration: none;
}
.wrap {
    width:100%;
    height:900px;
    margin: 0px auto;
}
header{
   width:100%;
   height : 100px;
	line-height: 100px;
	margin-bottom:3px;
}
.top_header {
	width:100%;
	height:100px;
	background:#f2f2f2;
	float:left;
}
nav{
	background:#ffffcc;
	width:100%;
	height:30px;
	margin-bottom:3px;
	padding-top:5px;
	padding-bottom:5px;
	line-height:2.0;
}
aside {
	float:left; 
	line-height: 350px;
	background:#999900;
	width:200px;
	height:600px;
}
section{
	background:#f8f8f8;
	height : 600px;
	padding-left: 10px;
}
article {
	position:relative;
	width:100%;
	height:500px;
	padding-top:50px;
	padding-left:220px;
}
footer {
	background:#0099ff;            
	height : 55px;
	line-height : 55px;
}
.nav_left_space {
	position:relative;
	float: left;
	/*background:pink;*/
	width:10%;

}
.nav_left_space {
	position:relative;
	float: left;
	/*background:pink;*/
	width:10%;

}
.nav_right_space {
	position:relative;
	float: left;
	/*background:pink;*/
	width:10%;
}
.nav_center_space {
	position:relative;
	float: left;
	/*background:green;*/
	width:80%;
}

.menuLink {
	position:relative;
	float: left;
	left:12%;
	list-style: none; 
	background-color: #e4effc;  
	line-height: 30px;   
	text-align: center;
	width: 10%;   
	border:1px solid #ffffff;
	margin-top:-12px;
}

table {
    width: 600px;
    border: 1px solid #444444;
    border-collapse: collapse;
}
th, td {
    border: 1px solid #444444;
    padding: 10px;
}
function fn_submit() {
	var f = document.frm;
	if ( f.title.value == "") {
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false; // 종료
	}
	if ( f.pass.value == "") {
		alert("암호을 입력해주세요.");
		f.pass.focus();
		return false; // 종료
	}
	f.submit();
}

</style>
</head>
<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>
	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
		<ul>
			<li class="menuLink"><a href="../main/main.jsp">홈</a></li>
			<li class="menuLink"><a href="#">일정관리</a></li>
			<li class="menuLink"><a href="../board/board1List.jsp">게시판</a></li>
			<li class="menuLink"><a href="../board/reBoardList.jsp">답변게시판</a></li>
			<li class="menuLink"><a href="#">회원가입</a></li>
			<li class="menuLink"><a href="#">로그인</a></li>
		</ul>
		</div>
		<div class="nav_right_space">&nbsp;</div>
    </nav>
	<aside>
		aside 영역
	</aside>
    <section>
       <article>
<!-- 본문 스타트 -->
		
<form name="frm" method="post" action="board1WriteSave.jsp">
<table>
 <caption style="font-size:20px; font-weight:bold;"> 등록화면 </caption>
 <colgroup>
  <col width="50"/>
  <col width="*"/>
 </colgroup> 
 <tr>
  <th>제목</th>
  <td><input type="text" name="title" style="width:99%";></td>
 </tr>
 <tr>
  <th>암호</th>
  <td><input type="password" name="pass" style="width:99%";></td>
 </tr> <tr>
  <th>글쓴이</th>
  <td><input type="text" name="name" style="width:99%";></td>
 </tr> <tr>
  <th>내용</th>
  <td><textarea name="content" style="width:99%;height:100px;";></textarea></td>
 </tr>

</table>
<div style="width:600px;
			margin-top:10px;
			text-align:center;">
<button type="submit" onclick="fn_submit();return false;">저장</button>
<button type="reset">취소</button>

</div>

</form>

		
<!-- 본문 엔드 -->
       </article>
    </section>
    <footer>
        Footer 영역
    </footer>
</div>
</body>
</html>