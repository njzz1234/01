<%@ page import="java.sql.ResultSet"%>

<%@ page import="java.sql.Statement"%>

<%@ page import="java.sql.DriverManager"%>

<%@ page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

                  pageEncoding="UTF-8"%>

 

<!-- DB연결 -->

<%@ include file="../include/oracleCon.jsp" %>

 

<%

Statement stmt = con.createStatement();

%>

 

<!-- 파라메터 값 받기 설정 -->

<%

String empno = request.getParameter("empno");

String ename = request.getParameter("ename");

String job = request.getParameter("job");

String hiredate = request.getParameter("hiredate");

String sal = request.getParameter("sal");

String mgr = request.getParameter("mgr");

String comm = request.getParameter("comm");

String deptno = request.getParameter("deptno");

%>

 

<!-- empno,ename의 널값&공백값 체크 -->

<%

if(   empno == null || empno.equals("") ||

      ename == null || ename.equals("") )

{

%>

       <script>

             alert(‎"사원번호,사원명은 필수 사항입니다.");

             history.back();

       </script>

<%

      return; // jsp 종료

}

%>

 

<!-- 입력SQL 작성 및 적용 -->

<%

String sql2 = "update emp set "

                   + "        ename='"+ename+"'"

                   + "      , sal='"+sal+"' "

                   + "      , hiredate='"+hiredate+"' "

                   + "      , job='"+job+"' "

                   + "      , mgr='"+mgr+"' "

                   + "      , comm='"+comm+"' "

                   + "      , deptno='"+deptno+"' "

                   + "  where "

                   + "      empno='"+empno+"' ";

 

int result = stmt.executeUpdate(sql2);

%>

<!-- 저장완료 메시지 -->

<%

if( result == 1 ) {

%>

       <script>

         alert(‎"수정완료!!");

         location="empList.jsp";

      </script>

<%

} else {

%>

        <script>

          alert(‎"수정실패!!");

          history.back();

       </script>

<%

}

%>