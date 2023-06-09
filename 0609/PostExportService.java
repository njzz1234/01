package post;

import java.io.File;
import java.io.FileWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Scanner;

import comm.DbConnect;

public class PostExportService extends DbConnect {

	public static void main(String[] args) throws Exception {
		
		System.out.println("< 익스포트할 자료 선택 >");
		System.out.println("1. 우편번호자료 \n2.사원정보자료");
		Scanner scn = new Scanner(System.in);
		System.out.print("번호 선택>>");
		int number = scn.nextInt();
		switch(number) {
		case 1 : postExport();
		break;
		case 2 : empExport();
		break;
		default : System.out.println("없는번호입니다.");
		}
	}

	public static void postExport() throws Exception {
		
		System.out.println("*** 우편번호 정보 다운받는중 ***");
		//DB연결 + 작업공간생성
		Statement stmt = Connection().createStatement();
		
		//유닉스 시간 세팅
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		String t1_str = t1+"";  // 숫자타입 값을 문자 타입 값으로 받음
		
		// 파일명 제작
		String filename = "post_" + t1_str.substring(t1_str.length()-5) + ".txt";
		
		// 생성된 파일 경로
		String downFilePath = "c:/temp100/"+filename;
		String dir = "c:/temp100";
		File fileDir = new File(dir);
		if( !fileDir.exists() ) { // fileDir의 존재유무 !(부정)이 붙엇으니 만약 filedir가없으면
		fileDir.mkdir();          // make directory
		}
		/*
		 * 1. 출력 sql 제작
		 * 2. 반복문을 이용하여 입력 내용을 특정 변수에 적재
		 * 3. 적재된 변수를 이용하여 파일 생성
		 */
		
		String sql = "SELECT a1, (a2||' '||a3||' '||a4||' '||a5||' '||a6||' '||a7) addr "
				+ " FROM POST2 ";
		ResultSet rs = stmt.executeQuery(sql);
		String content = "";
	
		int cnt = 0;		
		
		while (rs.next()) {
			String a1 = rs.getString("a1");
			String addr = rs.getString("addr");
			content += a1 + "," + addr+ "\n";
			cnt++;
			// System.out.println(a1+","+addr);
		}

		File file = new File(downFilePath); // file 임포트
		FileWriter fw = new FileWriter(file,false); // false = 덮어쓰는개념
		fw.write(content);
		fw.close();
		
		//유닉스 시간 세팅
		cal = Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		
		System.out.println(cnt + "행 ");
		System.out.println( (t2-t1)/1000 + "초 ");
		System.out.println(downFilePath + "로 다운받았습니다.");
	
	
	}
	
	public static void empExport() throws Exception {
		
		System.out.println("*** 사원번호정보 다운받는중 ***");
		//DB연결 + 작업공간생성
		Statement stmt = Connection().createStatement();

		//유닉스 시간 세팅
		Calendar cal = Calendar.getInstance();
		long t1 = cal.getTimeInMillis();
		String t1_str = t1+"";
		
		// 파일명 제작
		String filename = "emp_" + t1_str.substring(t1_str.length()-5) + ".txt";
		
		// 생성된 파일 경로
		String downFilePath = "c:/temp100/"+filename;
		String dir = "c:/temp100";
		File fileDir = new File(dir);
		if( !fileDir.exists() ) { 
		fileDir.mkdir();         
		}
		
		
		String sql = "select e1.empno as empno"
				+ ", e1.ename as ename"
				+ ", e1.job as job"
				+ ", e2.ename as mgr_name"
				+ ", d.dname as dname"
				+ ", e1.hiredate as hiredate"
				+ ", (to_char(sysdate,'yyyy') - to_char(e1.hiredate,'yyyy')) as year1"
				+ " from "
				+ "  emp e1, emp e2, dept d"
				+ "  where "
				+ "   e1.mgr = e2.empno"
				+ "   and"
				+ "   e1.deptno = d.deptno"
				+ "   ";
		
		
		
		ResultSet rs = stmt.executeQuery(sql);
		String content = "";
		
		int cnt = 0;
		
		while (rs.next()) {
			String empno = rs.getString("empno");
			String ename = rs.getString("ename");
			String job = rs.getString("job");
			String mgr_name = rs.getString("mgr_name");
			String dname = rs.getString("dname");
			String year1 = rs.getString("year1");
			
			content += empno + "," + ename
					 + "," +job  + "," +mgr_name + "," +dname
					 + "," + year1+"\n";
			// \n = 줄바꿈
		 cnt++;
		}
		
		
		
		File file = new File(downFilePath); // file 임포트
		FileWriter fw = new FileWriter(file,false); // false = 덮어쓰는개념
		fw.write(content);
		fw.close();
		
		//유닉스 시간 세팅
		cal = Calendar.getInstance();
		long t2 = cal.getTimeInMillis();
		
		System.out.println(cnt + "행 ");
		System.out.println( (t2-t1)/1000 + "초 ");
		System.out.println(downFilePath + "로 다운받았습니다.");
	
	}
	
}
