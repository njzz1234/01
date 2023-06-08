package dept;

import java.sql.ResultSet;
import java.sql.Statement;

import comm.DbConnect;

public class DeptSelectList extends DbConnect{

	public static void main(String[] args) throws Exception {
		//접속내용의 인스턴스(객체) 처리
		//메모리의 생성
		Statement stmt = Connection().createStatement();
		
		//목록출력 SQL작성                //as cnt를 적지 않으면 count(*)로 출력됨
		String sql2 = "select count(*) as cnt from dept";
		//SQL 적용
		ResultSet rs2 = stmt.executeQuery(sql2);
		rs2.next();          //as명 들어감
		int total = rs2.getInt("cnt"); //as적지 않을경우 rs2.getInt("count(*)")
		
		String sql = "select deptno,dname,loc "
					+ "from dept order by deptno asc";
		//SQL 적용
		ResultSet rs = stmt.executeQuery(sql);
		
		System.out.println("[ 부서목록 ] 총 : " +total+ "개 입니다." );
		System.out.println("-------------------------");
		//rs.next=존재유무+다음포인터로 
		//데이터가 없을경우 false처리
		while(rs.next()) {
			String deptno = rs.getString("deptno");
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
			System.out.println(deptno + "," + dname + "," + loc);
		}
		
	}

}
