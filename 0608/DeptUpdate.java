package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class DeptUpdate {

	public static void main(String[] args) throws Exception {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		Statement stmt = con.createStatement();
		//여기까지가 접속
		Scanner scn = new Scanner(System.in);
		System.out.println("--부서정보입력--");
		System.out.print("수정할 부서번호 :");
		String finddeptno = scn.next();
		//부서확인
		String sql2 = "select count(*) cnt from dept"
						+" where deptno = '"+finddeptno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("부서번호 존재X");
			System.out.println("프로그램 종료합니다.");
			return;
		}
		//바꿀 부서 중복여부
		System.out.print("1.부서번호 : ");
		String deptno = scn.next();
		String sql3 = "select count(*) cnt1 from dept"
				+" where deptno = '"+deptno+"'";
		ResultSet rs3 = stmt.executeQuery(sql3);
		rs3.next();
		int cnt1 = rs3.getInt("cnt1");
		if(cnt1 > 0) {
			System.out.println("부서번호가 이미 존재합니다.");
			System.out.println("프로그램 종료합니다.");
			return;
		}	
		
		System.out.print("2.부서이름 : ");
		String dname = scn.next();
		System.out.print("3.부서위치 : ");
		String loc = scn.next();
		String sql = "update dept set deptno = '"+deptno+"',dname = '"+dname+"',loc = '"+loc+"' "
				   + "where deptno = '"+finddeptno+"' ";
		
		int result = stmt.executeUpdate(sql);
		//update가 실행됐을때 result 값이 1
		if(result > 0) {
			System.out.println("변경완료");
		} else {
			System.out.println("변경실패");
		}
	}

}
