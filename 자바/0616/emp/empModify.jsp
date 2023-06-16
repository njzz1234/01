<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

          pageEncoding="UTF-8"%>

 

<!-- DB 연결 -->

<%@ include file="../include/oracleCon.jsp" %>

 

<%

String empno = request.getParameter("empno");

 

String sql1 = " SELECT ename "

                  + " ,job "

                  + " ,nvl(mgr,'0') mgr "

                  + " ,sal "

                  + " ,comm"

                  + " ,deptno"

                 + " ,to_char(hiredate,'yyyy-mm-dd') hiredate "

                 + " FROM emp "

                + " WHERE empno='"+empno+"' ";

Statement stmt1 = con.createStatement();

ResultSet rs1 = stmt1.executeQuery(sql1);

rs1.next();

 

String ename = rs1.getString("ename");

String job = rs1.getString("job");

String mgr = rs1.getString("mgr");

String sal = rs1.getString("sal");

String comm = rs1.getString("comm");

String deptno = rs1.getString("deptno");

String hiredate = rs1.getString("hiredate");

 

 

String sql2 = "SELECT distinct(job) as job FROM emp";

Statement stmt2 = con.createStatement();

ResultSet rs2 = stmt2.executeQuery(sql2);

 

String sql3 = " SELECT empno,ename FROM emp "

                   + "  ORDER BY ename ";

Statement stmt3 = con.createStatement();

ResultSet rs3 = stmt3.executeQuery(sql3);

 

String sql4 = "SELECT deptno,dname FROM dept ORDER BY dname ";

Statement stmt4 = con.createStatement();

ResultSet rs4 = stmt4.executeQuery(sql4);

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>사원등록</title>

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

}

</style>

 

<body>

<div>

<h2>사원등록</h2>

</div>

 

<form name="frm" method="post" action="empModifySave.jsp">

<table>

       <colgroup>

           <col width="25%" />

           <col width="*" />

       </colgroup>

       <tr>

                <th>사원번호</th>

                <td><input type="text" name="empno" value="<%=empno %>" readonly></td>

       </tr>

       <tr>

               <th>사원이름</th>

              <td><input type="text" name="ename" value="<%=ename %>"></td>

       </tr>

      <tr>

             <th>급여</th>

             <td><input type="number" name="sal" value="<%=sal %>"></td>

      </tr>

      <tr>

             <th>입사일</th>

             <td><input type="date" name="hiredate" value="<%=hiredate %>"></td>

      </tr>

      <tr>

              <th>업무</th>

             <td><select name="job">

             <%

              while( rs2.next() ) {

                     String job2 = rs2.getString("job");

             %>

                    <option value="<%=job2 %>"

                   <%

                     if( job.equals(job2) ) { out.print("selected"); }

                    %>><%=job2 %></option>

            <%

             }

             %>

                     </select>

               </td>

         </tr>

         <tr>

                  <th>매니저</th>

                  <td><select name="mgr">

           <%

           while( rs3.next() ) {

                  String empno3 = rs3.getString("empno");

                  String ename3 = rs3.getString("ename");

          %>

                           <option value="<%=empno3%>"

         <%

          if(mgr.equals(empno3)){ out.print("selected"); }

         %> ><%=ename3 %></option>

         <%

          }

         %>

                 </select>

              </td>

        </tr>

         <tr>

                <th>커미션</th>

                 <td><input type="number" name="comm" value="<%=comm%>"></td>

         </tr>

         <tr>

                <th>부서</th>

               <td>

                    <select name="deptno">

                <%

                while( rs4.next() ) {

                       String deptno4 = rs4.getString("deptno");

                       String dname4 = rs4.getString("dname");

                %>

                        <option value="<%=deptno4 %>"

               <%

                      if(deptno.equals(deptno4)){ out.print("selected"); }

               %> ><%=dname4 %></option>

              <%

                 }

               %>

               </select>

              </td>

         </tr>

</table>

 

<div style="width:600px;margin-top:10px;background:yellow;">

        <div style="width:100%; position:relative; left:45%;">

              <button type="submit">등록</button>

              <button type="reset">취소</button>

        </div>

</div>

</form>

 

</body>

</html>