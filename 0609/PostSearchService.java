package post;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import comm.DbConnect;

public class PostSearchService extends DbConnect {

	public static void main(String[] args) throws Exception {

		System.out.println("1.우편 번호 검색");
		System.out.println("2.도 검색");
		System.out.println("3.시구군 검색");
		System.out.println("4.읍면동리 검색");
		System.out.println("5.건물명 검색");
		Scanner scn = new Scanner(System.in);
		System.out.print("번호선택>>");
		
		try {
		int number = scn.nextInt();
		if (number >= 1 && number <= 5) {
			addrSearch(number);
		} else {
			System.out.println(" *** 잘못된 번호입니다 *** ");
		}
		} catch(Exception e) {
			System.out.println("비정상적인값");
		}
	
	}

	public static void addrSearch(int number) throws Exception {
		
		Statement stmt = Connection().createStatement();
		
		Scanner scn = new Scanner(System.in);
		String str = "";
		while( true) {
			System.out.println("검색어 입력>>");
			str = scn.next();
			if (str.equals("")) {
				continue;    // 반복문 재실행
			} else {
				break;	 // 반복문 종료
			}
		}
		
		String str1 = "";
		switch(number) {
		case 1 : str1= " a1='"+str+"' ";
			break;
		case 2 : str1= " a2 like '%"+str+"%' ";
			break;
		case 3 : str1= " a3 like '%"+str+"%' ";
			break;
		case 4 : str1= " a4 like '%"+str+"%' or a5 like '%"+str+"%' or a6 like '%\"+str+\"%'";
			break;
		case 5 : str1= " a7 like '%"+str+"%' ";
			break;
		default : str1 = " 1=1 ";
		
		}
		
		String sql = "select (a1||' '||a2||' '||a3||' '||a4 "
				+ "||' '||a5||' '||a6||' '||a7) as address"
				+ " from post1 "
				+ " where " + str1 ;
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("우편번호주소");
		System.out.println("-----------");
		int cnt = 0;
		while ( rs.next () ) {
			String address=rs.getString("address");
			System.out.println(address);
			cnt++;
		}
 		if ( cnt == 0) {
 			System.out.println("\n*** 검색 내용이 없습니다. ***");
 		}
			
	}
	
}
