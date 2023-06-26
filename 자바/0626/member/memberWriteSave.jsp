<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터 값 설정 --> 
<%   
String userid = request.getParameter("userid");
String userpw = request.getParameter("userpw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String p1 = request.getParameter("p1");
String p2 = request.getParameter("p2");
String p3 = request.getParameter("p3");
String zipcode = request.getParameter("zipcode");
String addr = request.getParameter("addr");
String[] hobby = request.getParameterValues("hobby");
String email = request.getParameter("email");
String homepage = request.getParameter("homepage");

String birthday = year+"-"+month+"-"+day;
String phone = p1+"-"+p2+"-"+p3;
String hobby1 = ""; // 바둑,장기,체스

for(int i=0; i<hobby.length; i++ ) {
	hobby1 += hobby[i]+","; // 바둑,	
}
hobby1 = hobby1.substring(0,hobby1.length()-1);
%>

<!-- 중요 데이터 값의 널값 체크 -->
<%
if( userid ==null || userpw==null || name == null) {
%>
 <script>
 alert("잘못된접근");
 self.close();// 닫기
 </script>
<%
 return;
}
%>
<!-- 아이디 유효성체크, 중복체크 -->
<%
String ptn1 = "^[0-9a-zA-Z]{1}[0-9a-zA-Z_-]{5,11}"; // ^[] ^뒤에잇는걸로시작 
boolean chk1= userid.matches(ptn1); // true or false;
if (chk1==false) {
%>
	<script>
	alert("영문숫자6~12자");
	history.go(-1); // history.back()과 동일
	</script>
<%
	return;
}
String sql1 = "select count(*) cnt from memberinfo"
			+ " where userid='"+userid+"' ";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql1);
rs.next();
int cnt = rs.getInt("cnt");
if( cnt > 0) {
%>
	<script>
	alert("이미사용중인아이디");
	history.go(-1); // history.back()과 동일
	</script>

<%	
return;
}
%>

<!-- 데이터 저장후 메시지 출력 -->
<%
String sql2 = "insert into memberinfo ( "
			+ " unq "
			+ " ,userid "
			+ " ,userpw "
			+ " ,name "
			+ " ,gender "
			+ " ,birthday "
			+ " ,phone "
			+ " ,zipcode "
			+ " ,addr "
			+ " ,hobby "
			+ " ,email "
			+ " ,homepage "
			+ " ,rdate ) values ( "
			+ " memberinfo_seq.nextval "
			+ " ,'"+userid+"' "
			+ " ,'"+userpw+"' "
			+ " ,'"+name+"' "
			+ " ,'"+gender+"' "
			+ " ,'"+birthday+"' "
			+ " ,'"+phone+"' "
			+ " ,'"+zipcode+"' "
			+ " ,'"+addr+"' "
			+ " ,'"+hobby1+"' "
			+ " ,'"+email+"' "
			+ " ,'"+homepage+"' "
			+ " ,sysdate  ) ";

int result = stmt.executeUpdate(sql2);
if ( result == 1 ) {
%>
 <script>
 alert("저장완");
 location="../main/main.jsp"
 </script>
 <%
} else{
 %>
 <script>
 alert("회원가입실패");
 history.back();
 </script>
 <%
 return;
 }
 %>