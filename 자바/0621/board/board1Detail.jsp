<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file ="../../include/oracleCon.jsp" %>

<!-- 파라메터 값 세팅 -->
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
<!-- 상세보기 SQL 작성 및 적용 -->
<%
   String sql =" select title,name,content,rdate " 
            +" from board1 where unq='"+unq+"' ";
   Statement stmt = con.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
	if( !rs.next()) {
	%>
	<script>
	alert("잘못된 경로");
	location="board1List.jsp"
	</script>
	<% return;	
	}
   String title = rs.getString("title");
   String name = rs.getString("name");
   String content = rs.getString("content");
   String rdate  = rs.getString("rdate");
   
   content=content.replace("\n", "<br>");
   
   stmt.executeUpdate("update board1 set hits=hits+1 where unq='"+unq+"' ");
   
%>

<!DOCTYPE html>

<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>게시판 상세보기</title>
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
<!-- 본문시작 -->
<table>
   <caption style="font-size:20px;
               font-weight:bold;">상세화면</caption>
   <colgrop>
      <col width="20%"/>
      <col width="*"/>
   </colgrop>

      <tr>
         <th>제목</th>
         <td><%=title%></td>
      </tr>
      <tr>
         <th>글쓴이</th>
         <td><%=name%></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><%=content%></td>
      </tr>
      <tr>
         <th>등록일시</th>
         <td><%=rdate%></td>
      </tr>
   </table>
<div style="width:600px;
          margin-top:10px;
          text-align:center;">
   <!--type= submit : 엔터키 사용 가능 button: 엔터키 사용불가  -->
   <button type="button" onclick="history.back();">이전</button>
   <button type="button" onclick="location='board1Modify.jsp?unq=<%=unq%>'">수정</button>
   <button type="button" onclick="location='board1Pass.jsp?unq=<%=unq%>'">삭제</button>
</div>


<!-- 본문끝  -->
       </article>
    </section>
    <footer>
        Footer 영역
    </footer>
</div>
</body>
</html>