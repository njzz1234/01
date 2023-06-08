package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnect {
	
	public static Connection Connection() throws Exception{
		
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String username = "c##java";
		String userpass = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection(url,username,userpass);
		//작업내용을 담을 공간
		//작업공간이 많이필요할 경우 문제가 생김
		//Statement stmt = con.createStatement();
		return con;
	
	}
}
