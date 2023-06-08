package Emp;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpUpdate extends DbConnect {

	public static void main(String[] args) throws Exception {
		
		Statement stmt = Connection().createStatement();
		//여기까지가 접속
		Scanner scn = new Scanner(System.in);
		System.out.println("--사원정보입력--");
		System.out.print("수정할 데이터의 사원번호 :");
		String findempno = scn.next();
		//부서존재유무
		String sql2 = "select count(*) cnt from emp"
						+" where empno = '"+findempno+"'";
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();
		int cnt = rs2.getInt("cnt");
		if(cnt == 0) {
			System.out.println("사원번호 존재X");
			System.out.println("프로그램 종료합니다.");
			return;
		}
		//바꿀 사원 중복여부
		System.out.print("1.사원번호 : ");
		String empno = scn.next();
		String sql3 = "select count(*) cnt1 from emp"
				+" where empno = '"+empno+"'";
		ResultSet rs3 = stmt.executeQuery(sql3);
		rs3.next();
		int cnt1 = rs3.getInt("cnt1");
		if(cnt1 > 0) {
			System.out.println("사원번호가 이미 존재합니다.");
			System.out.println("프로그램 종료합니다.");
			return;
		}	
		
		System.out.print("2.사원이름 : ");
		String ename = scn.next();
		System.out.print("3.직무 : ");
		String job = scn.next();
		System.out.print("4.매니저번호 : ");
		String mgr = scn.next();
		System.out.print("5.입사일자 : ");
		String hiredate = scn.next();
		System.out.print("6.급여 : ");
		String sal = scn.next();
		System.out.print("7.상여금 : ");
		String comm = scn.next();
		System.out.print("8.부서번호 : ");
		String deptno = scn.next();
		
		String sql = "update emp set empno = '" + empno + "', ename = '" + ename + "', job = '" + job + "', "
			    + "mgr = '" + mgr + "', hiredate = TO_DATE('" + hiredate + "','YY/MM/DD'), "
			    + "sal = " + sal + ", comm = " + comm + ", deptno = " + deptno + " "
			    + "where empno = '" + findempno + "'";
		
		int result = stmt.executeUpdate(sql);
		//update가 실행됐을때 result 값이 1
		if(result > 0) {
			System.out.println("변경완료");
		} else {
			System.out.println("변경실패");
		}
	}

}
