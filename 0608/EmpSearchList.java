package Emp;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpSearchList extends DbConnect{
   
   public static void main(String[] args) throws Exception{
   System.out.println("[사원검색 프로그램]");
   System.out.println("1.사원명 검색 2.부서별 검색 3.업무별 검색 4.매니저별 검색 5.급여별 검색");
   System.out.println("번호>>");
   Scanner scn = new Scanner(System.in);
   int menu = scn.nextInt();
   //메뉴
   switch(menu) {
   case 1 : enameSearch();
   break;
   case 2 : dnameSearch();
   break;
   case 3 : jobSearch();
   break;
   case 4 : mgrnameSearch();
   break;
   case 5 : salSearch();
   break;
   }
   }
   
//메소드
   public static void enameSearch() throws Exception{
    
	  //db연결 + 객체화(메모리공간=stmt 확보)
      Statement stmt =Connection().createStatement();
     
      Scanner scn = new Scanner(System.in);
      System.out.println("[1]사원명 검색");
      System.out.println("사원명>>");
      String ename = scn.next(); // 사원명=ename

      /* 목록출력
      String sql = "select empno,  \n"  // \n = console에서 개행
    		    + "     job, \n"
                + "     sal, \n"
                + "     mgr, \n"
                + "     (select ename from emp where empno=e.mgr) mgr_name, \n" //사원이름이있는테이블emp  
                + "     deptno,  \n"
                + "     (select dname from dept where deptno = e.deptno) dname  \n" // 부서이름이있는테이블dept
                + "from emp e" // ㅁ
                +" where e.ename=upper('"+ename+"')";   // upper 대문자처리
      */
      
      
      String sql = "select e1.empno as empno,  \n"  // \n = console에서 개행
    		  + "     e1.ename as ename, \n"
    		  + "     e1.job as job, \n"
              + "     e1.sal as sal, \n"
              + "     e1.mgr as mgr, \n"
              + "     e2.ename as mgr_name, \n" // 매니저이름  
              + "     e1.deptno as deptno,  \n"
              + "    d.dname as dname \n" 		// 부서이름
              + "from emp e1, dept d, emp e2 " //e1= ename e2=mgr_name
              + " where e1.deptno=d.deptno(+) " //(+) null값인게있어도 출력
              + "and e1.mgr = e2.empno(+) "
              + "and e1.ename=UPPER('"+ename+"')";
    
      
     // System.out.println(sql);  sql 항목 확인
      
      
      //설정한 sql을 실제 db에(stmt) 적용한다=executeQuery
      ResultSet rs = stmt.executeQuery(sql);
      System.out.println("[사원정보]");
      
      int cnt = 0;
      while(rs.next()) { // 목록을 한 행씩 가져온다 ( 출력 내용의 존재 여부)
         cnt++; // 증가
         String empno =rs.getString("empno"); // getstring,getint 데이터 가져오는 함수
         String job =rs.getString("job");
         String sal =rs.getString("sal");
         String mgr =rs.getString("mgr");
         String deptno =rs.getString("deptno");
         String mgr_name =rs.getString("mgr_name");
         String dname =rs.getString("dname");
         System.out.println("1.사원번호: "+empno+",\n"+
                        "2.업무: "+job+",\n"+
                        "3.급여: "+sal+",\n"+
                        "4.매니저번호: "+mgr+",\n"+
                        "5.부서번호: "+deptno+",\n"+
                        "6.매니저이름: "+mgr_name+",\n"+
                        "7.부서이름: "+dname
                        );
      }
      if(cnt==0) {  // 증가 x 
         System.out.println("***검색 결과가 없습니다.***");
      }
   }
   
   
   
   
   
   public static void dnameSearch() throws Exception {
      Statement stmt = Connection().createStatement();
      Scanner scn = new Scanner(System.in);
      System.out.print("부서명 >> ");
      String dname = scn.next(); // dname=부서명
      
      String sql = " select "
      		+ "    e.empno as empno,"
      		+ "    e.ename as ename,"
      		+ "    e.job as job ,"
      		+ "    d.dname as dname"
      		+ " from emp e, dept d" 
      		+ " where "
      		+ " e.deptno= d.deptno(+)" 
      		+ " and"
      		+ " d.dname=UPPER('"+dname+"')";
      
      
      ResultSet rs = stmt.executeQuery(sql);
      while(rs.next()) {
    	  String empno= rs.getString("empno");
    	  String ename= rs.getString("ename");
    	  String job= rs.getString("job");
    	  dname = rs.getString("dname");
      System.out.println(empno+","+ename+","+job+","+dname);
          }
      
   }
   
   
   
   
   
   
   public static void jobSearch() throws Exception {
	      Statement stmt = Connection().createStatement();
	      Scanner scn = new Scanner(System.in);
	      System.out.print("업무명 >> ");
	      String job = scn.next();
	      
	      String sql = " select \r\n"
	      		+ "    e.empno,\r\n"
	      		+ "    e.ename,\r\n"
	      		+ "    e.job,\r\n"
	      		+ "    d.dname\r\n"
	      		+ " from emp e, dept d\r\n"
	      		+ " where \r\n"
	      		+ " e.deptno= d.deptno(+)\r\n"
	      		+ " and\r\n"
	      		+ " e.job=UPPER('"+job+"')";
	      
	      ResultSet rs = stmt.executeQuery(sql);
	      while(rs.next()) {
	    	  String empno= rs.getString("empno");
	    	  String ename= rs.getString("ename");
	    	  job= rs.getString("job");
	    	  String dname = rs.getString("dname");
	      System.out.println(empno+","+ename+","+job+","+dname);  
	    	  
	      }
   }
   
   
   
   public static void mgrnameSearch() throws Exception {
	      Statement stmt = Connection().createStatement();
	      Scanner scn = new Scanner(System.in);
	      System.out.print("매니저명 >> ");
	      String mgrname = scn.next();
	   
	      String sql = " select "
		      		+ "    e1.empno as empno,"
		      		+ "    e1.ename as ename,"
		      		+ "    e1.job as job,"
		      		+ " e1.mgr as mgr, "
		      		+ " e2.ename as mgrname "
		      		+ " from emp e1, emp e2"
		      		+ " where "
		      		+ " e1.mgr = e2.empno " // 같은번호 조인
		      		+ " and "
		      		+ " e2.ename=UPPER('"+mgrname+"')";
	      
	      
	      ResultSet rs = stmt.executeQuery(sql);
	      while(rs.next()) {
	    	  String empno= rs.getString("empno");
	    	  String ename= rs.getString("ename");
	    	  String job= rs.getString("job");
	    	  String mgr= rs.getString("mgr");
	    	  mgrname = rs.getString("mgrname");
	      System.out.println(empno+","+ename+","+job+","+mgr+","+mgrname);  
	    	  
	    	  
	      }
	      
   }
   
   
   
   public static void salSearch() throws Exception {
	      Statement stmt = Connection().createStatement();
	      Scanner scn = new Scanner(System.in);
	      System.out.print("급여등급 >> ");
	      String grade = scn.next();
	      
	      String sql = "select e.empno as empno,"
	    		 +  " e.ename as ename,"
	    		 +  " e.sal as sal,"
	    		 +  " s.grade as grade"
	    		+  "  from emp e, salgrade s"
	    		+ " where "
	    		+ " e.sal between s.losal and s.hisal"
	    		+ " and "
	    		+ " s.grade = '"+grade+"'";
	    		  
	    		  
	      ResultSet rs = stmt.executeQuery(sql);
	      while(rs.next()) {
	    	  String empno= rs.getString("empno");
	    	  String ename= rs.getString("ename");
	    	  String sal= rs.getString("sal");
	    	  grade = rs.getString("grade");
	      System.out.println(empno+","+ename+","+sal+","+grade);  
	    	  
	      }
	      
   }
   
   
   
}