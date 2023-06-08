package Emp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class EmpDelete extends DbConnect {

	public static void main(String[] args) throws Exception {
		Scanner scn = new Scanner(System.in);
		System.out.println("[ 사원정보삭제 ]");
		System.out.print("사원번호(삭제) : ");
		int empno = scn.nextInt();
		
		delete(empno);
	}
		
	public static void delete(int empno) throws Exception {
		
		Statement stmt = Connection().createStatement();
		Scanner scn = new Scanner(System.in);
		
		String sql1 = "select count(*) cnt from emp "
				+ "where empno = '" + empno +"'";
		//쿼리 적용
		ResultSet rs1 = stmt.executeQuery(sql1);
		rs1.next();
		
		int cnt = rs1.getInt("cnt");
		
		if(cnt == 0) {
			
		System.out.println("사원번호가 없습니다.");
		System.out.println("다시 입력해주세요.");
		return;
		
		} else {
			
			System.out.print("정말로 삭제하시겠습니까? (Y/N)");
			String del = scn.next();
			
			if(del.equals("Y")){	
				
				String sql2 = "delete from emp "
						   + "where empno = '"+empno+"'";
				int result = stmt.executeUpdate(sql2);
				//delete가 실행됐을때 result 값이 1
				
				if(result > 0) {
				
					System.out.println("삭제완료");
				
				} else {
					
					System.out.println("변경실패");
				
				  }
			} else {
				
				System.out.println("삭제하지 않겠습니다.");
				return;
			 
			  }
		  }
		
	}
}


