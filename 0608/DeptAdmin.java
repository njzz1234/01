package deptAdmin;

import java.util.Scanner;

import dept.DeptSelectList;
import dept.DeptInsert2;
import dept.DeptUpdate;
import dept.DeptDelete;

public class DeptAdmin {

	public static void main(String[] args) throws Exception{
		System.out.println("[부서정보 관리 시스템]");
		System.out.println("1.부서목록\n2.부서입력 \n3.부서변경\n4.부서삭제");
		Scanner scn = new Scanner(System.in);
		System.out.print("메뉴번호 >>");
		int menu = scn.nextInt();
		switch(menu) {
		case 1 : deptSelectList();
		break;
		case 2 : deptInsert();
		break;
		case 3 : deptUpdate();
		break;
		case 4 : deptDelete();
		break;
		default : System.out.println("없는 번호입니다.");
		}
	}
	private static void deptSelectList() {
		
	}
	private static void deptInsert() {
		
	}
	private static void deptUpdate() {
		
	}
	private static void deptDelete() {
		
	}

}
