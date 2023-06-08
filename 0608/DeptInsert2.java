package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptInsert2 {

	public static void main(String[] args) throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement();
		//여기까지가 접속
		//중복방지
		Scanner scn = new Scanner(System.in);
		System.out.println("--부서정보입력--");
		System.out.print("1.부서번호 : ");
		String deptno = scn.next();
		String sql2 = "select count(*) cnt from dept "
					+ "where deptno = '" + deptno +"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt>0) {
			System.out.println("이미 사용중인 번호입니다.");
			System.out.println("종료합니다.");
			return;
		}
		//
		System.out.print("2.부서이름 : ");
		String dname = scn.next();
		System.out.print("3.부서위치 : ");
		String loc = scn.next();
		
		String sql = "insert into dept(deptno,dname,loc) "
				   + "values('"+deptno+"','"+dname+"','"+loc+"')";
		
		int result = stmt.executeUpdate(sql);
		
		if(result > 0) {
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}

	}

}
