package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptDelete {

	public static void main(String[] args) throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement();
		//여기까지가 접속
		System.out.println("--부서정보입력--");
		System.out.print("1.부서번호 : ");
		Scanner scn = new Scanner(System.in);
		String deptno = scn.next();
		
		String sql2 = "select count(*) cnt from dept "
				+ "where deptno = '" + deptno +"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt==0) {
		System.out.println("부서번호가 없습니다.");
		System.out.println("다시 입력해주세요.");
		return;
	}
		
		String sql = "delete from dept "
				   + "where deptno = "+deptno;
		
		int result = stmt.executeUpdate(sql);
		//delete가 실행됐을때 result 값이 1
		if(result > 0) {
			System.out.println("삭제완료");
		} else {
			System.out.println("변경실패");
		}
	}

}


