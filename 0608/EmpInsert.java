package Emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;
import comm.DbConnect;

public class EmpInsert extends DbConnect{

	public static void main(String[] args) throws Exception {
		//DB연결 및 접속 인스턴스 생성
		Statement stmt = Connection().createStatement();
	    												
		//중복방지
		Scanner scn = new Scanner(System.in);
		System.out.println("--사원정보입력--");
		System.out.print("1.사원번호 : ");
		String empno = scn.next();
		String sql2 = "select count(*) cnt from emp "
					+ "where empno = '" + empno +"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt>0) {
			System.out.println("이미 사용중인 번호입니다.");
			System.out.println("종료합니다.");
			return;
		}
		//
		System.out.print("2.사원이름 : ");
		String ename = scn.next();
		System.out.print("3.직무 : ");
		String job = scn.next();
		System.out.print("4.매니저 번호 : ");
		String mgr = scn.next();
		System.out.print("5.입사년도(yy/mm/dd) : ");
		String hiredate = scn.next();
		System.out.print("6.급여 : ");
		String sal = scn.next();
		System.out.print("7.상여금 : ");
		String comm = scn.next();
		System.out.print("8.부서번호 : ");
		String deptno = scn.next();
		
		
		
		
		String sql = "insert into emp(empno,ename,job,mgr,"
				   + "hiredate,sal,comm,deptno) "
				   + "values('"+empno+"','"+ename+"','"+job+"','"+mgr+"',"
				   		  + "'"+hiredate+"','"+sal+"','"+comm+"','"+deptno+"')";
		//SQL 적용
		int result = stmt.executeUpdate(sql);
		
		if(result > 0) {
			System.out.println("변경완료");
		} else {
			System.out.println("변경실패");
		}

	}

}
