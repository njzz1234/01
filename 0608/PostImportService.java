package post;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Statement;
import java.util.Calendar;

import comm.DbConnect;

public class PostImportService  extends DbConnect {

	public static void main(String[] args) throws Exception {
		String path = "c:/temp100/post1.csv";
		postImport(path);
	}

	
	
	public static void postImport(String path) throws Exception {
		
		Statement stmt = Connection().createStatement();
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		
		FileReader file = new FileReader(path);
		BufferedReader buffer = new BufferedReader(file);
		
		String rowData = "";
		int cnt = 0;
		
		
		while(true) { // while true 무한 반복 
 				if ( (rowData = buffer.readLine()) != null) {
 					rowData = rowData.replace("'","''"); // replace(old, new)
 					
 					String[] datas = rowData.split(",");
					//210762,강원도,강릉시,연곡면,영진리, ,연곡부영사랑으로~~
 										
 					String sql = "insert into post2 values"
 							+ "('"+datas[0]+"'"
 							+ ",'"+datas[1]+"'"
 							+ ",'"+datas[2]+"'"
 							+ ",'"+datas[3]+"'"
 							+ ",'"+datas[4]+"'"
 							+ ",'"+datas[5]+"'"
 							+ ",'"+datas[6]+"' )";
 							
 				int result = stmt.executeUpdate(sql);
				if(result == 1) {
					cnt++; 
				}
				
				} else break;  // while 종료 
				
				
			}
		
			cal= Calendar.getInstance();
			long t2 = cal.getTimeInMillis();
			
			long t3 = t2 - t1;
			
			System.out.println( t3 + "밀리 초");
			System.out.println( "총 " + cnt + "건 입력완료 ");
		
	}
}
