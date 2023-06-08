package Emp;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class EmpSelectList extends DbConnect {

	public static void main(String[] args) throws Exception {
	     //인스턴스(객체)처리	 //접속정보	  메모리 작업공간발생(객체처리)
		Statement stmt = Connection().createStatement();
		//목록갯수
		String sql1 = "select count(*) as total from emp";
		//query 적용
		ResultSet rs1 = stmt.executeQuery(sql1);
		int total = 0;
		if(rs1.next()) {
			//컬럼명을 통해 해당 요소에 접근
			total = rs1.getInt("total");
		} else {
			return;
		}
		
		//목록출력
		String sql2 = "select empno"
					+ "		 ,ename"
					+ "		 ,job"
					+ "		 ,mgr"
					+ "		 ,to_char(hiredate,'yyyy-mm-dd')hiredate"
					+ "		 ,sal"
					+ "		 ,comm"
					+ "		 ,deptno "
					+ "from emp "
					+ "order by empno asc";
		//query적용
		ResultSet rs2 = stmt.executeQuery(sql2);
		
		System.out.println("[ 사원목록 ] 총 : " +total+ "개 입니다." );
		System.out.println("-------------------------");
		
		while(rs2.next()) {
		    String empno = rs2.getString("empno");
		    String ename = rs2.getString("ename");
		    String job = rs2.getString("job");
		    String mgr = rs2.getString("mgr");
		    String hiredate = rs2.getString("hiredate");
		    String sal = rs2.getString("sal");
		    String comm = rs2.getString("comm");
		    String deptno = rs2.getString("deptno");
		    
		    System.out.printf("%-5s %-10s %-10s %-5s %-12s %-8s %-8s %-5s%n",
		            empno, ename, job, mgr, hiredate, sal, comm, deptno);
		}
		
	}

}
