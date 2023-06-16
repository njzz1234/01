<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  db연결 -->
<%@ include file="../include/oracleCon.jsp" %>
<% 
   Statement stmt = con.createStatement();
%>
<%
	String title  = request.getParameter("title");
	String content = request.getParameter("content");
	String unq= request.getParameter("unq");
	String hits = request.getParameter("hits");
	String rdate = request.getParameter("rdate");

	%>	

	
<% 
	if(title == null || title.equals("") ||
	   content == null || content.equals(""))
	   {
%>
	<script>
	alert("제목을 입력해주세요.");
	history.back()	//이전 페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}

	if(title == null || title.equals("") ){
%>
	<script>
	alert("내용을 입력해주세요");
	history.back(); //이전페이지로 돌려보냄
	</script>
<%
	return; //jsp 종료
	}
	%>
	
<!-- 입력SQL 작성 및 적용 -->
<% 
String sql2 = "insert into notice(title,content,unq,hits,rdate) "
			+" values ('"+title+"','"+content+"','"+unq+"','"+hits+"','"+rdate+"')";
int result = stmt.executeUpdate(sql2) ;
%>
<!-- 저장완료 메세지 -->
<%
if(result == 1){
%>
	<script>
	alert("저장완료");
	location ="notice_list.jsp";
	</script>
<%
} else{
%>	
	<script>
	alert("저장실패!!");
	history.back();
	</script>
<%
}
%>