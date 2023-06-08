package dept;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import comm.DbConnect;

public class DeptInsert extends DbConnect{

	public static void main(String[] args) throws Exception {
		
		Statement stmt = Connection().createStatement();
		//여기까지가 접속
	
		String sql = "insert into dept(deptno,dname,loc) "
				   + "values('82','aa1','bb1')";
		
		int result = stmt.executeUpdate(sql);
		
		if(result > 0) {
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}

	}

}
