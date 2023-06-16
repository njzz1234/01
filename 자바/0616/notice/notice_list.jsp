<%@page import="java.sql.ResultSet"%>
<%@ include file="../include/oracleCon.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Statement stmt = con.createStatement();
String sql = "  SELECT  unq "
              + "           , title  title "
               + "          ,content   content "
                + "        , hits  hits "
                + "      ,to_char(rdate,'yyyy-mm-dd') rdate "
                + "   FROM notice "
                + " ORDER BY rdate ASC  ";
ResultSet rs = stmt.executeQuery(sql);


%>    
    
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
      text-align:center;
}

</style>
<body>
<form name="frm" method="post" action="notice_list.jsp">

<table>
      <colgroup>
           <col width="10%"/>
           <col width="15%"/>
           <col width="15%"/>
           <col width="25%"/>
           <col width="25%"/>
           <col width="10%"/>
           <col width="10%"/>
      </colgroup>
      <tr>
          <th>고유번호</th>
          <th>제목</th>
          <th>내용</th>
          <th>조회수</th>
           <th>등록일</th>
           <th>수정</th>
                <th>삭제</th>
       </tr>
<%
int number = 0;
while( rs.next() ) {
       number++;
       String unq = rs.getString("unq");
       String title = rs.getString("title");
       String content = rs.getString("content");
       String hits = rs.getString("hits");
       String rdate = rs.getString("rdate");
%>
       <tr>
              <td><%=number %></td>
              <td><%=title %></td>
              <td><%=content %></td>
<td><a href="notice_modify.jsp?unq=<%=unq%>"><%=unq %></a></td>
              <td><%=hits %></td>
              <td><%=rdate %></td>
              <td><button type="button">삭제</button></td>
       </tr>
<%
}

%>

 

</table>


</form>
</body>
</html>