<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값 받기 설정 -->
<%
String unq = request.getParameter("unq"); // 원글의 unq값
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>

<%
String sql1 = "select gid,thread from reboard "
            + " where unq='"+unq+"' ";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);
rs1.next();

String dbGid = rs1.getString("gid");
String dbThread = rs1.getString("thread"); // 원글 thread

String sql2 = "select nvl(max(thread),'1') as maxThread from reboard "
			+ " where gid = '"+dbGid+"' "
			+ " and thread like '"+dbThread+"_' ";
Statement stmt2 = con.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();

String maxThread = rs2.getString("maxThread");   // 1 or ac
String myThread = "";
if (maxThread.equals("1")) {
	// a-> a+"a"
	myThread = dbThread + "a";
	}	else {
		// ac --> ad
		// 'a', 'c' ;; 'c'++ -> 'd' ;; 'a'+'d'
		char lastWord = maxThread.charAt(maxThread.length()-1);
		lastWord++;
		myThread = dbThread + lastWord;
	}

String sql3 = "insert into reboard"
        + "(UNQ,TITLE,PASS,NAME,CONTENT,HITS,RDATE,GID,THREAD)"
        + "values(reboard_seq.nextval,"
        + "'"+title+"',"
        + "'"+pass+"',"
        + "'"+name+"',"
        + "'"+content+"',"
        + "'0',"
        + "sysdate,"
        + "'"+dbGid+"',"
        + "'"+myThread+"'   )";

int result = stmt1.executeUpdate(sql3); // 1
%>

<!-- 결과 메시지 출력 -->
<%
if( result == 1 ) {
%>
		<script>
		alert("등록완료!");
		location = "reBoardList.jsp";
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
